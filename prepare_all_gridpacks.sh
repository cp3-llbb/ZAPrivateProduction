# Please run the following on lxplus
# Notes:
# - the instructions will not run on ingrid
# - you must not have setup any cmsenv
# - each gridpack generation should take about 5 minutes
set -x
git clone -o upstream git@github.com:cp3-llbb/ZAPrivateProduction.git
pushd ZAPrivateProduction
git remote add origin git@github.com:kjaffel/ZAPrivateProduction.git
git clone -o upstream https://github.com/cms-sw/genproductions.git
pushd genproductions
git checkout UL2019
git pull
pushd bin/MadGraph5_aMCatNLO/cards/production/13TeV/higgs/HToZATo2L2B
ln -s -d ../../../../../../../../PrivateProd_run2 .
popd
pushd bin/MadGraph5_aMCatNLO
# Now for the real gridpack production
./gridpack_generation.sh HToZATo2L2B_200p00_50p00_1p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_200p00_50p00_1p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_200p00_50p00_2p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_200p00_50p00_2p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_200p00_50p00_3p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_200p00_50p00_3p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_200p00_50p00_4p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_200p00_50p00_4p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_200p00_50p00_5p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_200p00_50p00_5p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_200p00_50p00_6p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_200p00_50p00_6p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_200p00_50p00_7p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_200p00_50p00_7p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_200p00_50p00_8p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_200p00_50p00_8p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_200p00_50p00_9p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_200p00_50p00_9p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_200p00_50p00_10p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_200p00_50p00_10p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_200p00_100p00_1p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_200p00_100p00_1p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_200p00_100p00_2p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_200p00_100p00_2p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_200p00_100p00_3p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_200p00_100p00_3p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_200p00_100p00_4p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_200p00_100p00_4p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_200p00_100p00_5p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_200p00_100p00_5p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_200p00_100p00_6p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_200p00_100p00_6p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_200p00_100p00_7p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_200p00_100p00_7p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_200p00_100p00_8p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_200p00_100p00_8p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_200p00_100p00_9p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_200p00_100p00_9p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_200p00_100p00_10p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_200p00_100p00_10p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_250p00_50p00_1p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_250p00_50p00_1p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_250p00_50p00_2p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_250p00_50p00_2p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_250p00_50p00_3p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_250p00_50p00_3p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_250p00_50p00_4p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_250p00_50p00_4p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_250p00_50p00_5p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_250p00_50p00_5p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_250p00_50p00_6p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_250p00_50p00_6p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_250p00_50p00_7p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_250p00_50p00_7p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_250p00_50p00_8p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_250p00_50p00_8p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_250p00_50p00_9p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_250p00_50p00_9p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_250p00_50p00_10p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_250p00_50p00_10p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_250p00_100p00_1p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_250p00_100p00_1p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_250p00_100p00_2p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_250p00_100p00_2p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_250p00_100p00_3p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_250p00_100p00_3p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_250p00_100p00_4p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_250p00_100p00_4p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_250p00_100p00_5p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_250p00_100p00_5p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_250p00_100p00_6p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_250p00_100p00_6p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_250p00_100p00_7p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_250p00_100p00_7p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_250p00_100p00_8p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_250p00_100p00_8p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_250p00_100p00_9p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_250p00_100p00_9p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_250p00_100p00_10p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_250p00_100p00_10p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_300p00_50p00_1p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_300p00_50p00_1p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_300p00_50p00_2p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_300p00_50p00_2p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_300p00_50p00_3p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_300p00_50p00_3p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_300p00_50p00_4p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_300p00_50p00_4p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_300p00_50p00_5p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_300p00_50p00_5p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_300p00_50p00_6p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_300p00_50p00_6p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_300p00_50p00_7p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_300p00_50p00_7p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_300p00_50p00_8p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_300p00_50p00_8p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_300p00_50p00_9p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_300p00_50p00_9p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_300p00_50p00_10p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_300p00_50p00_10p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_300p00_100p00_1p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_300p00_100p00_1p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_300p00_100p00_2p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_300p00_100p00_2p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_300p00_100p00_3p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_300p00_100p00_3p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_300p00_100p00_4p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_300p00_100p00_4p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_300p00_100p00_5p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_300p00_100p00_5p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_300p00_100p00_6p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_300p00_100p00_6p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_300p00_100p00_7p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_300p00_100p00_7p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_300p00_100p00_8p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_300p00_100p00_8p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_300p00_100p00_9p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_300p00_100p00_9p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_300p00_100p00_10p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_300p00_100p00_10p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_300p00_200p00_1p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_300p00_200p00_1p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_300p00_200p00_2p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_300p00_200p00_2p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_300p00_200p00_3p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_300p00_200p00_3p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_300p00_200p00_4p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_300p00_200p00_4p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_300p00_200p00_5p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_300p00_200p00_5p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_300p00_200p00_6p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_300p00_200p00_6p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_300p00_200p00_7p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_300p00_200p00_7p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_300p00_200p00_8p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_300p00_200p00_8p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_300p00_200p00_9p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_300p00_200p00_9p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_300p00_200p00_10p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_300p00_200p00_10p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_500p00_50p00_1p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_500p00_50p00_1p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_500p00_50p00_2p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_500p00_50p00_2p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_500p00_50p00_3p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_500p00_50p00_3p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_500p00_50p00_4p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_500p00_50p00_4p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_500p00_50p00_5p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_500p00_50p00_5p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_500p00_50p00_6p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_500p00_50p00_6p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_500p00_50p00_7p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_500p00_50p00_7p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_500p00_50p00_8p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_500p00_50p00_8p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_500p00_50p00_9p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_500p00_50p00_9p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_500p00_50p00_10p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_500p00_50p00_10p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_500p00_100p00_1p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_500p00_100p00_1p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_500p00_100p00_2p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_500p00_100p00_2p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_500p00_100p00_3p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_500p00_100p00_3p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_500p00_100p00_4p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_500p00_100p00_4p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_500p00_100p00_5p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_500p00_100p00_5p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_500p00_100p00_6p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_500p00_100p00_6p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_500p00_100p00_7p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_500p00_100p00_7p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_500p00_100p00_8p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_500p00_100p00_8p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_500p00_100p00_9p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_500p00_100p00_9p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_500p00_100p00_10p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_500p00_100p00_10p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_500p00_200p00_1p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_500p00_200p00_1p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_500p00_200p00_2p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_500p00_200p00_2p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_500p00_200p00_3p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_500p00_200p00_3p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_500p00_200p00_4p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_500p00_200p00_4p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_500p00_200p00_5p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_500p00_200p00_5p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_500p00_200p00_6p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_500p00_200p00_6p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_500p00_200p00_7p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_500p00_200p00_7p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_500p00_200p00_8p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_500p00_200p00_8p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_500p00_200p00_9p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_500p00_200p00_9p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_500p00_200p00_10p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_500p00_200p00_10p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_500p00_300p00_1p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_500p00_300p00_1p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_500p00_300p00_2p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_500p00_300p00_2p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_500p00_300p00_3p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_500p00_300p00_3p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_500p00_300p00_4p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_500p00_300p00_4p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_500p00_300p00_5p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_500p00_300p00_5p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_500p00_300p00_6p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_500p00_300p00_6p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_500p00_300p00_7p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_500p00_300p00_7p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_500p00_300p00_8p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_500p00_300p00_8p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_500p00_300p00_9p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_500p00_300p00_9p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_500p00_300p00_10p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_500p00_300p00_10p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_500p00_400p00_1p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_500p00_400p00_1p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_500p00_400p00_2p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_500p00_400p00_2p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_500p00_400p00_3p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_500p00_400p00_3p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_500p00_400p00_4p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_500p00_400p00_4p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_500p00_400p00_5p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_500p00_400p00_5p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_500p00_400p00_6p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_500p00_400p00_6p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_500p00_400p00_7p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_500p00_400p00_7p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_500p00_400p00_8p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_500p00_400p00_8p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_500p00_400p00_9p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_500p00_400p00_9p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_500p00_400p00_10p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_500p00_400p00_10p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_650p00_50p00_1p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_650p00_50p00_1p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_650p00_50p00_2p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_650p00_50p00_2p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_650p00_50p00_3p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_650p00_50p00_3p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_650p00_50p00_4p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_650p00_50p00_4p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_650p00_50p00_5p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_650p00_50p00_5p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_650p00_50p00_6p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_650p00_50p00_6p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_650p00_50p00_7p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_650p00_50p00_7p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_650p00_50p00_8p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_650p00_50p00_8p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_650p00_50p00_9p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_650p00_50p00_9p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_650p00_50p00_10p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_650p00_50p00_10p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_800p00_50p00_1p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_800p00_50p00_1p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_800p00_50p00_2p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_800p00_50p00_2p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_800p00_50p00_3p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_800p00_50p00_3p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_800p00_50p00_4p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_800p00_50p00_4p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_800p00_50p00_5p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_800p00_50p00_5p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_800p00_50p00_6p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_800p00_50p00_6p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_800p00_50p00_7p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_800p00_50p00_7p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_800p00_50p00_8p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_800p00_50p00_8p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_800p00_50p00_9p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_800p00_50p00_9p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_800p00_50p00_10p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_800p00_50p00_10p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_800p00_100p00_1p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_800p00_100p00_1p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_800p00_100p00_2p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_800p00_100p00_2p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_800p00_100p00_3p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_800p00_100p00_3p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_800p00_100p00_4p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_800p00_100p00_4p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_800p00_100p00_5p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_800p00_100p00_5p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_800p00_100p00_6p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_800p00_100p00_6p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_800p00_100p00_7p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_800p00_100p00_7p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_800p00_100p00_8p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_800p00_100p00_8p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_800p00_100p00_9p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_800p00_100p00_9p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_800p00_100p00_10p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_800p00_100p00_10p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_800p00_200p00_1p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_800p00_200p00_1p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_800p00_200p00_2p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_800p00_200p00_2p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_800p00_200p00_3p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_800p00_200p00_3p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_800p00_200p00_4p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_800p00_200p00_4p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_800p00_200p00_5p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_800p00_200p00_5p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_800p00_200p00_6p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_800p00_200p00_6p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_800p00_200p00_7p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_800p00_200p00_7p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_800p00_200p00_8p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_800p00_200p00_8p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_800p00_200p00_9p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_800p00_200p00_9p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_800p00_200p00_10p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_800p00_200p00_10p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_800p00_400p00_1p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_800p00_400p00_1p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_800p00_400p00_2p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_800p00_400p00_2p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_800p00_400p00_3p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_800p00_400p00_3p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_800p00_400p00_4p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_800p00_400p00_4p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_800p00_400p00_5p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_800p00_400p00_5p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_800p00_400p00_6p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_800p00_400p00_6p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_800p00_400p00_7p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_800p00_400p00_7p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_800p00_400p00_8p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_800p00_400p00_8p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_800p00_400p00_9p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_800p00_400p00_9p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_800p00_400p00_10p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_800p00_400p00_10p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_800p00_700p00_1p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_800p00_700p00_1p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_800p00_700p00_2p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_800p00_700p00_2p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_800p00_700p00_3p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_800p00_700p00_3p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_800p00_700p00_4p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_800p00_700p00_4p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_800p00_700p00_5p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_800p00_700p00_5p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_800p00_700p00_6p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_800p00_700p00_6p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_800p00_700p00_7p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_800p00_700p00_7p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_800p00_700p00_8p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_800p00_700p00_8p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_800p00_700p00_9p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_800p00_700p00_9p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_800p00_700p00_10p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_800p00_700p00_10p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_1000p00_50p00_1p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_1000p00_50p00_1p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_1000p00_50p00_2p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_1000p00_50p00_2p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_1000p00_50p00_3p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_1000p00_50p00_3p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_1000p00_50p00_4p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_1000p00_50p00_4p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_1000p00_50p00_5p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_1000p00_50p00_5p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_1000p00_50p00_6p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_1000p00_50p00_6p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_1000p00_50p00_7p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_1000p00_50p00_7p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_1000p00_50p00_8p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_1000p00_50p00_8p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_1000p00_50p00_9p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_1000p00_50p00_9p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_1000p00_50p00_10p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_1000p00_50p00_10p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_1000p00_200p00_1p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_1000p00_200p00_1p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_1000p00_200p00_2p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_1000p00_200p00_2p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_1000p00_200p00_3p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_1000p00_200p00_3p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_1000p00_200p00_4p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_1000p00_200p00_4p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_1000p00_200p00_5p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_1000p00_200p00_5p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_1000p00_200p00_6p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_1000p00_200p00_6p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_1000p00_200p00_7p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_1000p00_200p00_7p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_1000p00_200p00_8p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_1000p00_200p00_8p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_1000p00_200p00_9p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_1000p00_200p00_9p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_1000p00_200p00_10p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_1000p00_200p00_10p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_1000p00_500p00_1p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_1000p00_500p00_1p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_1000p00_500p00_2p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_1000p00_500p00_2p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_1000p00_500p00_3p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_1000p00_500p00_3p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_1000p00_500p00_4p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_1000p00_500p00_4p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_1000p00_500p00_5p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_1000p00_500p00_5p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_1000p00_500p00_6p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_1000p00_500p00_6p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_1000p00_500p00_7p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_1000p00_500p00_7p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_1000p00_500p00_8p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_1000p00_500p00_8p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_1000p00_500p00_9p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_1000p00_500p00_9p00 condor_spool
./gridpack_generation.sh HToZATo2L2B_1000p00_500p00_10p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd_run2/HToZATo2L2B_1000p00_500p00_10p00 condor_spool
set +x
