#!/bin/bash
set -x
MASS_POINT=""
# hacking around the fact that CRAB3 'scriptArgs' MUST be in the form param=value
#MASS_POINT=`echo ${1} | cut -d = -f 2`
for i in "$@"
do
    echo "arg= $i"
    case $i in
        MASS_POINT=*)
        MASS_POINT="${i#*=}"
        ;;
    esac
done


xrdcp root://cmsxrootd.fnal.gov//store/group/phys_higgs/HiggsExo/obondu/ZA_private_prod_gridpacks/HToZATo2L2B_${MASS_POINT}_tarball.tar.xz .
pwd
ls -l
cmsRun -j FrameworkJobReport.xml -p HToZATo2L2B_${MASS_POINT}_wmLHE_cfg.py
set +x
