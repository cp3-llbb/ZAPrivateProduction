#Setup CMSSW area
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
2-  Produce GEN files:

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
