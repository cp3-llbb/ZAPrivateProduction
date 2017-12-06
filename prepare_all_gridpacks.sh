# Please run the following on lxplus
# Notes:
# - the instructions will not run on ingrid
# - you must not have setup any cmsenv
# - each gridpack generation should take about 5 minutes
set -x
git clone -o upstream git@github.com:cp3-llbb/ZAPrivateProduction.git
pushd ZAPrivateProduction
git clone -o upstream https://github.com/cms-sw/genproductions.git
pushd genproductions
git co 60013422c59c7c56c39441896f296cb371094777
pushd bin/MadGraph5_aMCatNLO/cards/production/13TeV/higgs/HToZATo2L2B
ln -s -d ../../../../../../../../PrivateProd .
popd
pushd bin/MadGraph5_aMCatNLO
# Now for the real gridpack production
./gridpack_generation.sh HToZATo2L2B_200p00_50p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_200p00_50p00 1nh
set +x
