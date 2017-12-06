# Please run the following on lxplus
# Notes:
# - the instructions will not run on ingrid
# - you must not have setup any cmsenv
# - each gridpack generation should take about 5 minutes
set -x
git clone -o upstream git@github.com:cp3-llbb/ZAPrivateProduction.git
pushd ZAPrivateProduction
git remote add origin git@github.com:OlivierBondu/ZAPrivateProduction.git
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
skipping point (mH, mA) = (120.0, 30.0)
skipping point (mH, mA) = (120.0, 34.49)
skipping point (mH, mA) = (120.0, 39.54)
skipping point (mH, mA) = (120.0, 45.19)
skipping point (mH, mA) = (120.0, 51.48)
skipping point (mH, mA) = (120.0, 58.4)
skipping point (mH, mA) = (120.0, 65.77)
./gridpack_generation.sh HToZATo2L2B_127p34_30p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_127p34_30p00 1nh
./gridpack_generation.sh HToZATo2L2B_127p34_34p66 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_127p34_34p66 1nh
./gridpack_generation.sh HToZATo2L2B_127p34_40p10 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_127p34_40p10 1nh
./gridpack_generation.sh HToZATo2L2B_127p34_46p23 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_127p34_46p23 1nh
./gridpack_generation.sh HToZATo2L2B_127p34_53p10 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_127p34_53p10 1nh
./gridpack_generation.sh HToZATo2L2B_127p34_60p74 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_127p34_60p74 1nh
./gridpack_generation.sh HToZATo2L2B_127p34_69p01 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_127p34_69p01 1nh
./gridpack_generation.sh HToZATo2L2B_135p61_30p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_135p61_30p00 1nh
./gridpack_generation.sh HToZATo2L2B_135p61_34p66 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_135p61_34p66 1nh
./gridpack_generation.sh HToZATo2L2B_135p61_40p50 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_135p61_40p50 1nh
./gridpack_generation.sh HToZATo2L2B_135p61_47p16 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_135p61_47p16 1nh
./gridpack_generation.sh HToZATo2L2B_135p61_54p70 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_135p61_54p70 1nh
./gridpack_generation.sh HToZATo2L2B_135p61_63p15 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_135p61_63p15 1nh
./gridpack_generation.sh HToZATo2L2B_135p61_72p48 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_135p61_72p48 1nh
./gridpack_generation.sh HToZATo2L2B_135p61_81p94 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_135p61_81p94 1nh
./gridpack_generation.sh HToZATo2L2B_143p76_30p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_143p76_30p00 1nh
./gridpack_generation.sh HToZATo2L2B_143p76_34p66 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_143p76_34p66 1nh
./gridpack_generation.sh HToZATo2L2B_143p76_40p88 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_143p76_40p88 1nh
./gridpack_generation.sh HToZATo2L2B_143p76_48p06 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_143p76_48p06 1nh
./gridpack_generation.sh HToZATo2L2B_143p76_56p27 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_143p76_56p27 1nh
./gridpack_generation.sh HToZATo2L2B_143p76_65p56 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_143p76_65p56 1nh
./gridpack_generation.sh HToZATo2L2B_143p76_75p94 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_143p76_75p94 1nh
./gridpack_generation.sh HToZATo2L2B_143p76_86p58 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_143p76_86p58 1nh
./gridpack_generation.sh HToZATo2L2B_152p86_30p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_152p86_30p00 1nh
./gridpack_generation.sh HToZATo2L2B_152p86_34p65 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_152p86_34p65 1nh
./gridpack_generation.sh HToZATo2L2B_152p86_40p87 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_152p86_40p87 1nh
./gridpack_generation.sh HToZATo2L2B_152p86_48p59 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_152p86_48p59 1nh
./gridpack_generation.sh HToZATo2L2B_152p86_57p49 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_152p86_57p49 1nh
./gridpack_generation.sh HToZATo2L2B_152p86_67p68 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_152p86_67p68 1nh
./gridpack_generation.sh HToZATo2L2B_152p86_79p18 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_152p86_79p18 1nh
./gridpack_generation.sh HToZATo2L2B_152p86_91p20 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_152p86_91p20 1nh
./gridpack_generation.sh HToZATo2L2B_163p18_30p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_163p18_30p00 1nh
./gridpack_generation.sh HToZATo2L2B_163p18_34p61 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_163p18_34p61 1nh
./gridpack_generation.sh HToZATo2L2B_163p18_40p81 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_163p18_40p81 1nh
./gridpack_generation.sh HToZATo2L2B_163p18_49p11 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_163p18_49p11 1nh
./gridpack_generation.sh HToZATo2L2B_163p18_58p82 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_163p18_58p82 1nh
./gridpack_generation.sh HToZATo2L2B_163p18_70p05 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_163p18_70p05 1nh
./gridpack_generation.sh HToZATo2L2B_163p18_82p86 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_163p18_82p86 1nh
./gridpack_generation.sh HToZATo2L2B_163p18_96p54 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_163p18_96p54 1nh
./gridpack_generation.sh HToZATo2L2B_163p18_110p05 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_163p18_110p05 1nh
./gridpack_generation.sh HToZATo2L2B_179p67_30p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_179p67_30p00 1nh
./gridpack_generation.sh HToZATo2L2B_179p67_34p48 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_179p67_34p48 1nh
./gridpack_generation.sh HToZATo2L2B_179p67_40p63 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_179p67_40p63 1nh
./gridpack_generation.sh HToZATo2L2B_179p67_49p17 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_179p67_49p17 1nh
./gridpack_generation.sh HToZATo2L2B_179p67_60p04 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_179p67_60p04 1nh
./gridpack_generation.sh HToZATo2L2B_179p67_72p86 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_179p67_72p86 1nh
./gridpack_generation.sh HToZATo2L2B_179p67_87p75 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_179p67_87p75 1nh
./gridpack_generation.sh HToZATo2L2B_179p67_104p27 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_179p67_104p27 1nh
./gridpack_generation.sh HToZATo2L2B_179p67_120p72 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_179p67_120p72 1nh
./gridpack_generation.sh HToZATo2L2B_197p83_30p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_197p83_30p00 1nh
./gridpack_generation.sh HToZATo2L2B_197p83_34p36 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_197p83_34p36 1nh
./gridpack_generation.sh HToZATo2L2B_197p83_40p31 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_197p83_40p31 1nh
./gridpack_generation.sh HToZATo2L2B_197p83_48p71 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_197p83_48p71 1nh
./gridpack_generation.sh HToZATo2L2B_197p83_60p38 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_197p83_60p38 1nh
./gridpack_generation.sh HToZATo2L2B_197p83_74p19 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_197p83_74p19 1nh
./gridpack_generation.sh HToZATo2L2B_197p83_90p14 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_197p83_90p14 1nh
./gridpack_generation.sh HToZATo2L2B_197p83_108p56 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_197p83_108p56 1nh
./gridpack_generation.sh HToZATo2L2B_197p83_128p66 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_197p83_128p66 1nh
./gridpack_generation.sh HToZATo2L2B_197p83_146p31 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_197p83_146p31 1nh
./gridpack_generation.sh HToZATo2L2B_224p19_30p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_224p19_30p00 1nh
./gridpack_generation.sh HToZATo2L2B_224p19_34p21 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_224p19_34p21 1nh
./gridpack_generation.sh HToZATo2L2B_224p19_39p89 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_224p19_39p89 1nh
./gridpack_generation.sh HToZATo2L2B_224p19_47p96 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_224p19_47p96 1nh
./gridpack_generation.sh HToZATo2L2B_224p19_59p31 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_224p19_59p31 1nh
./gridpack_generation.sh HToZATo2L2B_224p19_72p85 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_224p19_72p85 1nh
./gridpack_generation.sh HToZATo2L2B_224p19_88p74 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_224p19_88p74 1nh
./gridpack_generation.sh HToZATo2L2B_224p19_107p10 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_224p19_107p10 1nh
./gridpack_generation.sh HToZATo2L2B_224p19_129p31 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_224p19_129p31 1nh
./gridpack_generation.sh HToZATo2L2B_224p19_154p95 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_224p19_154p95 1nh
./gridpack_generation.sh HToZATo2L2B_224p19_174p09 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_224p19_174p09 1nh
./gridpack_generation.sh HToZATo2L2B_254p07_30p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_254p07_30p00 1nh
./gridpack_generation.sh HToZATo2L2B_254p07_34p03 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_254p07_34p03 1nh
./gridpack_generation.sh HToZATo2L2B_254p07_39p44 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_254p07_39p44 1nh
./gridpack_generation.sh HToZATo2L2B_254p07_47p03 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_254p07_47p03 1nh
./gridpack_generation.sh HToZATo2L2B_254p07_58p04 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_254p07_58p04 1nh
./gridpack_generation.sh HToZATo2L2B_254p07_71p29 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_254p07_71p29 1nh
./gridpack_generation.sh HToZATo2L2B_254p07_86p90 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_254p07_86p90 1nh
./gridpack_generation.sh HToZATo2L2B_254p07_105p06 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_254p07_105p06 1nh
./gridpack_generation.sh HToZATo2L2B_254p07_127p09 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_254p07_127p09 1nh
./gridpack_generation.sh HToZATo2L2B_254p07_153p87 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_254p07_153p87 1nh
./gridpack_generation.sh HToZATo2L2B_254p07_186p37 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_254p07_186p37 1nh
./gridpack_generation.sh HToZATo2L2B_287p93_30p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_287p93_30p00 1nh
./gridpack_generation.sh HToZATo2L2B_287p93_34p03 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_287p93_34p03 1nh
./gridpack_generation.sh HToZATo2L2B_287p93_39p21 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_287p93_39p21 1nh
./gridpack_generation.sh HToZATo2L2B_287p93_46p44 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_287p93_46p44 1nh
./gridpack_generation.sh HToZATo2L2B_287p93_57p05 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_287p93_57p05 1nh
./gridpack_generation.sh HToZATo2L2B_287p93_69p89 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_287p93_69p89 1nh
./gridpack_generation.sh HToZATo2L2B_287p93_85p14 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_287p93_85p14 1nh
./gridpack_generation.sh HToZATo2L2B_287p93_103p03 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_287p93_103p03 1nh
./gridpack_generation.sh HToZATo2L2B_287p93_124p67 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_287p93_124p67 1nh
./gridpack_generation.sh HToZATo2L2B_287p93_150p91 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_287p93_150p91 1nh
./gridpack_generation.sh HToZATo2L2B_287p93_182p76 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_287p93_182p76 1nh
./gridpack_generation.sh HToZATo2L2B_287p93_221p49 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_287p93_221p49 1nh
./gridpack_generation.sh HToZATo2L2B_326p30_30p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_326p30_30p00 1nh
./gridpack_generation.sh HToZATo2L2B_326p30_36p91 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_326p30_36p91 1nh
./gridpack_generation.sh HToZATo2L2B_326p30_42p90 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_326p30_42p90 1nh
./gridpack_generation.sh HToZATo2L2B_326p30_51p46 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_326p30_51p46 1nh
./gridpack_generation.sh HToZATo2L2B_326p30_63p08 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_326p30_63p08 1nh
./gridpack_generation.sh HToZATo2L2B_326p30_76p95 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_326p30_76p95 1nh
./gridpack_generation.sh HToZATo2L2B_326p30_93p25 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_326p30_93p25 1nh
./gridpack_generation.sh HToZATo2L2B_326p30_112p46 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_326p30_112p46 1nh
./gridpack_generation.sh HToZATo2L2B_326p30_135p84 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_326p30_135p84 1nh
./gridpack_generation.sh HToZATo2L2B_326p30_164p14 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_326p30_164p14 1nh
./gridpack_generation.sh HToZATo2L2B_326p30_198p43 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_326p30_198p43 1nh
./gridpack_generation.sh HToZATo2L2B_326p30_239p85 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_326p30_239p85 1nh
./gridpack_generation.sh HToZATo2L2B_382p59_30p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_382p59_30p00 1nh
./gridpack_generation.sh HToZATo2L2B_382p59_36p70 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_382p59_36p70 1nh
./gridpack_generation.sh HToZATo2L2B_382p59_44p90 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_382p59_44p90 1nh
./gridpack_generation.sh HToZATo2L2B_382p59_53p90 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_382p59_53p90 1nh
./gridpack_generation.sh HToZATo2L2B_382p59_65p85 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_382p59_65p85 1nh
./gridpack_generation.sh HToZATo2L2B_382p59_79p94 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_382p59_79p94 1nh
./gridpack_generation.sh HToZATo2L2B_382p59_96p27 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_382p59_96p27 1nh
./gridpack_generation.sh HToZATo2L2B_382p59_115p54 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_382p59_115p54 1nh
./gridpack_generation.sh HToZATo2L2B_382p59_138p93 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_382p59_138p93 1nh
./gridpack_generation.sh HToZATo2L2B_382p59_167p40 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_382p59_167p40 1nh
./gridpack_generation.sh HToZATo2L2B_382p59_201p77 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_382p59_201p77 1nh
./gridpack_generation.sh HToZATo2L2B_382p59_242p97 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_382p59_242p97 1nh
./gridpack_generation.sh HToZATo2L2B_382p59_293p17 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_382p59_293p17 1nh
./gridpack_generation.sh HToZATo2L2B_448p60_30p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_448p60_30p00 1nh
./gridpack_generation.sh HToZATo2L2B_448p60_36p34 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_448p60_36p34 1nh
./gridpack_generation.sh HToZATo2L2B_448p60_44p02 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_448p60_44p02 1nh
./gridpack_generation.sh HToZATo2L2B_448p60_53p33 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_448p60_53p33 1nh
./gridpack_generation.sh HToZATo2L2B_448p60_64p68 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_448p60_64p68 1nh
./gridpack_generation.sh HToZATo2L2B_448p60_78p04 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_448p60_78p04 1nh
./gridpack_generation.sh HToZATo2L2B_448p60_93p58 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_448p60_93p58 1nh
./gridpack_generation.sh HToZATo2L2B_448p60_111p59 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_448p60_111p59 1nh
./gridpack_generation.sh HToZATo2L2B_448p60_133p31 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_448p60_133p31 1nh
./gridpack_generation.sh HToZATo2L2B_448p60_159p62 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_448p60_159p62 1nh
./gridpack_generation.sh HToZATo2L2B_448p60_191p63 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_448p60_191p63 1nh
./gridpack_generation.sh HToZATo2L2B_448p60_230p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_448p60_230p00 1nh
./gridpack_generation.sh HToZATo2L2B_448p60_275p72 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_448p60_275p72 1nh
./gridpack_generation.sh HToZATo2L2B_448p60_331p60 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_448p60_331p60 1nh
./gridpack_generation.sh HToZATo2L2B_526p00_30p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_526p00_30p00 1nh
./gridpack_generation.sh HToZATo2L2B_526p00_36p50 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_526p00_36p50 1nh
./gridpack_generation.sh HToZATo2L2B_526p00_44p40 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_526p00_44p40 1nh
./gridpack_generation.sh HToZATo2L2B_526p00_54p02 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_526p00_54p02 1nh
./gridpack_generation.sh HToZATo2L2B_526p00_65p72 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_526p00_65p72 1nh
./gridpack_generation.sh HToZATo2L2B_526p00_79p01 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_526p00_79p01 1nh
./gridpack_generation.sh HToZATo2L2B_526p00_94p17 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_526p00_94p17 1nh
./gridpack_generation.sh HToZATo2L2B_526p00_111p46 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_526p00_111p46 1nh
./gridpack_generation.sh HToZATo2L2B_526p00_132p16 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_526p00_132p16 1nh
./gridpack_generation.sh HToZATo2L2B_526p00_157p04 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_526p00_157p04 1nh
./gridpack_generation.sh HToZATo2L2B_526p00_187p13 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_526p00_187p13 1nh
./gridpack_generation.sh HToZATo2L2B_526p00_223p11 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_526p00_223p11 1nh
./gridpack_generation.sh HToZATo2L2B_526p00_266p04 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_526p00_266p04 1nh
./gridpack_generation.sh HToZATo2L2B_526p00_318p37 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_526p00_318p37 1nh
./gridpack_generation.sh HToZATo2L2B_526p00_383p08 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_526p00_383p08 1nh
./gridpack_generation.sh HToZATo2L2B_526p00_456p30 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_526p00_456p30 1nh
./gridpack_generation.sh HToZATo2L2B_624p67_30p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_624p67_30p00 1nh
./gridpack_generation.sh HToZATo2L2B_624p67_35p13 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_624p67_35p13 1nh
./gridpack_generation.sh HToZATo2L2B_624p67_41p14 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_624p67_41p14 1nh
./gridpack_generation.sh HToZATo2L2B_624p67_48p18 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_624p67_48p18 1nh
./gridpack_generation.sh HToZATo2L2B_624p67_56p42 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_624p67_56p42 1nh
./gridpack_generation.sh HToZATo2L2B_624p67_66p07 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_624p67_66p07 1nh
./gridpack_generation.sh HToZATo2L2B_624p67_77p38 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_624p67_77p38 1nh
./gridpack_generation.sh HToZATo2L2B_624p67_90p61 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_624p67_90p61 1nh
./gridpack_generation.sh HToZATo2L2B_624p67_106p27 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_624p67_106p27 1nh
./gridpack_generation.sh HToZATo2L2B_624p67_124p74 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_624p67_124p74 1nh
./gridpack_generation.sh HToZATo2L2B_624p67_146p74 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_624p67_146p74 1nh
./gridpack_generation.sh HToZATo2L2B_624p67_173p06 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_624p67_173p06 1nh
./gridpack_generation.sh HToZATo2L2B_624p67_204p63 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_624p67_204p63 1nh
./gridpack_generation.sh HToZATo2L2B_624p67_242p47 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_624p67_242p47 1nh
./gridpack_generation.sh HToZATo2L2B_624p67_288p21 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_624p67_288p21 1nh
./gridpack_generation.sh HToZATo2L2B_624p67_343p89 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_624p67_343p89 1nh
./gridpack_generation.sh HToZATo2L2B_624p67_413p63 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_624p67_413p63 1nh
./gridpack_generation.sh HToZATo2L2B_624p67_505p30 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_624p67_505p30 1nh
./gridpack_generation.sh HToZATo2L2B_741p85_30p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_741p85_30p00 1nh
./gridpack_generation.sh HToZATo2L2B_741p85_35p13 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_741p85_35p13 1nh
./gridpack_generation.sh HToZATo2L2B_741p85_41p14 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_741p85_41p14 1nh
./gridpack_generation.sh HToZATo2L2B_741p85_48p18 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_741p85_48p18 1nh
./gridpack_generation.sh HToZATo2L2B_741p85_56p42 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_741p85_56p42 1nh
./gridpack_generation.sh HToZATo2L2B_741p85_66p07 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_741p85_66p07 1nh
./gridpack_generation.sh HToZATo2L2B_741p85_78p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_741p85_78p00 1nh
./gridpack_generation.sh HToZATo2L2B_741p85_92p08 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_741p85_92p08 1nh
./gridpack_generation.sh HToZATo2L2B_741p85_108p70 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_741p85_108p70 1nh
./gridpack_generation.sh HToZATo2L2B_741p85_128p32 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_741p85_128p32 1nh
./gridpack_generation.sh HToZATo2L2B_741p85_151p49 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_741p85_151p49 1nh
./gridpack_generation.sh HToZATo2L2B_741p85_178p83 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_741p85_178p83 1nh
./gridpack_generation.sh HToZATo2L2B_741p85_215p56 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_741p85_215p56 1nh
./gridpack_generation.sh HToZATo2L2B_741p85_264p18 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_741p85_264p18 1nh
./gridpack_generation.sh HToZATo2L2B_741p85_330p82 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_741p85_330p82 1nh
./gridpack_generation.sh HToZATo2L2B_741p85_426p37 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_741p85_426p37 1nh
./gridpack_generation.sh HToZATo2L2B_741p85_519p36 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_741p85_519p36 1nh
./gridpack_generation.sh HToZATo2L2B_741p85_644p16 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_741p85_644p16 1nh
./gridpack_generation.sh HToZATo2L2B_881p02_30p00 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_881p02_30p00 1nh
./gridpack_generation.sh HToZATo2L2B_881p02_35p42 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_881p02_35p42 1nh
./gridpack_generation.sh HToZATo2L2B_881p02_41p81 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_881p02_41p81 1nh
./gridpack_generation.sh HToZATo2L2B_881p02_49p35 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_881p02_49p35 1nh
./gridpack_generation.sh HToZATo2L2B_881p02_58p26 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_881p02_58p26 1nh
./gridpack_generation.sh HToZATo2L2B_881p02_68p78 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_881p02_68p78 1nh
./gridpack_generation.sh HToZATo2L2B_881p02_81p20 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_881p02_81p20 1nh
./gridpack_generation.sh HToZATo2L2B_881p02_95p85 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_881p02_95p85 1nh
./gridpack_generation.sh HToZATo2L2B_881p02_113p16 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_881p02_113p16 1nh
./gridpack_generation.sh HToZATo2L2B_881p02_133p58 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_881p02_133p58 1nh
./gridpack_generation.sh HToZATo2L2B_881p02_157p69 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_881p02_157p69 1nh
./gridpack_generation.sh HToZATo2L2B_881p02_186p16 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_881p02_186p16 1nh
./gridpack_generation.sh HToZATo2L2B_881p02_219p76 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_881p02_219p76 1nh
./gridpack_generation.sh HToZATo2L2B_881p02_259p43 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_881p02_259p43 1nh
./gridpack_generation.sh HToZATo2L2B_881p02_382p68 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_881p02_382p68 1nh
./gridpack_generation.sh HToZATo2L2B_881p02_533p65 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_881p02_533p65 1nh
./gridpack_generation.sh HToZATo2L2B_881p02_644p17 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_881p02_644p17 1nh
./gridpack_generation.sh HToZATo2L2B_881p02_798p96 cards/production/13TeV/higgs/HToZATo2L2B/PrivateProd/HToZATo2L2B_881p02_798p96 1nh
set +x
