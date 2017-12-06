#!/bin/env python
import os
import math
import json
import shutil
import stat
from cp3_llbb.Calculators42HDM.Calc2HDM import *
CMSSW_Calculators42HDM = 'CMSSW_7_1_20_patch2/src/cp3_llbb/Calculators42HDM'
MASSES_TEMPLATE='200_50'

def which_points(grid):
    grid['fullsim'] = [
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

def compute_widths_and_lambdas(mH, mA):
    # Alex's PhD thesis parameters
    mode = 'H'
    sqrts = 13000
    type = 2
    mh = 125
    tb = 1.5
    cba = 0.01
    sba = math.sqrt(1 - pow(cba, 2))
    mhc = max(mH, mA)
    m12 = math.sqrt(pow(mhc, 2) * tb / (1 + pow(tb, 2)))
    outputFile = 'out_mH-{}_mA-{}.dat'.format(mass_to_string(mH), mass_to_string(mA))
    cwd = os.getcwd()
    os.chdir(CMSSW_Calculators42HDM)
    test = Calc2HDM(mode = mode, sqrts = sqrts, type = type,
        tb = tb, m12 = m12, mh = mh, mH = mH, mA = mA, mhc = mhc, sba = sba,
        outputFile = outputFile, muR = 1., muF = 1.)
    test.setpdf('NNPDF30_lo_as_0130_nf_4')
    test.computeBR()
    wH = float(test.Hwidth)
    wA = float(test.Awidth)
    l2 = float(test.lambda_2)
    l3 = float(test.lambda_3)
    lR7 = float(test.lambda_7)
    os.chdir(cwd)
    return wH, wA, l2, l3, lR7

def filename(suffix, template=False, mH=None, mA=None):
    tmp = ''
    masses = ''
    if template:
        tmp = 'template_'
        masses = MASSES_TEMPLATE
    else:
        masses = '{}_{}'.format(mass_to_string(mH), mass_to_string(mA))
    return 'PrivateProd/' + tmp + 'HToZATo2L2B_' + masses + '/HToZATo2L2B_' + masses + '_' + suffix + '.dat'

def prepare_cards(mH, mA, wH, wA, l2, l3, lR7):
    process_name = 'HToZATo2L2B_{}_{}'.format(mass_to_string(mH), mass_to_string(mA))
    directory = 'PrivateProd/' + process_name
    # First: create directory if it doesn't exist
    if not os.path.exists(directory):
        os.makedirs(directory)
    # customizecards
    suffix = 'customizecards'
    template_line = 'set param_card'
    with open(filename(suffix, template=True), 'r') as inf:
        with open(filename(suffix, mH=mH, mA=mA), 'w+') as outf:
            for line in inf:
                if template_line in line and 'higgs 1' in line:
                    outf.write('{} higgs 1 {:.6f}\n'.format(template_line, l2))
                elif template_line in line and 'higgs 2' in line:
                    outf.write('{} higgs 2 {:.6f}\n'.format(template_line, l3))
                elif template_line in line and 'higgs 3' in line:
                    outf.write('{} higgs 3 {:.6f}\n'.format(template_line, lR7))
                elif template_line in line and 'mass 36' in line:
                    outf.write('{} mass 36 {:.2f}\n'.format(template_line, mA))
                elif template_line in line and 'mass 35' in line:
                    outf.write('{} mass 35 {:.2f}\n'.format(template_line, mH))
                elif template_line in line and 'width 36' in line:
                    outf.write('{} width 36 {:.6f}\n'.format(template_line, wA))
                elif template_line in line and 'width 35' in line:
                    outf.write('{} width 35 {:.6f}\n'.format(template_line, wH))
                else:
                    outf.write(line)
            outf.write('# higgs 1: lambda 2\n')
            outf.write('# higgs 2: lambda 3\n')
            outf.write('# higgs 3: lambda Real 7\n')
            outf.write('# mass 36: mA\n')
            outf.write('# mass 35: mH\n')
            outf.write('# width 36: wA\n')
            outf.write('# width 35: wH\n')
    # extramodels: no change needed
    suffix = 'extramodels'
    shutil.copyfile(filename(suffix, template=True), filename(suffix, mH=mH, mA=mA))
    # proc_card: change the output name
    suffix = 'proc_card'
    with open(filename(suffix, template=True), 'r') as inf:
        with open(filename(suffix, mH=mH, mA=mA), 'w+') as outf:
            for line in inf:
                if ('output HToZATo2L2B_' + MASSES_TEMPLATE) in line:
                    outf.write('output HToZATo2L2B_{}_{}'.format(mass_to_string(mH), mass_to_string(mA)))
                else:
                    outf.write(line)
    # run_card: no change needed
    suffix = 'run_card'
    shutil.copyfile(filename(suffix, template=True), filename(suffix, mH=mH, mA=mA))
    # exit
    print 'MG5 files prepared in PrivateProd/HToZATo2L2B_{}_{}'.format(mass_to_string(mH), mass_to_string(mA))
    return

def prepare_all_MG5_cards():
    grid = {}
    grid = which_points(grid)
    with open('prepare_all_gridpacks.sh', 'w+') as outf:
        outf.write('# Please run the following on lxplus\n')
        outf.write('# Notes:\n')
        outf.write('# - the instructions will not run on ingrid\n')
        outf.write('# - you must not have setup any cmsenv\n')
        outf.write('# - each gridpack generation should take about 5 minutes\n')
        outf.write('set -x\n')
        outf.write('git clone -o upstream git@github.com:cp3-llbb/ZAPrivateProduction.git\n')
        outf.write('pushd ZAPrivateProduction\n')
        outf.write('git clone -o upstream https://github.com/cms-sw/genproductions.git\n')
        outf.write('pushd genproductions\n')
        outf.write('git co 60013422c59c7c56c39441896f296cb371094777\n')
        outf.write('pushd bin/MadGraph5_aMCatNLO/cards/production/13TeV/higgs/HToZATo2L2B\n')
        outf.write('ln -s -d ../../../../../../../../PrivateProd .\n')
        outf.write('popd\n')
        outf.write('pushd bin/MadGraph5_aMCatNLO\n')
        outf.write('# Now for the real gridpack production\n')
        for H, A in grid['fullsim']:
            mH = float_to_mass(H)
            mA = float_to_mass(A)
            wH, wA, l2, l3, lR7 = compute_widths_and_lambdas(mH, mA)
            prepare_cards(mH, mA, wH, wA, l2, l3, lR7)
            outf.write('./gridpack_generation.sh HToZATo2L2B_{0}_{1} cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_{0}_{1} 1nh\n'.format(mass_to_string(mH), mass_to_string(mA)))
            break
        outf.write('set +x\n')
    os.chmod('prepare_all_gridpacks.sh', os.stat('prepare_all_gridpacks.sh').st_mode | stat.S_IXUSR)
    print 'All commands prepared in ./prepare_all_gridpacks.sh'



if __name__ == '__main__':
    prepare_all_MG5_cards()
