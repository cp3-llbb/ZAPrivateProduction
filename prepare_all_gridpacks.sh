# Please run the following on lxplus
# Notes:
# - the instructions will not run on ingrid
# - you must not have setup any cmsenv
# - each gridpack generation should take about 5 minutes
set -x
git clone -o upstream git@github.com:cp3-llbb/ZAPrivateProduction.git
pushd ZAPrivateProduction
git remote add origin git@github.com:alesaggio/ZAPrivateProduction.git
git clone -o upstream https://github.com/cms-sw/genproductions.git
pushd genproductions
git co 60013422c59c7c56c39441896f296cb371094777
pushd bin/MadGraph5_aMCatNLO/cards/production/13TeV/higgs/HToZATo2L2B
ln -s -d ../../../../../../../../PrivateProd .
popd
pushd bin/MadGraph5_aMCatNLO
# Now for the real gridpack production
./gridpack_generation.sh HToZATo2L2B_200p00_50p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_200p00_50p00 1nh
./gridpack_generation.sh HToZATo2L2B_200p00_100p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_200p00_100p00 1nh
./gridpack_generation.sh HToZATo2L2B_250p00_50p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_250p00_50p00 1nh
./gridpack_generation.sh HToZATo2L2B_250p00_100p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_250p00_100p00 1nh
./gridpack_generation.sh HToZATo2L2B_300p00_50p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_300p00_50p00 1nh
./gridpack_generation.sh HToZATo2L2B_300p00_100p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_300p00_100p00 1nh
./gridpack_generation.sh HToZATo2L2B_300p00_200p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_300p00_200p00 1nh
./gridpack_generation.sh HToZATo2L2B_500p00_50p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_500p00_50p00 1nh
./gridpack_generation.sh HToZATo2L2B_500p00_100p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_500p00_100p00 1nh
./gridpack_generation.sh HToZATo2L2B_500p00_200p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_500p00_200p00 1nh
./gridpack_generation.sh HToZATo2L2B_500p00_300p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_500p00_300p00 1nh
./gridpack_generation.sh HToZATo2L2B_500p00_400p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_500p00_400p00 1nh
./gridpack_generation.sh HToZATo2L2B_650p00_50p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_650p00_50p00 1nh
./gridpack_generation.sh HToZATo2L2B_800p00_50p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_800p00_50p00 1nh
./gridpack_generation.sh HToZATo2L2B_800p00_100p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_800p00_100p00 1nh
./gridpack_generation.sh HToZATo2L2B_800p00_200p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_800p00_200p00 1nh
./gridpack_generation.sh HToZATo2L2B_800p00_400p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_800p00_400p00 1nh
./gridpack_generation.sh HToZATo2L2B_800p00_700p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_800p00_700p00 1nh
./gridpack_generation.sh HToZATo2L2B_1000p00_50p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_1000p00_50p00 1nh
./gridpack_generation.sh HToZATo2L2B_1000p00_200p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_1000p00_200p00 1nh
./gridpack_generation.sh HToZATo2L2B_1000p00_500p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_1000p00_500p00 1nh
./gridpack_generation.sh HToZATo2L2B_132p00_30p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_132p00_30p00 1nh
./gridpack_generation.sh HToZATo2L2B_132p00_37p34 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_132p00_37p34 1nh
./gridpack_generation.sh HToZATo2L2B_143p44_30p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_143p44_30p00 1nh
./gridpack_generation.sh HToZATo2L2B_143p44_37p34 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_143p44_37p34 1nh
./gridpack_generation.sh HToZATo2L2B_143p44_46p48 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_143p44_46p48 1nh
./gridpack_generation.sh HToZATo2L2B_157p77_30p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_157p77_30p00 1nh
./gridpack_generation.sh HToZATo2L2B_157p77_37p34 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_157p77_37p34 1nh
./gridpack_generation.sh HToZATo2L2B_157p77_46p48 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_157p77_46p48 1nh
./gridpack_generation.sh HToZATo2L2B_157p77_57p85 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_157p77_57p85 1nh
./gridpack_generation.sh HToZATo2L2B_173p52_30p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_173p52_30p00 1nh
./gridpack_generation.sh HToZATo2L2B_173p52_37p34 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_173p52_37p34 1nh
./gridpack_generation.sh HToZATo2L2B_173p52_46p48 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_173p52_46p48 1nh
./gridpack_generation.sh HToZATo2L2B_173p52_57p85 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_173p52_57p85 1nh
./gridpack_generation.sh HToZATo2L2B_173p52_72p01 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_173p52_72p01 1nh
./gridpack_generation.sh HToZATo2L2B_190p85_30p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_190p85_30p00 1nh
./gridpack_generation.sh HToZATo2L2B_190p85_37p34 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_190p85_37p34 1nh
./gridpack_generation.sh HToZATo2L2B_190p85_46p48 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_190p85_46p48 1nh
./gridpack_generation.sh HToZATo2L2B_190p85_57p85 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_190p85_57p85 1nh
./gridpack_generation.sh HToZATo2L2B_190p85_71p28 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_190p85_71p28 1nh
./gridpack_generation.sh HToZATo2L2B_190p85_86p78 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_190p85_86p78 1nh
./gridpack_generation.sh HToZATo2L2B_209p90_30p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_209p90_30p00 1nh
./gridpack_generation.sh HToZATo2L2B_209p90_37p34 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_209p90_37p34 1nh
./gridpack_generation.sh HToZATo2L2B_209p90_46p48 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_209p90_46p48 1nh
./gridpack_generation.sh HToZATo2L2B_209p90_57p71 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_209p90_57p71 1nh
./gridpack_generation.sh HToZATo2L2B_209p90_71p15 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_209p90_71p15 1nh
./gridpack_generation.sh HToZATo2L2B_209p90_86p79 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_209p90_86p79 1nh
./gridpack_generation.sh HToZATo2L2B_209p90_104p53 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_209p90_104p53 1nh
./gridpack_generation.sh HToZATo2L2B_230p77_30p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_230p77_30p00 1nh
./gridpack_generation.sh HToZATo2L2B_230p77_37p10 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_230p77_37p10 1nh
./gridpack_generation.sh HToZATo2L2B_230p77_45p88 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_230p77_45p88 1nh
./gridpack_generation.sh HToZATo2L2B_230p77_56p73 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_230p77_56p73 1nh
./gridpack_generation.sh HToZATo2L2B_230p77_69p78 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_230p77_69p78 1nh
./gridpack_generation.sh HToZATo2L2B_230p77_85p09 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_230p77_85p09 1nh
./gridpack_generation.sh HToZATo2L2B_230p77_102p72 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_230p77_102p72 1nh
./gridpack_generation.sh HToZATo2L2B_230p77_123p89 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_230p77_123p89 1nh
./gridpack_generation.sh HToZATo2L2B_261p40_30p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_261p40_30p00 1nh
./gridpack_generation.sh HToZATo2L2B_261p40_37p10 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_261p40_37p10 1nh
./gridpack_generation.sh HToZATo2L2B_261p40_45p88 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_261p40_45p88 1nh
./gridpack_generation.sh HToZATo2L2B_261p40_56p73 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_261p40_56p73 1nh
./gridpack_generation.sh HToZATo2L2B_261p40_69p66 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_261p40_69p66 1nh
./gridpack_generation.sh HToZATo2L2B_261p40_85p10 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_261p40_85p10 1nh
./gridpack_generation.sh HToZATo2L2B_261p40_102p99 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_261p40_102p99 1nh
./gridpack_generation.sh HToZATo2L2B_261p40_124p53 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_261p40_124p53 1nh
./gridpack_generation.sh HToZATo2L2B_261p40_150p50 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_261p40_150p50 1nh
./gridpack_generation.sh HToZATo2L2B_296p10_30p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_296p10_30p00 1nh
./gridpack_generation.sh HToZATo2L2B_296p10_36p79 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_296p10_36p79 1nh
./gridpack_generation.sh HToZATo2L2B_296p10_45p12 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_296p10_45p12 1nh
./gridpack_generation.sh HToZATo2L2B_296p10_55p33 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_296p10_55p33 1nh
./gridpack_generation.sh HToZATo2L2B_296p10_67p65 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_296p10_67p65 1nh
./gridpack_generation.sh HToZATo2L2B_296p10_82p40 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_296p10_82p40 1nh
./gridpack_generation.sh HToZATo2L2B_296p10_99p90 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_296p10_99p90 1nh
./gridpack_generation.sh HToZATo2L2B_296p10_120p82 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_296p10_120p82 1nh
./gridpack_generation.sh HToZATo2L2B_296p10_145p93 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_296p10_145p93 1nh
./gridpack_generation.sh HToZATo2L2B_296p10_176p02 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_296p10_176p02 1nh
./gridpack_generation.sh HToZATo2L2B_335p40_30p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_335p40_30p00 1nh
./gridpack_generation.sh HToZATo2L2B_335p40_36p79 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_335p40_36p79 1nh
./gridpack_generation.sh HToZATo2L2B_335p40_45p12 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_335p40_45p12 1nh
./gridpack_generation.sh HToZATo2L2B_335p40_55p33 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_335p40_55p33 1nh
./gridpack_generation.sh HToZATo2L2B_335p40_67p54 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_335p40_67p54 1nh
./gridpack_generation.sh HToZATo2L2B_335p40_82p14 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_335p40_82p14 1nh
./gridpack_generation.sh HToZATo2L2B_335p40_99p61 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_335p40_99p61 1nh
./gridpack_generation.sh HToZATo2L2B_335p40_120p39 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_335p40_120p39 1nh
./gridpack_generation.sh HToZATo2L2B_335p40_145p06 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_335p40_145p06 1nh
./gridpack_generation.sh HToZATo2L2B_335p40_174p55 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_335p40_174p55 1nh
./gridpack_generation.sh HToZATo2L2B_335p40_209p73 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_335p40_209p73 1nh
./gridpack_generation.sh HToZATo2L2B_379p00_30p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_379p00_30p00 1nh
./gridpack_generation.sh HToZATo2L2B_379p00_36p63 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_379p00_36p63 1nh
./gridpack_generation.sh HToZATo2L2B_379p00_44p72 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_379p00_44p72 1nh
./gridpack_generation.sh HToZATo2L2B_379p00_54p59 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_379p00_54p59 1nh
./gridpack_generation.sh HToZATo2L2B_379p00_66p57 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_379p00_66p57 1nh
./gridpack_generation.sh HToZATo2L2B_379p00_80p99 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_379p00_80p99 1nh
./gridpack_generation.sh HToZATo2L2B_379p00_98p26 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_379p00_98p26 1nh
./gridpack_generation.sh HToZATo2L2B_379p00_118p81 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_379p00_118p81 1nh
./gridpack_generation.sh HToZATo2L2B_379p00_143p08 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_379p00_143p08 1nh
./gridpack_generation.sh HToZATo2L2B_379p00_171p71 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_379p00_171p71 1nh
./gridpack_generation.sh HToZATo2L2B_379p00_205p76 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_379p00_205p76 1nh
./gridpack_generation.sh HToZATo2L2B_379p00_246p30 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_379p00_246p30 1nh
./gridpack_generation.sh HToZATo2L2B_442p63_30p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_442p63_30p00 1nh
./gridpack_generation.sh HToZATo2L2B_442p63_36p64 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_442p63_36p64 1nh
./gridpack_generation.sh HToZATo2L2B_442p63_44p76 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_442p63_44p76 1nh
./gridpack_generation.sh HToZATo2L2B_442p63_54p67 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_442p63_54p67 1nh
./gridpack_generation.sh HToZATo2L2B_442p63_66p49 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_442p63_66p49 1nh
./gridpack_generation.sh HToZATo2L2B_442p63_80p03 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_442p63_80p03 1nh
./gridpack_generation.sh HToZATo2L2B_442p63_95p27 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_442p63_95p27 1nh
./gridpack_generation.sh HToZATo2L2B_442p63_113p53 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_442p63_113p53 1nh
./gridpack_generation.sh HToZATo2L2B_442p63_135p44 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_442p63_135p44 1nh
./gridpack_generation.sh HToZATo2L2B_442p63_161p81 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_442p63_161p81 1nh
./gridpack_generation.sh HToZATo2L2B_442p63_193p26 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_442p63_193p26 1nh
./gridpack_generation.sh HToZATo2L2B_442p63_230p49 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_442p63_230p49 1nh
./gridpack_generation.sh HToZATo2L2B_442p63_274p57 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_442p63_274p57 1nh
./gridpack_generation.sh HToZATo2L2B_442p63_327p94 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_442p63_327p94 1nh
./gridpack_generation.sh HToZATo2L2B_516p94_30p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_516p94_30p00 1nh
./gridpack_generation.sh HToZATo2L2B_516p94_36p47 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_516p94_36p47 1nh
./gridpack_generation.sh HToZATo2L2B_516p94_44p34 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_516p94_44p34 1nh
./gridpack_generation.sh HToZATo2L2B_516p94_53p90 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_516p94_53p90 1nh
./gridpack_generation.sh HToZATo2L2B_516p94_65p52 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_516p94_65p52 1nh
./gridpack_generation.sh HToZATo2L2B_516p94_78p52 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_516p94_78p52 1nh
./gridpack_generation.sh HToZATo2L2B_516p94_93p12 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_516p94_93p12 1nh
./gridpack_generation.sh HToZATo2L2B_516p94_109p30 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_516p94_109p30 1nh
./gridpack_generation.sh HToZATo2L2B_516p94_128p58 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_516p94_128p58 1nh
./gridpack_generation.sh HToZATo2L2B_516p94_151p69 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_516p94_151p69 1nh
./gridpack_generation.sh HToZATo2L2B_516p94_179p35 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_516p94_179p35 1nh
./gridpack_generation.sh HToZATo2L2B_516p94_212p14 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_516p94_212p14 1nh
./gridpack_generation.sh HToZATo2L2B_516p94_250p63 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_516p94_250p63 1nh
./gridpack_generation.sh HToZATo2L2B_516p94_296p65 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_516p94_296p65 1nh
./gridpack_generation.sh HToZATo2L2B_516p94_352p61 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_516p94_352p61 1nh
./gridpack_generation.sh HToZATo2L2B_516p94_423p96 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_516p94_423p96 1nh
./gridpack_generation.sh HToZATo2L2B_609p21_30p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_609p21_30p00 1nh
./gridpack_generation.sh HToZATo2L2B_609p21_34p86 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_609p21_34p86 1nh
./gridpack_generation.sh HToZATo2L2B_609p21_40p51 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_609p21_40p51 1nh
./gridpack_generation.sh HToZATo2L2B_609p21_47p08 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_609p21_47p08 1nh
./gridpack_generation.sh HToZATo2L2B_609p21_54p71 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_609p21_54p71 1nh
./gridpack_generation.sh HToZATo2L2B_609p21_63p58 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_609p21_63p58 1nh
./gridpack_generation.sh HToZATo2L2B_609p21_73p89 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_609p21_73p89 1nh
./gridpack_generation.sh HToZATo2L2B_609p21_85p86 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_609p21_85p86 1nh
./gridpack_generation.sh HToZATo2L2B_609p21_99p78 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_609p21_99p78 1nh
./gridpack_generation.sh HToZATo2L2B_609p21_116p29 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_609p21_116p29 1nh
./gridpack_generation.sh HToZATo2L2B_609p21_135p66 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_609p21_135p66 1nh
./gridpack_generation.sh HToZATo2L2B_609p21_158p41 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_609p21_158p41 1nh
./gridpack_generation.sh HToZATo2L2B_609p21_185p18 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_609p21_185p18 1nh
./gridpack_generation.sh HToZATo2L2B_609p21_216p52 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_609p21_216p52 1nh
./gridpack_generation.sh HToZATo2L2B_609p21_253p68 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_609p21_253p68 1nh
./gridpack_generation.sh HToZATo2L2B_609p21_298p01 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_609p21_298p01 1nh
./gridpack_generation.sh HToZATo2L2B_609p21_351p22 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_609p21_351p22 1nh
./gridpack_generation.sh HToZATo2L2B_609p21_417p76 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_609p21_417p76 1nh
./gridpack_generation.sh HToZATo2L2B_609p21_505p93 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_609p21_505p93 1nh
./gridpack_generation.sh HToZATo2L2B_717p96_30p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_717p96_30p00 1nh
./gridpack_generation.sh HToZATo2L2B_717p96_34p86 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_717p96_34p86 1nh
./gridpack_generation.sh HToZATo2L2B_717p96_40p51 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_717p96_40p51 1nh
./gridpack_generation.sh HToZATo2L2B_717p96_47p08 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_717p96_47p08 1nh
./gridpack_generation.sh HToZATo2L2B_717p96_54p71 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_717p96_54p71 1nh
./gridpack_generation.sh HToZATo2L2B_717p96_63p58 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_717p96_63p58 1nh
./gridpack_generation.sh HToZATo2L2B_717p96_73p89 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_717p96_73p89 1nh
./gridpack_generation.sh HToZATo2L2B_717p96_85p86 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_717p96_85p86 1nh
./gridpack_generation.sh HToZATo2L2B_717p96_99p78 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_717p96_99p78 1nh
./gridpack_generation.sh HToZATo2L2B_717p96_116p19 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_717p96_116p19 1nh
./gridpack_generation.sh HToZATo2L2B_717p96_135p31 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_717p96_135p31 1nh
./gridpack_generation.sh HToZATo2L2B_717p96_157p56 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_717p96_157p56 1nh
./gridpack_generation.sh HToZATo2L2B_717p96_183p48 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_717p96_183p48 1nh
./gridpack_generation.sh HToZATo2L2B_717p96_213p73 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_717p96_213p73 1nh
./gridpack_generation.sh HToZATo2L2B_717p96_249p34 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_717p96_249p34 1nh
./gridpack_generation.sh HToZATo2L2B_717p96_291p34 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_717p96_291p34 1nh
./gridpack_generation.sh HToZATo2L2B_717p96_341p02 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_717p96_341p02 1nh
./gridpack_generation.sh HToZATo2L2B_717p96_400p03 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_717p96_400p03 1nh
./gridpack_generation.sh HToZATo2L2B_717p96_475p80 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_717p96_475p80 1nh
./gridpack_generation.sh HToZATo2L2B_717p96_577p65 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_717p96_577p65 1nh
./gridpack_generation.sh HToZATo2L2B_846p11_30p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_846p11_30p00 1nh
./gridpack_generation.sh HToZATo2L2B_846p11_34p93 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_846p11_34p93 1nh
./gridpack_generation.sh HToZATo2L2B_846p11_40p68 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_846p11_40p68 1nh
./gridpack_generation.sh HToZATo2L2B_846p11_47p37 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_846p11_47p37 1nh
./gridpack_generation.sh HToZATo2L2B_846p11_55p16 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_846p11_55p16 1nh
./gridpack_generation.sh HToZATo2L2B_846p11_64p24 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_846p11_64p24 1nh
./gridpack_generation.sh HToZATo2L2B_846p11_74p80 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_846p11_74p80 1nh
./gridpack_generation.sh HToZATo2L2B_846p11_87p10 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_846p11_87p10 1nh
./gridpack_generation.sh HToZATo2L2B_846p11_101p43 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_846p11_101p43 1nh
./gridpack_generation.sh HToZATo2L2B_846p11_118p11 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_846p11_118p11 1nh
./gridpack_generation.sh HToZATo2L2B_846p11_137p54 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_846p11_137p54 1nh
./gridpack_generation.sh HToZATo2L2B_846p11_160p17 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_846p11_160p17 1nh
./gridpack_generation.sh HToZATo2L2B_846p11_186p51 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_846p11_186p51 1nh
./gridpack_generation.sh HToZATo2L2B_846p11_217p19 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_846p11_217p19 1nh
./gridpack_generation.sh HToZATo2L2B_846p11_252p91 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_846p11_252p91 1nh
./gridpack_generation.sh HToZATo2L2B_846p11_294p51 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_846p11_294p51 1nh
./gridpack_generation.sh HToZATo2L2B_846p11_345p53 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_846p11_345p53 1nh
./gridpack_generation.sh HToZATo2L2B_846p11_405p40 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_846p11_405p40 1nh
./gridpack_generation.sh HToZATo2L2B_846p11_475p64 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_846p11_475p64 1nh
./gridpack_generation.sh HToZATo2L2B_846p11_558p06 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_846p11_558p06 1nh
./gridpack_generation.sh HToZATo2L2B_846p11_654p75 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_846p11_654p75 1nh
./gridpack_generation.sh HToZATo2L2B_997p14_30p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_997p14_30p00 1nh
./gridpack_generation.sh HToZATo2L2B_997p14_34p93 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_997p14_34p93 1nh
./gridpack_generation.sh HToZATo2L2B_997p14_40p68 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_997p14_40p68 1nh
./gridpack_generation.sh HToZATo2L2B_997p14_47p37 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_997p14_47p37 1nh
./gridpack_generation.sh HToZATo2L2B_997p14_55p16 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_997p14_55p16 1nh
./gridpack_generation.sh HToZATo2L2B_997p14_64p24 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_997p14_64p24 1nh
./gridpack_generation.sh HToZATo2L2B_997p14_74p80 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_997p14_74p80 1nh
./gridpack_generation.sh HToZATo2L2B_997p14_87p10 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_997p14_87p10 1nh
./gridpack_generation.sh HToZATo2L2B_997p14_101p43 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_997p14_101p43 1nh
./gridpack_generation.sh HToZATo2L2B_997p14_118p11 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_997p14_118p11 1nh
./gridpack_generation.sh HToZATo2L2B_997p14_137p54 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_997p14_137p54 1nh
./gridpack_generation.sh HToZATo2L2B_997p14_160p17 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_997p14_160p17 1nh
./gridpack_generation.sh HToZATo2L2B_997p14_186p51 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_997p14_186p51 1nh
./gridpack_generation.sh HToZATo2L2B_997p14_217p19 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_997p14_217p19 1nh
./gridpack_generation.sh HToZATo2L2B_997p14_254p82 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_997p14_254p82 1nh
./gridpack_generation.sh HToZATo2L2B_997p14_298p97 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_997p14_298p97 1nh
./gridpack_generation.sh HToZATo2L2B_997p14_350p77 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_997p14_350p77 1nh
./gridpack_generation.sh HToZATo2L2B_997p14_411p54 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_997p14_411p54 1nh
./gridpack_generation.sh HToZATo2L2B_997p14_482p85 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_997p14_482p85 1nh
./gridpack_generation.sh HToZATo2L2B_997p14_566p51 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_997p14_566p51 1nh
./gridpack_generation.sh HToZATo2L2B_997p14_664p66 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_997p14_664p66 1nh
./gridpack_generation.sh HToZATo2L2B_997p14_779p83 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_997p14_779p83 1nh
set +x
