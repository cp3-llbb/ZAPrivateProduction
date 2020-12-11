#!/bin/env python
# how to make mc request soon your grid pack are ready :https://indico.cern.ch/event/321290/contributions/744568/attachments/620452/853749/McM_Tutorial_OPT.pdf
#                                                       https://twiki.cern.ch/twiki/bin/view/CMSPublic/SWGuideSubgroupMC
import os
import math
import json
import shutil
import stat
import numpy as np
import argparse
from cp3_llbb.Calculators42HDM.Calc2HDM import *

import logging
LOG_LEVEL = logging.DEBUG
LOGFORMAT = "  %(log_color)s%(levelname)-8s%(reset)s | %(log_color)s%(message)s%(reset)s"
import colorlog
from colorlog import ColoredFormatter
logging.root.setLevel(LOG_LEVEL)
formatter = ColoredFormatter(LOGFORMAT)
stream = logging.StreamHandler()
stream.setLevel(LOG_LEVEL)
stream.setFormatter(formatter)
logger = logging.getLogger("ZA GridPack-PRODUCTION")
logger.setLevel(LOG_LEVEL)
logger.addHandler(stream)

CMSSW_Calculators42HDM = '/home/ucl/cp3/kjaffel/ZAPrivateProduction/CMSSW_10_2_22/src/cp3_llbb/Calculators42HDM'
MASSES_TEMPLATE='200_50_1'

parser = argparse.ArgumentParser(description='Preparing Grid Pack for 2HDM H/A-> Z(->ll) A/H(->bb) for full run2 II')
parser.add_argument('-m', '--mode', action='store',
                                    dest= 'mode',
                                    default='1nh',
                                    choices=['condor', 'condor_spool', '1nh'],
                                    type=str,
                                    help='')
parser.add_argument('-pdf', '--lhapdfsets',   action='store', 
                                              dest='lhapdfsets', 
                                              default=None, 
                                              type=str, 
                                              help='Few links may help you to make the choice :\n https://twiki.cern.ch/twiki/bin/view/CMS/QuickGuideMadGraph5aMCatNLO#PDF_Choice_for_2017_production\n https://monte-carlo-production-tools.gitbook.io/project/mccontact/info-for-mc-production-for-ultra-legacy-campaigns-2016-2017-2018\n')
parser.add_argument('-lhaid', '--lhaid', action='store',
                                         dest='lhaid',
                                         default='$DEFAULT_PDF_SETS',
                                         type=str,
                                         help = '')
parser.add_argument('-prod', '--mc_prodversion',   action='store', 
                                                   dest='mc_prodversion', 
                                                   default='UL2019', 
                                                   choices=['2017prod', 'UL2019'], 
                                                   type=str, 
                                                   help='MC production version : Important step to determine LHA PDF SETS WILL BE USED LATER')
options = parser.parse_args()

def which_points(grid):
    grid['fullsim'] = [
            #(MH, MA)
            ( 200, 50), ( 200, 100),
            ( 250, 50), ( 250, 100),
            ( 300, 50), ( 300, 100), ( 300, 200),
            ( 500, 50), ( 500, 100), ( 500, 200), ( 500, 300), ( 500, 400),
            ( 650, 50),
            ( 800, 50), ( 800, 100), ( 800, 200),              ( 800, 400),              ( 800, 700),
            (1000, 50),              (1000, 200),                           (1000, 500),
        ]
    with open('data/points_1.000000_1.000000.json') as f:
        d = json.load(f)
        # format the output into tuples
        grid['ellipses_rho_1'] = [(mH, mA,) for mA, mH in d]
    
    with open('data/points_0.500000_0.500000.json') as f:
        d = json.load(f)
        # format the output into tuples
        grid['ellipses_rho_0p5'] = [(mH, mA,) for mA, mH in d]
    return grid

def mass_to_string(m):
    r = '{:.2f}'.format(m)
    r = r.replace('.', 'p')
    return r

def float_to_mass(m):
    r = '{:.2f}'.format(m)
    return float(r)

