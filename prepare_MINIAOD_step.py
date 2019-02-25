#!/bin/env python
import os, stat

CMSSW_RELEASE='CMSSW_8_0_21/src'

MINIAOD_template_dir = 'MINIAOD/'
tag = 'prod-v2'
pwd = os.getcwd()

def copy_to_cmssw(f, replaceTemplateString = None, replacedataset = None, replaceTag = None):
    f1 = f
    if replaceTemplateString:
        # replace file name
        f1 = f.replace('template', replaceTemplateString)
    sour = os.path.join(pwd, MINIAOD_template_dir, f)
    dest = os.path.join(pwd, CMSSW_RELEASE, f1)
    with open(sour, 'r') as in_f:
        with open(dest, 'w+') as out_f:
            for line in in_f:
                if replaceTemplateString:
                    newline = line.replace('template', replaceTemplateString)
                if replaceTag:
                    newline = newline.replace('TAG', replaceTag)
                if replacedataset:
                    newline = newline.replace('DATASET', replacedataset)
                if replaceMassPoint:
                    newline = newline.replace('MASSPOINT', replaceMassPoint)
                out_f.write(newline)
    return

def prepare_all_MINIAOD():
    # loop over mass hypotheses and create the cmssw + crab config files:
    with open('published_DR_step2_prod-v0.txt', 'r') as f:
        for line in f:
            dataset = line.strip()
            pd = dataset.split('/')[1]
            masspoint_list = pd.split('_')
            masspoint = masspoint_list[1]+'_'+masspoint_list[2]
            copy_to_cmssw('crab_template_MINIAOD.py', replaceTemplateString = pd, replacedataset = dataset, replaceTag = tag)
            copy_to_cmssw('template_MINIAOD_cfg.py', replaceTemplateString = pd, replacedataset = dataset, replaceTag = tag)

        
if __name__ == '__main__':
    prepare_all_MINIAOD()

