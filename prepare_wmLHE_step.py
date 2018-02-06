#!/bin/env python
from ZA_common import *
import os
import stat
import shutil

CMSSW_RELEASE_wmLHE = 'CMSSW_7_1_20_patch2/src'
grid = which_points({})


wmLHEdir = 'wmLHE/'
pwd = os.getcwd()
def copy_to_cmssw(f, setEXE = False, replaceTemplateString = None):
    f1 = f
    if replaceTemplateString:
        # replace file name
        f1 = f.replace('template', replaceTemplateString)
    sour = os.path.join(pwd, wmLHEdir, f)
    dest = os.path.join(pwd, CMSSW_RELEASE_wmLHE, f1)
    if replaceTemplateString:
        # replace file content if needed
        with open(sour, 'r') as in_f:
            with open(dest, 'w+') as out_f:
                for line in in_f:
                    newline = line.replace('template', replaceTemplateString)
                    out_f.write(newline)
    else:
        shutil.copyfile(sour, dest)
    if setEXE:
        st = os.stat(dest)
        os.chmod(dest, st.st_mode | stat.S_IEXEC)
    return

def prepare_all_wmLHE_fragments_and_config():
    # copy executable script and make it executable
    copy_to_cmssw('download_gridpack_then_cmsRun.sh', setEXE = True)
    # loop over mass hypotheses and create the files
    for p in grid['ellipses_rho_1']:
        copy_to_cmssw('HToZATo2L2B_template_wmLHE_cfg.py', replaceTemplateString=point_to_string(p))
        copy_to_cmssw('crab_HToZATo2L2B_template.py', replaceTemplateString=point_to_string(p))
        print point_to_string(p)
    return

if __name__ == '__main__':
    prepare_all_wmLHE_fragments_and_config()
