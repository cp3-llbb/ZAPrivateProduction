# Notes:
# - This script was generated by prepare_MG5_cards.py
# - It should be run from the genproductions/bin/MadGraph5_aMCatNLO directory in a clean environment and will submit the gridpack generation for all points.
# - each gridpack generation should take about 20 minutes
set -x
GenDIR='genproductions'
if [[ ! -d "$GenDIR" ]]; then
    git clone  -o origin https://github.com/cms-sw/genproductions.git
    git remote add upstream git@github.com:kjaffel/genproductions.git
fi
pushd genproductions
git checkout master
git pull
pushd bin/MadGraph5_aMCatNLO/cards/production/13TeV/
CardsDIR='HToZATo2L2B_ggfusion_b-associatedproduction'
if [[ ! -d "$CardsDIR" ]]; then
    mkdir HToZATo2L2B_ggfusion_b-associatedproduction/
fi
cp -r ../../../../../../example_cards HToZATo2L2B_ggfusion_b-associatedproduction/.
popd
pushd bin/MadGraph5_aMCatNLO
# kEEP IN MIND : IF You are submitting from lxplus and the local directory is not on AFS 
# Automatically will switch to condor spool mode.
# So you have to call : ./submit_condor_gridpack_generation.sh 
# Now for the real gridpack production
./gridpack_generation.sh HToZATo2L2B_500p00_300p00_1p50_ggH_TuneCP5_13TeV_pythia8 cards/production/13TeV/HToZATo2L2B_ggfusion_b-associatedproduction/example_cards/HToZATo2L2B_500p00_300p00_1p50_ggH_TuneCP5_13TeV_pythia8 1nh 
# uncomment these lines to Add more commits by pushing to the HToZATo2L2B_run2Cards branch on kjaffel/genproductions.!
# pushd cards/production/13TeV/
# git checkout -b HToZATo2L2B_run2Cards
# git add HToZATo2L2B_ggfusion_b-associatedproduction
# git commit -m  'update HToZATo2L2B cards'
# git push upstream HToZATo2L2B_run2Cards
set +x