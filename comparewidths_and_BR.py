import sys
import os, os.path
import glob
import argparse, optparse
import matplotlib
import matplotlib.pyplot as plt
import mpltex
from cp3_llbb.Calculators42HDM.CalcMadWidths import *
from cp3_llbb.Calculators42HDM.labellines import *
from prepare_paramcard import call_Calculators42HDM

import logging
LOG_LEVEL = logging.DEBUG
stream = logging.StreamHandler()
stream.setLevel(LOG_LEVEL)
logger = logging.getLogger("h3 Widths")
logger.setLevel(LOG_LEVEL)
logger.addHandler(stream)

try:
    import colorlog
    from colorlog import ColoredFormatter
    LOGFORMAT = "  %(log_color)s%(levelname)-8s%(reset)s | %(log_color)s%(message)s%(reset)s"
    formatter = ColoredFormatter(LOGFORMAT)
    stream.setFormatter(formatter)
except ImportError:
    pass

if "CMSSW_BASE" not in os.environ:
    raise RuntimeError("This script needs to be run in a CMSSW environment, with cp3_llbb/Calculators42HDM set up")
CMSSW_Calculators42HDM = os.path.join(os.environ["CMSSW_BASE"], "src", "cp3_llbb", "Calculators42HDM")


def madwidths_computation(cardname=None, cardtype=None):
    
    mad = CalcMadWidths(param_card="%s"%cardname, cardtype=cardtype)
    mad.setparam_card("%s"%cardname)
    mad.setcardtype(cardtype)
    mad.get_widths_and_BR()
    
    totwidth_h1= mad.totwh1
    totwidth_h2= mad.totwh2
    totwidth_h3= mad.totwh3
    totwidth_hc= mad.totwhc

    wh1tobb = mad.wh1tobb
    wh2tobb = mad.wh2tobb
    wh3tobb = mad.wh3tobb
    
    BR = {
   #         'BRhtoss': [],
   #         'BRhtocc': [],
            'BRhtobb': [],
   #         'BRhtoee': [],
   #         'BRhtomumu': [],
            'BRhtotautau': [],
   #         'BRhtogg': [],
   #         'BRhtoZZ': [],
   #         'BRhtoWW': [],
   #         'BRhtoZga': [],
   #         'BRhtogluglu': [] 
   }
    
    #BR['BRhtoss'].append(mad.h1tossBR)
    #BR['BRhtocc'].append(mad.h1toccBR)
    BR['BRhtobb'].append(mad.h1tobbBR)
    #BR['BRhtoee'].append(mad.h1toeeBR)
    #BR['BRhtomumu'].append(mad.h1tomumuBR)
    BR['BRhtotautau'].append(mad.h1totautauBR)
    #BR['BRhtogg'].append(mad.h1toggBR) # gamma-gamma
    #BR['BRhtoZZ'].append(mad.h1toZZBR)
    #BR['BRhtoWW'].append(mad.h1toWWBR)
    #BR['BRhtoZga'].append(mad.h1toZgaBR)
    #BR['BRhtogluglu'].append(mad.h1toglugluBR)

    return totwidth_h1, totwidth_h2, totwidth_h3, wh1tobb, wh2tobb, wh3tobb, BR

def string_to_mass(s):
    m = float(s.replace('p', '.'))
    return m

def mass_to_string(m):
    r = '{:.2f}'.format(m)
    r = r.replace('.', 'p')
    return r

def getcardsParams(cardname=None):
    split_cardname = cardname.split('/')
    split_cardname = split_cardname[-1]
    split_cardname = split_cardname.split('_')
    mh2 = string_to_mass(split_cardname[3])
    mh3 = string_to_mass(split_cardname[4])
    tb = string_to_mass(split_cardname[5].replace('.dat',''))
    return mh2, mh3, tb