def compute_widths_and_lambdas(mH, mA, mh, tb):
    # Alex's PhD thesis parameters
    global options
    global lhaid

    mode = 'H'
    sqrts = 13000
    type = 2
    mh = mh
    cba = 0.01  #  cos( beta -alpha) " should not be changed: that's the alignement limit 
    sinbma = math.sqrt(1 - pow(cba, 2))
    mhc = max(mH, mA)
    m12 = math.sqrt(pow(mhc, 2) * tb / (1 + pow(tb, 2)))
    outputFile = 'out_mH-{}_mA-{}_tb-{}.dat'.format(mass_to_string(mH), mass_to_string(mA), mass_to_string( tb))
    cwd = os.getcwd()
    #os.chdir(os.path.join(CMSSW_Calculators42HDM, 'out'))
    os.chdir(CMSSW_Calculators42HDM)
    test = Calc2HDM(mode = mode, sqrts = sqrts, type = type,
        tb = tb, m12 = m12, mh = mh, mH = mH, mA = mA, mhc = mhc, sba = sinbma,
        outputFile = outputFile, muR = 1., muF = 1.)
   
    if options.lhaid is '$DEFAULT_PDF_SETS':
        logger.info( 'the following   ** $DEFAULT_PDF_SETS ** shortcuts to have the PDF sets automatically added to the run_card at run time to avoid specifying them directly. Be careful this is valid at both LO and NLO !')
    else:
        lhaid = options.lhaid
    
    if options.mc_prodversion =='UL2019':
        if options.lhapdfsets is None: 
            logger.info( 'No PDFSETS is given !**  LHA PDF set = NNPDF31  # Positive definite 4Flavor-scheme set will be used instead\n LHA Name = NNPDF31_nnlo_as_0118_nf_4_mc_hessian\n LHA ID = 325500\n make sure this is compatible with the generated process in the proc_card and lhaid in the run_card **\n'
                )
            test.setpdf('NNPDF31_nnlo_as_0118_nf_4_mc_hessian')
            lhaid = 325500
        else:
            test.setpdf(options.lhapdfsets )
    elif options.mc_prodversion =='2017prod':
        if options.lhapdfsets is None: 
            logger.info( 'No PDFSETS is given !**  LHA PDF set = NNPDF31  # NON Positive definite 4Flavor-scheme set will be used instead\n LHA Name = NNPDF31_nnlo_as_0118_nf_4\n LHA ID = 320900\n make sure this is compatible with the generated process in the proc_card and lhaid in the run_card **\n'
                )
            test.setpdf('NNPDF31_nnlo_as_0118_nf_4')
            lhaid = 320900
        else:
            test.setpdf(options.lhapdfsets )
    
    test.computeBR()
    wH = float(test.Hwidth)
    wA = float(test.Awidth)
    l2 = float(test.lambda_2)
    l3 = float(test.lambda_3)
    lR7 = float(test.lambda_7)
    os.chdir(cwd)
    return wH, wA, l2, l3, lR7, sinbma, tb

def filename(suffix, template=False, mH=None, mA=None, tb=None):
    tmp = ''
    masses = ''
    if template:
        tmp = 'template_'
        masses = MASSES_TEMPLATE
    else:
        masses = '{}_{}_{}'.format(mass_to_string(mH), mass_to_string(mA), mass_to_string( tb))
    return 'PrivateProd_run2/'+ tmp + 'HToZATo2L2B_' + masses + '/HToZATo2L2B_' + masses + '_' + suffix +'.dat'

def prepare_cards(mH, mA, mh, wH, wA, l2, l3, lR7, sinbma, tb):
    process_name = 'HToZATo2L2B_{}_{}_{}'.format(mass_to_string(mH), mass_to_string(mA), mass_to_string( tb))
    directory = 'PrivateProd_run2/'+ process_name
    # First: create directory if it doesn't exist
    if not os.path.exists(directory):
        os.makedirs(directory)
    # customizecards
    suffix = 'customizecards'
    template_line = 'set param_card'
    with open(filename(suffix, template=True), 'r') as inf:
        with open(filename(suffix, mH=mH, mA=mA, tb=tb), 'w+') as outf:
            for line in inf:
                if template_line in line and 'higgs 1' in line:
                    outf.write('{} higgs 1 {:.6f}\n'.format(template_line, l2))
                elif template_line in line and 'higgs 2' in line:
                    outf.write('{} higgs 2 {:.6f}\n'.format(template_line, l3))
                elif template_line in line and 'higgs 3' in line:
                    outf.write('{} higgs 3 {:.6f}\n'.format(template_line, lR7))
                
                elif template_line in line and 'mass 25' in line:
                    outf.write('{} mass 25 {:.2f}\n'.format(template_line, mh))
                elif template_line in line and 'mass 36' in line:
                    outf.write('{} mass 36 {:.2f}\n'.format(template_line, mA))
                elif template_line in line and 'mass 35' in line:
                    outf.write('{} mass 35 {:.2f}\n'.format(template_line, mH))
                
                elif template_line in line and 'width 36' in line:
                    outf.write('{} width 36 {:.6f}\n'.format(template_line, wA))
                elif template_line in line and 'width 35' in line:
                    outf.write('{} width 35 {:.6f}\n'.format(template_line, wH))
                
                elif template_line in line and 'frblock 1' in line:
                    outf.write('{} frblock 1 {:.6f}\n'.format(template_line, tb))
                elif template_line in line and 'frblock 2' in line:
                    outf.write('{} frblock 2 {:.6f}\n'.format(template_line, sinbma))
                
                else:
                    outf.write(line)
            outf.write('# higgs 1: lambda 2\n')
            outf.write('# higgs 2: lambda 3\n')
            outf.write('# higgs 3: lambda Real 7\n')
            outf.write('# mass 25: mh\n')
            outf.write('# mass 36: mA\n')
            outf.write('# mass 35: mH\n')
            outf.write('# width 36: wA\n')
            outf.write('# width 35: wH\n')
            outf.write('# frblock 1: tb\n')
            outf.write('# frblock 2: sinbma\n')
    # extramodels: no change needed
    suffix = 'extramodels'
    shutil.copyfile(filename(suffix, template=True), filename(suffix, mH=mH, mA=mA, tb=tb))
    # proc_card: change the output name
    suffix = 'proc_card'
    with open(filename(suffix, template=True), 'r') as inf:
        with open(filename(suffix, mH=mH, mA=mA, tb=tb), 'w+') as outf:
            for line in inf:
                if ('output HToZATo2L2B_' + MASSES_TEMPLATE) in line:
                    outf.write('output HToZATo2L2B_{}_{}_{}'.format(mass_to_string(mH), mass_to_string(mA), mass_to_string(tb)))
                else:
                    outf.write(line)
    # run_card: no change needed
    suffix = 'run_card'
    with open(filename(suffix, template=True), 'r') as inf:
         with open(filename(suffix, mH=mH, mA=mA, tb=tb), 'w+') as outf:
             for line in inf:
                 if 'lhaid' in line:
                     outf.write('{} = lhaid ! if pdlabel=lhapdf, this is the lhapdf number\n'.format(lhaid))
                     if options.lhaid is '$DEFAULT_PDF_SETS':
                         outf.write('$DEFAULT_PDF_MEMBERS  = reweight_PDF\n')
                 else:
                     outf.write(line)
    #shutil.copyfile(filename(suffix, template=True), filename(suffix, mH=mH, mA=mA, tb=tb))
    # exit
    print ('MG5 files prepared in PrivateProd_run2/HToZATo2L2B_{}_{}_{}'.format(mass_to_string(mH), mass_to_string(mA), mass_to_string(tb)))
    return

