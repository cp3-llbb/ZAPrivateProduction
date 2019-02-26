#!/bin/env python
import os, stat

CMSSW_RELEASE='CMSSW_10_2_11/src'

NANOAOD_template_dir = 'NANOAOD/'
tag = 'prod-v0'
pwd = os.getcwd()

def copy_to_cmssw(f, replaceTemplateString = None, replacedataset = None, replaceTag = None):
    f1 = f
    if replaceTemplateString:
        # replace file name
        f1 = f.replace('template', replaceTemplateString)
    sour = os.path.join(pwd, NANOAOD_template_dir, f)
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
		out_f.write(newline)   
    return

def prepare_all_NANOAOD():
    # loop over mass hypotheses and create the cmssw + crab config files:
    with open('/nfs/scratch/fynu/asaggio/ZAPrivateProd_2018/ZAPrivateProduction/MINIAOD_published.txt', 'r') as f:
        for line in f:
            dataset = line.strip()
            pd = dataset.split('/')[1]
            #masspoint_list = pd.split('_')
            #masspoint = masspoint_list[1]+'_'+masspoint_list[2]
            copy_to_cmssw('crab_template_NANOAOD.py', replaceTemplateString = pd, replacedataset = dataset, replaceTag = tag)
            #copy_to_cmssw('template_NANOAOD_cfg.py', replaceTemplateString = pd, replacedataset = dataset, replaceTag = tag)
            copy_to_cmssw('template_NANOAOD_cfg.py', replaceTemplateString = pd, replacedataset = dataset, replaceTag = tag)
             
        
if __name__ == '__main__':
    prepare_all_NANOAOD()