#@mpltex.acs_decorator
def PlotWidths(thdmc_cards=None, default_cards=None, madspin_cards=None, NWA=False, BR=False):
    scan = "mh3"
    colors = ['pink', 'crimson', 'indigo', 'magenta', 'limegreen', 'blueviolet', 'plum', 'purple', 'hotpink', 'mediumseagreen', 'springgreen', 'aquamarine', 'turquoise', 'aqua', 'mediumslateblue', 'orchid', 'deeppink', 'darkturquoise', 'teal', 'mediumslateblue']
    markers = [ 'o', '>', 's' ]

    totalwh3_dict= {thdmc_cards:{'1.5':[],'20.0':[]}, madspin_cards:{'1.5':[],'20.0':[]}, default_cards:{'1.5':[],'20.0':[]} }
    patialwh3tobb_dict= {thdmc_cards:{'1.5':[],'20.0':[]}, madspin_cards:{'1.5':[],'20.0':[]}, default_cards:{'1.5':[],'20.0':[]} }
    h1_BRresults = {thdmc_cards:{'1.5':{},'20.0':{}}, madspin_cards:{'1.5':{},'20.0':{}}, default_cards:{'1.5':{},'20.0':{}} }

    for idx, dir in enumerate(totalwh3_dict.keys()):
        mh3=125. #50.
        mh1=125.
        MZ= 9.118760e+01
        print (dir )
        if dir == 'thdmc_cards':
            logger.warning( ' No 2HDMC cards is given , h3 particle width need to be recalculated !')
        cardtype = ('thdmc' if '2hdmc180' in  dir else('ufo')) 
        mh3_list= {'1.5':[],'20.0':[]}
        BRs = {'1.5': {
                'BRhtobb': [],
                'BRhtotautau': [] },
            '20.0': {
                'BRhtobb': [],
                'BRhtotautau': [] },
        }
        while mh3 < 1500.:
            mh2= mh3+MZ
            mhc=max(mh2, mh3)
            
            if dir == 'thdmc_cards':
                
                for tb in [1.5, 20.0]:
                    l2, l3, lR7, totwidth_h3, wh3tobb, sinbma, results= call_Calculators42HDM( mh2, mh3, mh1, mhc, tb)
                    totalwh3_dict[dir][str(tb)].append(totwidth_h3)
                    patialwh3tobb_dict[dir][str(tb)].append(wh3tobb)
                    mh3_list[str(tb)].append(mh3)
                    print(BRs)
                    for k in BRs[str(tb)].keys():
                        BRs[str(tb)][k].append(results[k][0])
                    h1_BRresults[dir][str(tb)].update(BRs[str(tb)])
            else:
                for cardname in sorted(glob.glob(os.path.join(dir,'*.dat'))):
                    if not cardname.split('/')[-1].startswith('out_param_card_{}'.format(mass_to_string(mh2))):
                        continue
                    mh2, mh3, tb = getcardsParams(cardname=cardname)
                    totwidth_h1, totwidth_h2, totwidth_h3, wh1tobb, wh2tobb, wh3tobb, results= madwidths_computation(cardname=cardname, cardtype=cardtype)
                    
                    mh3_list[str(tb)].append(mh3)
                    totalwh3_dict[dir][str(tb)].append(totwidth_h3)
                    patialwh3tobb_dict[dir][str(tb)].append(wh3tobb)
                    for k in BRs[str(tb)].keys():
                        BRs[str(tb)][k].append(results[k][0])
                    h1_BRresults[dir][str(tb)].update(BRs[str(tb)])
            
            mh3 +=50.
    for dir in h1_BRresults.keys():
        for tb in ['1.5']:
            print( dir, ':::::::::::::::::::::::', (h1_BRresults[dir][tb]['BRhtobb']))
            #print( dir, ':::::::::::::::::::::::', (h1_BRresults[dir][tb]['BRhtotautau']))

    print( h1_BRresults )
    if BR:
        for decayto in ['2fermions']:#, '2gaugebosons']:
            for tb in ['1.5', '20.0']:
                fig= plt.figure(figsize=(8,6))
                ax = fig.add_subplot(111)
                for idx, dir in enumerate(h1_BRresults.keys()):
                    results = h1_BRresults[dir][tb]
                    runopts=( 'after Yukawa coupling fix' if 'after' in dir else ( 'before Yukawa coupling fix' if 'before' in dir else('from 2HDMC.1.8.0' )))
                    
                    if decayto == '2fermions':
                        plt.plot(mh3_list[tb],results['BRhtobb'], color=colors[idx], marker=markers[idx], label=r'b$\bar{b}:$ %s'%runopts)
                        #plt.plot(mh3_list[tb],results['BRhtotautau'], color=colors[idx+2], marker=markers[idx], label=r'$\tau \tau:$ %s'%runopts)
                        #plt.plot(mh3_list[tb],results['BRhtomumu'], color=colors[idx+2], marker='o', label=r'$\mu^+\mu^-$')
                        #plt.plot(mh3_list[tb],results['BRhtocc'], color=colors[idx+3], marker='o', label=r'c$\bar{c}$')
                    else:
                        plt.plot(mh3_list[tb],results['BRhtogg'], color=colors[idx], marker='o', label=r'$\gamma \gamma$')
                        plt.plot(mh3_list[tb],results['BRhtoZZ'], color=colors[idx+1], marker='o', label=r'$ZZ$')
                        plt.plot(mh3_list[tb],results['BRhtoWW'], color=colors[idx+2], marker='o', label=r'$WW$')
                        plt.plot(mh3_list[tb],results['BRhtoZga'], color=colors[idx+3], marker='o', label=r'Z$\gamma$')
                        plt.plot(mh3_list[tb],results['BRhtogluglu'], color=colors[idx+4], marker='o', label=r'$gg$')
                
                if decayto == '2fermions':                
                    ax.axhspan((5.824E-01- 0.65*5.824E-01/100.) , (5.824E-01+ 0.65*5.824E-01/100.) , color='limegreen', label=r'b$\bar{b}:$ CERN Yellow Report4')
                    #ax.axhspan((6.272E-02- 1.160*6.272E-02/100.) , (6.272E-02+ 1.17*6.272E-02/100.) , color=colors[idx+2], label=r'$\tau \tau:$ CERN Yellow Report4')
                    #ax.axhspan((2.176E-04- 1.23*2.176E-04/100.) , (2.176E-04+ 1.23*2.176E-04/100.) , color=colors[idx+2])
                    #ax.axhspan((2.891E-02- 1.20*2.891E-02/100.) , (2.891E-02+ 1.20*2.891E-02/100.) , color=colors[idx+3])
                
                    #labelLines(plt.gca().get_lines(),align=True,fontsize=10)
                else:
                    ax.axhspan((2.270E-03- 1.73*2.270E-03/100.) , (2.270E-03+ 1.72*2.270E-03/100.) , color=colors[idx])
                    ax.axhspan((2.619E-02- 0.99*2.619E-02/100.) , (2.619E-02+ 0.99*2.619E-02/100.) , color=colors[idx+1])
                    ax.axhspan((2.137E-01- 0.99*2.137E-01/100.) , (2.137E-01+ 0.99*2.137E-01/100.) , color=colors[idx+2])
                    ax.axhspan((1.533E-03- 5.71*1.533E-03/100.) , (1.533E-03+ 5.71*1.533E-03/100.) , color=colors[idx+3])
                    ax.axhspan((8.187E-02- 3.40*8.187E-02/100.) , (8.187E-02+ 3.41*8.187E-02/100.) , color=colors[idx+4])

                    #labelLines(plt.gca().get_lines(),align=True,fontsize=10)
                
                plt.ylabel(r'$BR(SM Higgs\rightarrow XX)$')
                plt.xlabel(r'$M_{A} [GeV]$')
                plt.yscale('log')
                #plt.xscale('log')
                title = r'M_{A}= M_{H}-M_{Z}'
                plt.title(r'$2HDM-typeII: %s, M_{H^\pm}=M_{H}, tan\beta= %s, cos(\beta-\alpha)= 0.01, m12= (M_{H^\pm}^2 tan\beta )/(1+tan\beta^2), mh= 125. GeV$'%(title, tb), fontsize=8)
                plt.ylim(1E-1, 1.1E0)
                plt.legend()
                ax.set_xlim(xmin=min(mh3_list[tb]), xmax=max(mh3_list[tb]))
                ax.set_yscale('log')
                fig.savefig('plOts/compare_smhiggsBR_decayto-{}_before_and_after_ymbFIX__asfunc-mh3_tb-{}.png'.format(decayto, tb))
                plt.gcf().clear()

    for w, dict in zip(['total', 'partial'], [ totalwh3_dict,patialwh3tobb_dict]):
        for tb in ['1.5', '20.0']:
            fig= plt.figure(figsize=(8,6))
            ax = fig.add_subplot(111)
            for idx, dir in enumerate(dict.keys()):
                # 0 default 1 thdmc 2 madspin
                linestyles = mpltex.linestyle_generator()
                runopts=( 'after Yukawa coupling fix' if 'after' in dir else ( 'before Yukawa coupling fix' if 'before' in dir else('from 2HDMC.1.8.0' )))
            
                if NWA:
                    dict[dir][tb] = [i / j for i, j in zip(dict[dir][tb], mh3_list[tb])]
                

                else:
                    plt.plot(mh3_list[tb], dict[dir][tb], color=colors[idx], linestyle='solid', marker=markers[idx], linewidth=2., label=r'$tan\beta= %s $: %s'%(tb, runopts)) 
                    ax.set_ylabel(r'$\Gamma_{%s} %s [GeV]$'%(w, '/ M' if NWA else('')) , fontsize=14, horizontalalignment='right', y=1.0)
                    ax.set_xlabel(r'$MA[GeV]$', fontsize=14, horizontalalignment='right', y=1.0)
                
                    ax.set_xlim(xmin=min(mh3_list[tb]), xmax=max(mh3_list[tb]))
                    ax.set_yscale('log')
                    ax.legend()
            
            title = r'M_{A}= M_{H}-M_{Z}'
            plt.title(r'$2HDM-typeII: %s, M_{H^\pm}=M_{H}, cos(\beta-\alpha)= 0.01, m12= (M_{H^\pm}^2 tan\beta )/(1+tan\beta^2), mh= 125. GeV$'%(title), fontsize=10)
            
            fig.tight_layout()
            fig.savefig('plOts/h3_{}width{}_tb-{}_funcofmassh3.png'.format(w, 'dividedbyMass' if NWA else(''), tb))
            plt.gcf().clear()

    return

