# Please run the following on lxplus
# Notes:
# - the instructions will not run on ingrid
# - you must not have setup any cmsenv
# - each gridpack generation should take about 5 minutes
set -x
DIR= ZAPrivateProduction
if [[ ! -d "$DIR" ]]; then
    git clone -o upstream git@github.com:cp3-llbb/ZAPrivateProduction.git
    git remote add origin git@github.com:kjaffel/ZAPrivateProduction.git
fi
pushd ZAPrivateProduction
git fetch origin
git checkout origin/master
DIR= genproductions
if [[ ! -d "$DIR" ]]; then
    git clone  -o origin https://github.com/cms-sw/genproductions.git
    git remote add upstream git@github.com:kjaffel/genproductions.git
fi
pushd genproductions
git checkout UL2019
git pull
pushd bin/MadGraph5_aMCatNLO/cards/production/13TeV/
mkdir HToZATo2L2B_ggfusion_b-associatedproduction/
cp -a ../../../../../../PrivateProd_run2/. HToZATo2L2B_ggfusion_b-associatedproduction/
popd
pushd bin/MadGraph5_aMCatNLO
# Now for the real gridpack production
./gridpack_generation.sh HToZATo2L2B_500p00_300p00_1p50_ggH_TuneCP5_13TeV-madgraphMLM-pythia8 cards/production/13TeV/HToZATo2L2B_ggfusion_b-associatedproduction/HToZATo2L2B_500p00_300p00_1p50_ggH_TuneCP5_13TeV-madgraphMLM-pythia8 1nh 
# uncomment these lines if you want to commit your changes!
# pushd cards/production/13TeV/
# git checkout -b HToZATo2L2B_run2Cards
# git add HToZATo2L2B_ggfusion_b-associatedproduction
# git commit -m  'update HToZATo2L2B cards'
# git push upstream HToZATo2L2B_run2Cards
set +x
