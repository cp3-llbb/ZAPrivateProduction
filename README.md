# ZA Private production
Starting point: [MCM of one of our MiniAOD signal samples](https://cms-pdmv.cern.ch/mcm/requests?prepid=HIG-RunIISummer16MiniAODv2-01385&page=0&shown=127), from which you can find the [MCM chain](https://cms-pdmv.cern.ch/mcm/chained_requests?prepid=HIG-chain_RunIIWinter15wmLHE_flowLHE2Summer15GS_flowRunIISummer16DR80PremixPUMoriond17_flowRunIISummer16PremixMiniAODv2-00591&page=0&shown=15) where it links all of the steps.

## Initial setup
```bash
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
pushd genproductions
git co 60013422c59c7c56c39441896f296cb371094777
pushd bin/MadGraph5_aMCatNLO/cards/production/13TeV/higgs/HToZATo2L2B
mkdir PrivateProd
cp -r HToZATo2L2B_200_50 PrivateProd/template_HToZATo2L2B_200_50
popd
popd
ln -s -d genproductions/bin/MadGraph5_aMCatNLO/cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd .
# Before preparing the actual cards we need to get the widths and other inputs from 2HDMC, so let's get Calculator42HDM first
# FIXME
# And now prepare all the cards
# ./prepare_MG5_cards.py
```

# More details:
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