if __name__ == '__main__':

    parser = argparse.ArgumentParser(description='This script allow you to compare the computed width from MadWidth to the one from the 2HDMC1.8.0', formatter_class=argparse.RawTextHelpFormatter)
    parser.add_argument('--default_cardsDIR', required=True, help='these cards should be the default cards given by the UFO model 2HDMtII_NLO, with the only  changes the masses(mh3, mh2, mh1), tb , sinbma, you set the width for  h3 and h2 and that is all !!. NO Yukawa coupling fix neither the mb ( pole mass ) !')
    parser.add_argument('--thdmc_cardsDIR', required=False, default='thdmc_cards', help='if not given Calculators42HDM will recompute the width again for mh3 in range(50., 1500.)')
    parser.add_argument('--madspin_cardsDIR', required=True, help='path to card dir after running mg script ** run_madwidths.sh **, the name of the cards should be kept in this format out_param_card_xxxpxx_xxxpxx_xxpxx.dat.format(mh2, mh3, tb). These cards different from default_cardsDIR by simply adding the mb mass = 4.75 GeV and the yukawa coupling of the botton quark , as well the width and the mass of the charged higgs ! ')
    parser.add_argument('--NWA', action='store_true', help=' plot Total_width/Mass = f(MA) if true else Total_width = f(MA) !')
    parser.add_argument('--BR', action='store_true', help=' effect of the Yukawa coupling fix on BR(h1) , comparing to the precision measurments in the yellow paper : https://twiki.cern.ch/twiki/bin/view/LHCPhysics/CERNYellowReportPageBR')
    options = parser.parse_args()
    PlotWidths(thdmc_cards=options.thdmc_cardsDIR, default_cards= options.default_cardsDIR, madspin_cards=options.madspin_cardsDIR, NWA = options.NWA, BR = options.BR)
