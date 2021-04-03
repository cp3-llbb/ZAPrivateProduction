#!/bin/env python
import os
import math
import json
import shutil
import stat
import argparse, optparse
from cp3_llbb.Calculators42HDM.Calc2HDM import *

import logging
LOG_LEVEL = logging.DEBUG
stream = logging.StreamHandler()
stream.setLevel(LOG_LEVEL)
logger = logging.getLogger("ZA GridPack-PRODUCTION")
logger.setLevel(LOG_LEVEL)
logger.addHandler(stream)
try:
    import colorlog
    from colorlog import ColoredFormatter
    LOGFORMAT = "  %(log_color)s%(levelname)-8s%(reset)s | %(log_color)s%(message)s%(reset)s"
    formatter = ColoredFormatter(LOGFORMAT)
    stream.setFormatter(formatter)
except ImportError:
    pass

if "CMSSW_BASE" not in os.environ:
    raise RuntimeError("This script needs to be run in a CMSSW environment, with cp3_llbb/Calculators42HDM set up")
CMSSW_Calculators42HDM = os.path.join(os.environ["CMSSW_BASE"], "src", "cp3_llbb", "Calculators42HDM")

def mass_to_string(m):
    r = '{:.2f}'.format(m)
    r = r.replace('.', 'p')
    return r

def call_Calculators42HDM(mH=None, mA=None, mh=None, mhc=None, tb=None):
    type = 2
    sqrts = 13000
    cba = 0.01  
    alpha=math.atan(tb)-math.acos(cba)
    sinbma = math.sin(math.atan(tb)-alpha)
    m12 = math.sqrt(pow(mhc, 2) * tb / (1 + pow(tb, 2)))
    
    outputFile = 'out_param_card_{}_{}_{}.dat'.format(mass_to_string(mH), mass_to_string(mA), mass_to_string( tb))
    cwd = os.getcwd()
    #os.chdir(os.path.join(CMSSW_Calculators42HDM, 'out'))
    os.chdir(CMSSW_Calculators42HDM)
    
    if mA > mH:
        logger.info("MA_{} > MH_{} switching to A->ZH mode!".format(mA, mH))
        mode = 'A'
    elif mH >= mA and mH> 125.:
        logger.info("MA_{} =< MH_{} switching to H->ZA mode!".format(mA, mH))
        mode = 'H'
    elif mH >= mA and mH <= 125.:
        logger.info("MA_{} >= MH_{} && H <= 125. GeV switching to h->ZH mode!".format(mA, mH))
        mode ='h'

    res = Calc2HDM(mode = mode, sqrts = sqrts, type = type,
                               tb = tb, m12 = m12, mh = mh, mH = mH, mA = mA, mhc = mhc, sba = sinbma,
                                                  outputFile = outputFile, muR = 9.118800e+01, muF = 9.118800e+01)
    res.setpdf('NNPDF31_nnlo_as_0118_nf_4_mc_hessian')
    res.computeBR()
    
    l2 = float(res.lambda_2)
    l3 = float(res.lambda_3)
    lR7 = float(res.lambda_7)
    wh3tobb = res.wh3tobb
    wh3tot = float(res.Awidth)
    os.chdir(cwd) 
    # mv these file in the end , otherwise Calc2HDM won't run properly 
    #shutil.move(outputFile, './widths_crosschecks/run_2hdmc180/')
    return l2, l3, lR7, wh3tot, wh3tobb, sinbma

def call_BottomYukawacoupling(mh3=None, tanbeta=None, wh3tobb=None):
    MB = 4.75 # mb pole mass
    aEWM1= 127.9
    aEW = 1./aEWM1
    Gf = 1.166390e-05

    MZ= 9.118760e+01
    MW= math.sqrt(MZ**2/2. + math.sqrt(MZ**4/4. - (aEW*math.pi*MZ**2)/(Gf*math.sqrt(2))))

    ee = 2*math.sqrt(aEW)*math.sqrt(math.pi)
    sw2 = 1 - MW**2/MZ**2
    sw = math.sqrt(sw2)

    vev = (2*MW*sw)/ee
    TH3x3 = 1.
    const2 = (8.*math.pi*vev**2*abs(mh3)**3)
    const1 = (3*mh3**2*tanbeta**2*TH3x3**2*math.sqrt(-4*MB**2*mh3**2 + mh3**4))

    ymb = math.sqrt((const2 * wh3tobb)/const1)
    yb = ((ymb*math.sqrt(2))/vev)
    return ymb

