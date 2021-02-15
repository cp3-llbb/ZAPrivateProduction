# ZA- NANOGEN 
## Setup CMSSW area
To set up in a new CMSSW area:
```bash
cmsrel CMSSW_10_6_19_patch2
cd CMSSW_10_6_19_patch2/src
cmsenv
mkdir Configuration
git clone https://github.com/pieterdavid/NanoGenScripts.git -o Configuration/NanoGenScripts
scram b
```
or inside an existing CMSSW area
```bash
cd $CMSSW_BASE/src
mkdir -p Configuration
git clone https://github.com/pieterdavid/NanoGenScripts.git -o Configuration/NanoGenScripts
scram b
```

## gridpacks -> LHE -> GEN
At this stage I am assuming that you manage to generate gridpacks stored by default in :`genproductions/bin/MadGraph5_aMCatNLO/`    
1- Move gridpacks in a new directory:
```python
    mv genproductions/bin/MadGraph5_aMCatNLO/XXX*tarball.tar.xz gridpacks/XXX
    ln -s -d gridpacks/XXX Configuration/NanoGenScripts/gridpacks/XXX
```

2- Create LHE files and extract generator info from gridpacks (can also be run without `--createLHE` option, in which case only the root tree with gen level info is created) 
```python
    python getLHEandGenInfo.py -i gridpacks/XXX -n XXX -t /tmp/username --getGenInfo --createLHE --numberOfLHEevents 1000 --EOSdir /eos/cms/user/blabla
```
    An output root tree is created in gridpacks/XXX.root containing some generator level info:
```
    xsec: cross section (pb)
    gkkmass: KK gluon mass (GeV)
    gkkwidth: KK gluon width (GeV)
    gkkbr: KK gluon BR (in the decay of interest: here "Radion+gluon")
    rmass: Radion mass (GeV)
    rwidth: Radion width (GeV)
    rbr: Radion BR (in the decay of interest: here "gluon+gluon") 
```
3-  Produce GEN files:

```python
    #Prepare the list.txt with all the lhe files to be processes, sth like:
    root://eoscms///eos/cms/store/user/k/kjaffel/ZAmcsamples_run2/balbla/XXX.lhe
    root://eoscms///eos/cms/store/user/k/kjaffel/ZAmcsamples_run2/blabla/XXX.lhe
    
    # run as follows:
    python makeGENfromLHE.py -v $CMSSW_BASE -c `<Hadronizer>` -i list.txt -t /tmp/username/ --outputDir 
```

## LHE -> NanoGen
If you have lhe files:
Go to folderName/Events/run_01. In there should be a file named unweighted_events.lhe.gz . To unzip it, use:
```
zcat unweighted_events.lhe.gz > unweighted_events.lhe
or gunzip unweighted_events.lhe.gz
```
You should now have unweighted_events.lhe, which is the file to be used in further analysis. 
```bash
./Configuration/NanoGenScripts/lheToNanoGen.sh <fragment> <lhe> <output>
```
where `<fragment>` is a fragment with an externalLHEProducer and hadronizer settings compatible with the process in the LHE file.

This is a hack that will bypass the gridpack and pass the LHE file directly,
to generate and convert to NanoGen in one step just use
```bash
cmsDriver.py <fragment> --fileout file:<output> --mc --eventcontent NANOAODSIM --datatier NANOAOD --conditions auto:mc --step LHE,GEN,NANOGEN -n 5000
```
(with the gridpack path in the fragment, or changed through customise commands),
or use the scripts in [Kenneth Long's](https://github.com/kdlong/WMassNanoGen) or [Pieter David](https://github.com/pieterdavid/NanoGenScripts) repositry.

##Get gridpack and fragments for a dataset: code from[@Pieter David](https://gitlab.cern.ch/-/snippets/1488)
### How it works ! 
```bash
$ ./scripts/getGenInfo.py --cernSSOcookies=prodcookies.pkl /HToZATo2L2B_MH-500_MA-300_13TeV-madgraph-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8-v1/NANOAODSIM

# HToZATo2L2B_MH-500_MA-300_13TeV-madgraph-pythia8
----- FRAGMENT -----
import FWCore.ParameterSet.Config as cms

# link to cards:
# https://github.com/cms-sw/genproductions/tree/60013422c59c7c56c39441896f296cb371094777/bin/MadGraph5_aMCatNLO/cards/production/13TeV/higgs/HToZATo2L2B/HToZATo2L2B_500_300

externalLHEProducer = cms.EDProducer("ExternalLHEProducer",
    args = cms.vstring('/cvmfs/cms.cern.ch/phys_generator/gridpacks/slc6_amd64_gcc481/13TeV/madgraph/V5_2.3.2.2/HToZA/v1/HToZATo2L2B_500_300_tarball.tar.xz'),
nEvents = cms.untracked.uint32(5000),
numberOfParameters = cms.uint32(1),
outputFile = cms.string('cmsgrid_final.lhe'),
scriptName = cms.FileInPath('GeneratorInterface/LHEInterface/data/run_generic_tarball_cvmfs.sh')
    )
-----   END    -----
Gridpack: /cvmfs/cms.cern.ch/phys_generator/gridpacks/slc6_amd64_gcc481/13TeV/madgraph/V5_2.3.2.2/HToZA/v1/HToZATo2L2B_500_300_tarball.tar.xz
Cross-section 1.000000pb, filter efficiency 1.000000 +/- 0.000000, match efficiency 1.000000 +/- 0.000000, negative weights fraction 0.000000 (v1, Prafulla Behera 2015-11-28-03-50)
Fragment name: ThirteenTeV/Hadronizer_TuneCUETP8M1_13TeV_generic_LHE_pythia8_cff.py
```
with xsc DB query : 
```bash
XSDB: approved, LO accuracy: 25510.0 +/- 7.661 at 13TeV Madgraph+Pythia8 Automatically computed (created by cmsxsec on 2017-12-05 12:33:31, approved by perrozzi, modified on 2017-12-06 20:57:05)
```