def prepare_all_MG5_cards():
    grid = {}
    grid = which_points(grid)
    tb_list = np.arange(1., 11., 1.)
    mh=125.0
    with open('prepare_all_gridpacks.sh', 'w+') as outf:
        outf.write('# Please run the following on lxplus\n')
        outf.write('# Notes:\n')
        outf.write('# - the instructions will not run on ingrid\n')
        outf.write('# - you must not have setup any cmsenv\n')
        outf.write('# - each gridpack generation should take about 5 minutes\n')
        outf.write('set -x\n')
        outf.write('git clone -o upstream git@github.com:cp3-llbb/ZAPrivateProduction.git\n')
        outf.write('pushd ZAPrivateProduction\n')
        outf.write('git remote add origin git@github.com:kjaffel/ZAPrivateProduction.git\n')
        outf.write('git clone -o upstream https://github.com/cms-sw/genproductions.git\n')
        outf.write('pushd genproductions\n')
        outf.write('git checkout UL2019\n')
        outf.write('git pull\n')
        outf.write('pushd bin/MadGraph5_aMCatNLO/cards/production/13TeV/higgs/HToZATo2L2B\n')
        outf.write('ln -s -d ../../../../../../../../PrivateProd_run2 .\n')
        outf.write('popd\n')
        outf.write('pushd bin/MadGraph5_aMCatNLO\n')
        outf.write('# Now for the real gridpack production\n')
        if 'condor' in options.mode:
            outf.write('./submit_condor_gridpack_generation.sh\n')
        #for H, A in (grid['fullsim'] + grid['ellipses_rho_1']): # TODO 
        for H, A in (grid['fullsim']):
            mH = float_to_mass(H)
            mA = float_to_mass(A)
            #FIXME : I DON'T SEE A RASON FOR SKIPPING THESE POINTS
            #if mH < 125.:
            #    s = '# skipping point (mH, mA) = ({}, {})'.format(mH, mA)
            #    print (s)
            #    outf.write(s + '\n')
            #    continue
            for tb in tb_list:
                wH, wA, l2, l3, lR7, sinbma, tb = compute_widths_and_lambdas(mH, mA, mh, tb)
                prepare_cards(mH, mA, mh, wH, wA, l2, l3, lR7, sinbma, tb)
                outf.write('./gridpack_generation.sh HToZATo2L2B_{1}_{2}_{0} cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_{1}_{2}_{0} {3}\n'.format(mass_to_string( tb), mass_to_string(mH), mass_to_string(mA), options.mode))
        outf.write('set +x\n')
    os.chmod('prepare_all_gridpacks.sh', os.stat('prepare_all_gridpacks.sh').st_mode | stat.S_IXUSR)
    print ('All commands prepared in ./prepare_all_gridpacks.sh')



if __name__ == '__main__':
    prepare_all_MG5_cards()
