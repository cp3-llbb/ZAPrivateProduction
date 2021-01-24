# LHE->NanoGen script

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

Run as follows:
```bash
./Configuration/NanoGenScripts/lheToNanoGen.sh <fragment> <lhe> <output>
```
where `<fragment>` is a fragment with an externalLHEProducer and hadronizer settings compatible with the process in the LHE file.

This is a hack that will bypass the gridpack and pass the LHE file directly,
to generate and convert to NanoGen in one step just use
```bash
cmsDriver.py <fragment> --fileout file:<output> --mc --eventcontent NANOAODSIM --datatier NANOAOD --conditions auto:mc --step LHE,GEN,NANOGEN -n5000
```
(with the gridpack path in the fragment, or changed through customise commands),
or use the scripts in [Kenneth Long's repository](https://github.com/kdlong/WMassNanoGen) or [Pieter David](https://github.com/pieterdavid/NanoGenScripts).
