# Khawla: Full RunII H/A->ZA/H->llbb 
## GridPacks production and events generation for full run2 ULegacy
## Setup Your Enviroment and Prepare Template cards:
This needs 2HDMC, which is a general-purpose calculator for the two-Higgs doublet model.
It allows parametrization of the Higgs potential in many different ways, convenient specification of generic Yukawa sectors, the evaluation of decay widths (including higher-order QCD corrections), theoretical constraints and much more.

You can install Calculators42HDM in a CMSSW release (recommended)
or a conda environment (which requires a few changes to the script), see the [installation instructions](https://github.com/kjaffel/Calculators42HDM/blob/master/README.md).
## GridPacks Preparation:
### Example of Template Cards:
- For each process we have a dir template, whatever changes you need to make it has to be for these cards Only !
```bash
# gg Fusion; LO Loop Induced 4F-scheme
cd run2Template_cards/template_HToZATo2L2B_200_50_1_ggH_TuneCP5_13TeV_pythia8`
# b-associated Production; NLO 4F-scheme
cd run2Template_cards/template_HToZATo2L2B_200_50_1_bbH4F_TuneCP5_13TeV-amcatnlo_pythia8`
```
### How to Run:
```python
./prepare_MG5_cards.py --process bbH --test --templates run2Template_cards
```
- ``-p``/``process``: bbH or ggH
- ``-q``/``--queue``: condor, slurm or 1nh 
- ``--templates`` : a directory with run cards for the two processes, each in a subdirectory
- ``--gridpoints``: a directory with the JSON files with (mA, mH) points definitions
- ``--test`` : will produce 1 set of cards for each process, saved by default in ``example_cards/``, remove these args to get the full list of ZAsamples for run2ULegacy saved by default in ``PrivateProd_run2``
- ``--lhaid``: will be set to ``$DEFAULT_PDF_SETS`` as shortcuts to have the PDF sets automatically
               and added to the ``run_card`` at run time to avoid specifying them directly
    ```
    lhapdf = pdlabel ! PDF set
    $DEFAULT_PDF_SETS = lhaid
    $DEFAULT_PDF_MEMBERS  = reweight_PDF
    ```
## GridPacks Generation:
Inside the cards output directory (``example_cards`` or ``PrivateProd_run2``) a simple shell script is generated to produce all the gridpacks for each process.
```bash
./prepare_example_nlo_gridpacks.sh
./prepare_example_lo_gridpacks.sh
```
## Trouble-Shooting:
- For long jobs, the afs permissions may expire for the master job and it's subprocesses before completion, which will result in file read errors and failure. The command `k5reauth` allows the kerberos 5 permissions to be updated for a job and its subprocesses. Instructions to obtain and start a tmux session with k5reauth are given[here](https://hsf-training.github.io/analysis-essentials/shell-extras/screen2.html) and [here](https://twiki.cern.ch/twiki/bin/viewauth/CMS/QuickGuideMadGraph5aMCatNLO)
- Let's define 'ktmux' function in your ~/.bashrc by adding the  following lines:
```bash
ktmux(){
    if [[ -z "$1" ]]; then #if no argument passed
        k5reauth -f -i 3600 -p <your account name> -k <path_to_your_keytab>/<your account name>.keytab -- tmux new-session
    else #pass the argument as the tmux session name
        k5reauth -f -i 3600 -p <your account name> -k <path_to_your_keytab>/<your account name>.keytab -- tmux new-session -s $1
    fi
}
```

## Computing decay rates for 2HDM with FeynRules and MadGraph5aMC@NLO :[arxiv.1402.1178](https://arxiv.org/pdf/1402.1178.pdf)
```python
python prepare_paramcard.py --run_beforeYukawaFix --run_afterYukawaFix
```
```bash
cd MG5_aMC_vX_X_X
./bin/mg5_aMC run_madwidths.sh
```
```python
python comparewidths_and_BR.py --default_cardsDIR=./widths_crosschecks/run_beforeYukawaFix/outputs/ --madspin_cardsDIR=./widths_crosschecks/run_afterYukawaFix/outputs/ 
# more options 
--thdmc_cardsDIR : if not given Calculators42HDM will recompute the width of h3 in range(50., 1500.)
--BR             : plot BR( H1 -> bb)
--NWA            : plot TotalWidth/M(h3) = f(mh3)
```

# Alessia: ZA Private production
Starting point: [MCM of one of our MiniAOD signal samples](https://cms-pdmv.cern.ch/mcm/requests?prepid=HIG-RunIISummer16MiniAODv2-01385&page=0&shown=127), from which you can find the [MCM chain](https://cms-pdmv.cern.ch/mcm/chained_requests?prepid=HIG-chain_RunIIWinter15wmLHE_flowLHE2Summer15GS_flowRunIISummer16DR80PremixPUMoriond17_flowRunIISummer16PremixMiniAODv2-00591&page=0&shown=15) where it links all of the steps.
## Initial setup
```bash
cms_env
git clone -o upstream git@github.com:cp3-llbb/ZAPrivateProduction.git
pushd ZAPrivateProduction
git clone -o upstream https://github.com/cms-sw/genproductions.git
# Two CMSSW releases are needed:
export SCRAM_ARCH=slc6_amd64_gcc481
scram p CMSSW CMSSW_7_1_20_patch2
export SCRAM_ARCH=slc6_amd64_gcc530
scram p CMSSW CMSSW_8_0_21
```
## Preparing gridpacks
```bash
# Fetch some cards to modify
mkdir PrivateProd
pushd genproductions
git co 60013422c59c7c56c39441896f296cb371094777
pushd bin/MadGraph5_aMCatNLO/cards/production/13TeV/higgs/HToZATo2L2B
ln -s -d ../../../../../../../../PrivateProd .
cp -r HToZATo2L2B_200_50 PrivateProd/template_HToZATo2L2B_200_50
popd
popd
# Before preparing the actual cards we need to get the widths and other inputs from 2HDMC, so let's get Calculator42HDM first
pushd CMSSW_7_1_20_patch2/src
wget https://raw.githubusercontent.com/cp3-llbb/Calculators42HDM/master/install_ingrid.sh
source install_ingrid.sh
cd ..
# Test your install
pushd CMSSW_7_1_20_patch2/src/cp3_llbb/Calculators42HDM
python example/test.py
popd
# And now prepare all the cards
./prepare_MG5_cards.py
# Separately, on lxplus, prepare all the gridpacks:
wget https://raw.githubusercontent.com/cp3-llbb/ZAPrivateProduction/master/prepare_all_gridpacks.sh
bash prepare_all_gridpacks.sh
```

## wmLHE step
```bash
# template CRAB and CMSSW configs have been created with 
# cmsDriver.py Configuration/GenProduction/python/HToZATo2L2B_200p00_50p00_wmLHE.py --fileout file:HToZATo2L2B_200p00_50p00_wmLHE.root --mc --eventcontent LHE --datatier LHE --conditions MCRUN2_71_V1::All --step LHE --python_filename HToZATo2L2B_200p00_50p00_wmLHE_cfg.py --no_exec --customise Configuration/DataProcessing/Utils.addMonitoring -n 10000
# These templates are stored in the wmLHE directory
# NB: a dedicated script `download_gridpack_then_cmsRun.sh` has been created to hack around the fact that I cannot directly store gridpacks on eos, so I'm using this executable to first download the gridpack before running cmsRun

# First we need to get a more recent python version: let's do a cmsenv first
pushd CMSSW_7_1_20_patch2/src
cmsenv
popd
# Prepare all the jobs (CMSSW and CRAB configs)
./prepare_wmLHE_step.py
# Submit all the tasks
pushd CMSSW_7_1_20_patch2/src
for j in `'ls' crab_*py`; do echo -e "\n## submitting ${j}"; crab submit ${j}; done
```

# More details and links for reference:
### CMSSW python fragment:
```python
import FWCore.ParameterSet.Config as cms

# link to cards:
# https://github.com/cms-sw/genproductions/tree/60013422c59c7c56c39441896f296cb371094777/bin/MadGraph5_aMCatNLO/cards/production/13TeV/higgs/HToZATo2L2B/HToZATo2L2B_200_50

externalLHEProducer = cms.EDProducer("ExternalLHEProducer",
    args = cms.vstring('/cvmfs/cms.cern.ch/phys_generator/gridpacks/slc6_amd64_gcc481/13TeV/madgraph/V5_2.3.2.2/HToZA/v1/HToZATo2L2B_200_50_tarball.tar.xz'),
    nEvents = cms.untracked.uint32(5000),
    numberOfParameters = cms.uint32(1),
    outputFile = cms.string('cmsgrid_final.lhe'),
    scriptName = cms.FileInPath('GeneratorInterface/LHEInterface/data/run_generic_tarball_cvmfs.sh')
)
```
### [MG5 cards](https://github.com/cms-sw/genproductions/tree/60013422c59c7c56c39441896f296cb371094777/bin/MadGraph5_aMCatNLO/cards/production/13TeV/higgs/HToZATo2L2B/HToZATo2L2B_200_50)

## wmLHE step [MCM link](https://cms-pdmv.cern.ch/mcm/requests?prepid=HIG-RunIIWinter15wmLHE-00920&page=0&shown=127)
```bash
#!/bin/bash
source /cvmfs/cms.cern.ch/cmsset_default.sh
export SCRAM_ARCH=slc6_amd64_gcc481
if [ -r CMSSW_7_1_20_patch2/src ] ; then 
 echo release CMSSW_7_1_20_patch2 already exists
else
scram p CMSSW CMSSW_7_1_20_patch2
fi
cd CMSSW_7_1_20_patch2/src
eval `scram runtime -sh`

curl -s --insecure https://cms-pdmv.cern.ch/mcm/public/restapi/requests/get_fragment/HIG-RunIIWinter15wmLHE-00920 --retry 2 --create-dirs -o Configuration/GenProduction/python/HIG-RunIIWinter15wmLHE-00920-fragment.py 
[ -s Configuration/GenProduction/python/HIG-RunIIWinter15wmLHE-00920-fragment.py ] || exit $?;

scram b
cd ../../
cmsDriver.py Configuration/GenProduction/python/HIG-RunIIWinter15wmLHE-00920-fragment.py --fileout file:HIG-RunIIWinter15wmLHE-00920.root --mc --eventcontent LHE --datatier LHE --conditions MCRUN2_71_V1::All --step LHE --python_filename HIG-RunIIWinter15wmLHE-00920_1_cfg.py --no_exec --customise Configuration/DataProcessing/Utils.addMonitoring -n 10000 || exit $? ; 



echo "nothing" ;cmsDriver.py Configuration/GenProduction/python/HIG-RunIIWinter15wmLHE-00920-fragment.py --fileout file:HIG-RunIIWinter15wmLHE-00920.root --mc --eventcontent DQM --datatier DQM --conditions MCRUN2_71_V1::All --step LHE,USER:GeneratorInterface/LHEInterface/wlhe2HepMCConverter_cff.generator,GEN,VALIDATION:genvalid_all  --fileout file:HIG-RunIIWinter15wmLHE-00920_genvalid.root --mc -n 1000 --python_filename HIG-RunIIWinter15wmLHE-00920_genvalid.py --dump_python --no_exec || exit $? ;

cmsDriver.py step2 --filein file:HIG-RunIIWinter15wmLHE-00920_genvalid.root --conditions MCRUN2_71_V1::All --mc -s HARVESTING:genHarvesting --harvesting AtJobEnd --python_filename HIG-RunIIWinter15wmLHE-00920_genvalid_harvesting.py --no_exec || exit $? ; 
```

## GEN-SIM step [MCM link](https://cms-pdmv.cern.ch/mcm/requests?prepid=HIG-RunIISummer15GS-01045&page=0&shown=127)
```bash
#!/bin/bash
source /cvmfs/cms.cern.ch/cmsset_default.sh
export SCRAM_ARCH=slc6_amd64_gcc481
if [ -r CMSSW_7_1_20_patch2/src ] ; then 
 echo release CMSSW_7_1_20_patch2 already exists
else
scram p CMSSW CMSSW_7_1_20_patch2
fi
cd CMSSW_7_1_20_patch2/src
eval `scram runtime -sh`
curl  -s https://raw.githubusercontent.com/cms-sw/genproductions/071218017779916161e47643e07a49ea18433425/python/ThirteenTeV/Hadronizer_TuneCUETP8M1_13TeV_generic_LHE_pythia8_cff.py --retry 2 --create-dirs -o  Configuration/GenProduction/python/ThirteenTeV/Hadronizer_TuneCUETP8M1_13TeV_generic_LHE_pythia8_cff.py 
[ -s Configuration/GenProduction/python/ThirteenTeV/Hadronizer_TuneCUETP8M1_13TeV_generic_LHE_pythia8_cff.py ] || exit $?;


scram b
cd ../../
cmsDriver.py Configuration/GenProduction/python/ThirteenTeV/Hadronizer_TuneCUETP8M1_13TeV_generic_LHE_pythia8_cff.py --fileout file:HIG-RunIISummer15GS-01045.root --mc --eventcontent RAWSIM --customise SLHCUpgradeSimulations/Configuration/postLS1Customs.customisePostLS1,Configuration/DataProcessing/Utils.addMonitoring --datatier GEN-SIM --conditions MCRUN2_71_V1::All --beamspot Realistic50ns13TeVCollision --step GEN,SIM --magField 38T_PostLS1 --python_filename HIG-RunIISummer15GS-01045_1_cfg.py --no_exec -n 55 || exit $? ; 



echo "nothing" ;cmsDriver.py Configuration/GenProduction/python/ThirteenTeV/Hadronizer_TuneCUETP8M1_13TeV_generic_LHE_pythia8_cff.py --fileout file:HIG-RunIISummer15GS-01045.root --mc --eventcontent DQM --datatier DQM --conditions MCRUN2_71_V1::All --beamspot Realistic50ns13TeVCollision --step GEN,VALIDATION:genvalid_all --magField 38T_PostLS1  --fileout file:HIG-RunIISummer15GS-01045_genvalid.root --mc -n 1000 --python_filename HIG-RunIISummer15GS-01045_genvalid.py  --no_exec || exit $? ;

cmsDriver.py step2 --filein file:HIG-RunIISummer15GS-01045_genvalid.root --conditions MCRUN2_71_V1::All --mc -s HARVESTING:genHarvesting --harvesting AtJobEnd --python_filename HIG-RunIISummer15GS-01045_genvalid_harvesting.py --no_exec || exit $? ; 
```
## DIGI-RECO (and pileup premixing) [MCM link](https://cms-pdmv.cern.ch/mcm/requests?prepid=HIG-RunIISummer16DR80Premix-01388&page=0&shown=127)
```bash
#!/bin/bash
source /cvmfs/cms.cern.ch/cmsset_default.sh
export SCRAM_ARCH=slc6_amd64_gcc530
if [ -r CMSSW_8_0_21/src ] ; then 
 echo release CMSSW_8_0_21 already exists
else
scram p CMSSW CMSSW_8_0_21
fi
cd CMSSW_8_0_21/src
eval `scram runtime -sh`


scram b
cd ../../
cmsDriver.py step1 --filein "dbs:/HToZATo2L2B_MH-200_MA-50_13TeV-madgraph-pythia8/RunIISummer15GS-MCRUN2_71_V1-v1/GEN-SIM" --fileout file:HIG-RunIISummer16DR80Premix-01388_step1.root  --pileup_input "dbs:/Neutrino_E-10_gun/RunIISpring15PrePremix-PUMoriond17_80X_mcRun2_asymptotic_2016_TrancheIV_v2-v2/GEN-SIM-DIGI-RAW" --mc --eventcontent PREMIXRAW --datatier GEN-SIM-RAW --conditions 80X_mcRun2_asymptotic_2016_TrancheIV_v6 --step DIGIPREMIX_S2,DATAMIX,L1,DIGI2RAW,HLT:@frozen2016 --nThreads 4 --datamix PreMix --era Run2_2016 --python_filename HIG-RunIISummer16DR80Premix-01388_1_cfg.py --no_exec --customise Configuration/DataProcessing/Utils.addMonitoring -n 84 || exit $? ; 

cmsDriver.py step2 --filein file:HIG-RunIISummer16DR80Premix-01388_step1.root --fileout file:HIG-RunIISummer16DR80Premix-01388.root --mc --eventcontent AODSIM --runUnscheduled --datatier AODSIM --conditions 80X_mcRun2_asymptotic_2016_TrancheIV_v6 --step RAW2DIGI,RECO,EI --nThreads 4 --era Run2_2016 --python_filename HIG-RunIISummer16DR80Premix-01388_2_cfg.py --no_exec --customise Configuration/DataProcessing/Utils.addMonitoring -n 84 || exit $? ; 
```

## MiniAOD [MCM link](https://cms-pdmv.cern.ch/mcm/requests?prepid=HIG-RunIISummer16MiniAODv2-01385&page=0&shown=127)
```bash
source /cvmfs/cms.cern.ch/cmsset_default.sh
export SCRAM_ARCH=slc6_amd64_gcc530
if [ -r CMSSW_8_0_21/src ] ; then 
 echo release CMSSW_8_0_21 already exists
else
scram p CMSSW CMSSW_8_0_21
fi
cd CMSSW_8_0_21/src
eval `scram runtime -sh`


scram b
cd ../../
cmsDriver.py step1 --fileout file:HIG-RunIISummer16MiniAODv2-01385.root --mc --eventcontent MINIAODSIM --runUnscheduled --datatier MINIAODSIM --conditions 80X_mcRun2_asymptotic_2016_TrancheIV_v6 --step PAT --nThreads 4 --era Run2_2016 --python_filename HIG-RunIISummer16MiniAODv2-01385_1_cfg.py --no_exec --customise Configuration/DataProcessing/Utils.addMonitoring -n 2880 || exit $? ; 
```