def prepare_parameters(mH=None, mA=None, mh=None, mhc=None, MB=None, l2=None, l3=None, lR7=None, sinbma=None, tb=None, ymb=None, pass_ymbandmb_toparamcards=False):
    with open(os.path.join('widths_crosschecks', 'template_param_card.dat'), 'r') as inf:
        
        inCARDSDIR = '{}/inputs'.format('run_afterYukawaFix' if pass_ymbandmb_toparamcards else('run_beforeYukawaFix') )
        if not os.path.exists(inCARDSDIR):
            os.makedirs(inCARDSDIR)
        
        with open(os.path.join("./widths_crosschecks", inCARDSDIR, "in_param_card_{}_{}_{}.dat".format(mass_to_string(mH), mass_to_string(mA), mass_to_string(tb))), 'w+') as outf:
            for line in inf:
                # BLOCK MASS #
                if " MB " in line and not pass_ymbandmb_toparamcards:
                    outf.write('      5 {:.6f}   # MB\n'.format(MB))
                elif "mhc" in line and not pass_ymbandmb_toparamcards:
                    outf.write('      37 {:.6f}   # mhc\n'.format(mhc))
                # BLOCK YUKAWA # 
                elif "ymb" in line and not pass_ymbandmb_toparamcards:
                    outf.write('      5 {:.8f}   # ymb\n'.format(ymb))
                # BLOCK FRBLOCK # 
                elif "tanbeta" in line:
                    outf.write('      1 {:.6f}   # tanbeta\n'.format(tb))
                elif "sinbma" in line:
                    outf.write('      2 {:.8f}   # sinbma\n'.format(sinbma))
                # BLOCK HIGGS # 
                elif "l2" in line:
                    outf.write('      1 {:.6f}   # l2\n'.format(l2))
                elif "l3" in line:
                    outf.write('      2 {:.6f}   # l3\n'.format(l3))
                elif "lR7" in line:
                    outf.write('      3 {:.6f}   # lR7\n'.format(lR7))
                # BLOCK MASS #
                elif "mh1" in line:
                    outf.write('      25 {:.6f}   # mh1\n'.format(mh))
                elif "mh2" in line:
                    outf.write('      35 {:.6f}   # mh2\n'.format(mH))
                elif "mh3" in line:
                    outf.write('      36 {:.6f}   # mh3\n'.format(mA))
                else:
                    outf.write(line)
    return

def prepare_computewidths_script(run_beforeYukawaFix=False, run_afterYukawaFix=False):
    with open('run_madwidths.sh', 'w+') as outf:
        outf.write('import model 2HDMtII_NLO\n')
        
        mh3=50.
        mh=125.
        MZ= 9.118760e+01
        MB= 4.75
        while mh3 < 1500.:
            mH= mh3+MZ
            mA= mh3
            mhc=max(mH, mA)
            for tb in [1.5, 20.]:
                l2, l3, lR7, wh3tot, wh3tobb, sinbma = call_Calculators42HDM( mH, mA, mh, mhc, tb)
                ymb = call_BottomYukawacoupling(mA, tb, wh3tobb)
               
                if run_beforeYukawaFix:
                    prepare_parameters(mH, mA, mh, mhc, MB, l2, l3, lR7, sinbma, tb, ymb, pass_ymbandmb_toparamcards=False)
                    inputsfiles= './widths_crosschecks/run_afterYukawaFix/inputs/in_param_card_{}_{}_{}.dat'.format(mass_to_string(mH), mass_to_string(mA), mass_to_string(tb))
                    outputsfiles= './widths_crosschecks/run_afterYukawaFix/outputs/out_param_card_{}_{}_{}.dat'.format(mass_to_string(mH), mass_to_string(mA), mass_to_string(tb))
                    outf.write('compute_widths h1 h2 h3 --path={} --output={} --body_decay=2\n'.format(inputsfiles, outputsfiles))
                if run_afterYukawaFix:
                    prepare_parameters(mH, mA, mh, mhc, MB, l2, l3, lR7, sinbma, tb, ymb, pass_ymbandmb_toparamcards=True)
                    inputsfiles= './widths_crosschecks/run_beforeYukawaFix/inputs/in_param_card_{}_{}_{}.dat'.format(mass_to_string(mH), mass_to_string(mA), mass_to_string(tb))
                    outputsfiles= './widths_crosschecks/run_beforeYukawaFix/outputs/out_param_card_{}_{}_{}.dat'.format(mass_to_string(mH), mass_to_string(mA), mass_to_string(tb))
                    outf.write('compute_widths h1 h2 h3 --path={} --output={} --body_decay=2\n'.format(inputsfiles, outputsfiles))
            mh3 += 50.
    os.chmod('run_madwidths.sh', os.stat('run_madwidths.sh').st_mode | stat.S_IXUSR)

if __name__ == '__main__':
    
    parser = argparse.ArgumentParser(description='Prepare Param cards', formatter_class=argparse.RawTextHelpFormatter)
    parser.add_argument('--run_beforeYukawaFix', action='store_true', help=' Yukawa coupling == MB == 4.7 GeV')
    parser.add_argument('--run_afterYukawaFix', action='store_true', help='compute yukawa coupling and propagate the values to the param_cards')
    options = parser.parse_args()    
    prepare_computewidths_script(run_beforeYukawaFix= options.run_beforeYukawaFix, run_afterYukawaFix=options.run_afterYukawaFix)
