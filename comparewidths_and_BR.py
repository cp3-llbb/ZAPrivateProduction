import sys
import os, os.path
import glob
import argparse, optparse
import matplotlib
import matplotlib.pyplot as plt
import mpltex
from cp3_llbb.Calculators42HDM.CalcMadWidths import *
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


def madwidths_computation(cardname=None):
    mad = CalcMadWidths(param_card="%s"%cardname)
    mad.setparam_card("%s"%cardname)
    mad.get_widthsandBR()
    totwidth_h1= mad.totwh1
    totwidth_h2= mad.totwh2
    totwidth_h3= mad.totwh3
    totwidth_hc= mad.totwhc

    return totwidth_h1, totwidth_h2, totwidth_h3, totwidth_hc

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
def PlotWidths(thdmc_cards=None, default_cards=None, madspin_cards=None, NWA=False):
    fig= plt.figure(figsize=(8,6))
    ax = fig.add_subplot(111)
    scan ="mh3" # TODO maybe add additional scan such h2 and h1 
    colors=['pink', 'crimson', 'indigo', 'magenta', 'limegreen', 'blueviolet', 'plum', 'purple', 'hotpink', 'mediumseagreen', 'springgreen', 'aquamarine', 'turquoise', 'aqua', 'mediumslateblue', 'orchid', 'deeppink', 'darkturquoise', 'teal', 'mediumslateblue']

    wh3_dict= {thdmc_cards:{'1.5':[],'20.0':[]},
               madspin_cards:{'1.5':[],'20.0':[]},
               default_cards:{'1.5':[],'20.0':[]},
               }
    
    for idx, dir in enumerate(wh3_dict.keys()):
        mh3=125.
        mh1=125.
        MZ= 9.118760e+01
        print (dir )
        if dir == 'thdmc_cards':
            logger.warning( ' No 2HDMC cards is given , h3 particle width need to be recalculated !')
        mh3_list= {'1.5':[],'20.0':[]}
        while mh3 < 1500.:
            mh2= mh3+MZ
            mhc=max(mh2, mh3)
            
            if dir == 'thdmc_cards':
                # l2, l3, lR7, wh3tot, wh3tobb, sinbma = call_Calculators42HDM( mH, mA, mh, mhc, tb)
                wh3_dict[dir]['1.5'].append(call_Calculators42HDM( mh2, mh3, mh1, mhc, 1.5)[3])
                wh3_dict[dir]['20.0'].append(call_Calculators42HDM( mh2, mh3, mh1, mhc, 20.0)[3])
                mh3_list['1.5'].append(mh3)
                mh3_list['20.0'].append(mh3)
            else:
                for cardname in sorted(glob.glob(os.path.join(dir,'*.dat'))):
                    if not cardname.split('/')[-1].startswith('out_param_card_{}'.format(mass_to_string(mh2))):
                        continue
                    mh2, mh3, tb = getcardsParams(cardname=cardname)
                    totwidth_h1, totwidth_h2, totwidth_h3, totwidth_hc =madwidths_computation(cardname=cardname)
                    
                    mh3_list[str(tb)].append(mh3)
                    wh3_dict[dir][str(tb)].append(totwidth_h3)
                    #print( mh2, mh3, tb)
                    #print( totwidth_h1, totwidth_h2, totwidth_h3, totwidth_hc)
            mh3 +=50.
    print( mh3_list, wh3_dict)
        
    for tb in ['1.5', '20.0']:
        for idx, dir in enumerate(wh3_dict.keys()):
            # 0 default 1 thdmc 2 madspin
            linestyles = mpltex.linestyle_generator()
            mymarker = ( 'o' if idx ==0 else( '>' if idx ==1 else( 's')))
            runopts=( 'after Yukawa coupling fix' if idx==2 else ( 'before Yukawa coupling fix' if idx==0 else('from 2HDMC.1.8.0' )))
        
            if NWA:
                wh3_dict[dir][tb] = [i / j for i, j in zip(wh3_dict[dir][tb], mh3_list[tb])]

            plt.plot(mh3_list[tb], wh3_dict[dir][tb], color=colors[idx], linestyle='solid', marker=mymarker, linewidth=2., label=r'$tan\beta= %s $: %s'%(tb, runopts)) 
        title = r'M_{A}= M_{H}-M_{Z}' if scan=='mh3' else ( r'M_{H}= M_{A}+M_{Z}')
        plt.title(r'$2HDM-typeII: %s, M_{H^\pm}=M_{H}, cos(\beta-\alpha)= 0.01, m12= (M_{H^\pm}^2 tan\beta )/(1+tan\beta^2), mh= 125. GeV$'%(title), fontsize=10)
    
        ax.set_ylabel(r'$\Gamma_{tot} %s [GeV]$'%('/ M' if NWA else('')) , fontsize=14, horizontalalignment='right', y=1.0)
        ax.set_xlabel(r'$MA[GeV]$', fontsize=14, horizontalalignment='right', y=1.0)
    
        ax.set_xlim(xmin=min(mh3_list[tb]), xmax=max(mh3_list[tb]))
        ax.set_yscale('log')
        ax.legend()
    
        fig.tight_layout()
        fig.savefig('h3_totalwidth{}_tb-{}_funcofmassh3.png'.format('dividedbyMass' if NWA else(''), tb))
        plt.gcf().clear()

    return


if __name__ == '__main__':

    parser = argparse.ArgumentParser(description='This script allow you to compare the computed width from MadWidth to the one from the 2HDMC1.8.0', formatter_class=argparse.RawTextHelpFormatter)
    parser.add_argument('--default_cardsDIR', required=True, help='these cards should be the default cards given by the UFO model 2HDMtII_NLO, with the main change such the masses , tb , sinbma . NO Yukawa coupling fix neither the mb ( pole mass ) !')
    parser.add_argument('--thdmc_cardsDIR', required=False, default='thdmc_cards', help='if not given Calculators42HDM will recompute the width again for mh3 in range(125., 1500.)')
    parser.add_argument('--madspin_cardsDIR', required=True, help='path to card dir after running mg script ** run_madwidths.sh **, the name of the cards should be kept in this format out_param_card_mh2_mh3_tb.dat. These cards different from default_cardsDIR by simply adding the mb mass = 4.75 GeV and the yukawa coupling of the botton quark ! ')
    parser.add_argument('--NWA', action='store_true', help=' plot Total_width/Mass = f(MA) if true else Total_width = f(MA) !')
    options = parser.parse_args()
    PlotWidths(thdmc_cards=options.thdmc_cardsDIR, default_cards= options.default_cardsDIR, madspin_cards=options.madspin_cardsDIR, NWA = options.NWA)
