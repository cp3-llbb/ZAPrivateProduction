import os, os.path
import argparse, optparse
import shutil
import logging
LOG_LEVEL = logging.DEBUG
stream = logging.StreamHandler()
stream.setLevel(LOG_LEVEL)
logger = logging.getLogger("ZA Cross checks")
logger.setLevel(LOG_LEVEL)
logger.addHandler(stream)

CMSSW_Calculators42HDM = os.path.join(os.environ["CMSSW_BASE"], "src", "cp3_llbb", "Calculators42HDM")
try:
    import colorlog
    from colorlog import ColoredFormatter
    formatter = ColoredFormatter(
                "%(log_color)s%(levelname)-8s%(reset)s %(log_color)s%(message)s",
                datefmt=None,
                reset=True,
                log_colors={
                        'DEBUG':    'cyan',
                        'INFO':     'green',
                        'WARNING':  'blue',
                        'ERROR':    'red',
                        'CRITICAL': 'red',
                        },
                secondary_log_colors={},
                style='%'
                )
    stream.setFormatter(formatter)
except ImportError:
    # https://pypi.org/project/colorlog/
    pass

def getcardsParams(cardname=None):
    split_cardname = cardname.split('/')
    split_cardname = split_cardname[-1]
    split_cardname = split_cardname.split('_')
    mh2 = split_cardname[1]
    mh3 = split_cardname[2]
    tb = split_cardname[3].replace('.dat','')
    return mh2, mh3, tb

def getPDGID(pdgid=None):
    dicts = {'h': 25, 'H':35, 'A':36, 'H+':37, 'H-':37, 'Z':23, 'b':5, 't':6, 'c': 4, 's':3, 'e':11, 've':12, 'mu':13, 'vm':14,'ta':15, 'vt':16, 'g':21, 'ga':22, 'W+':24, 'W-':-24, }
    dicts_flipped = {v:k for k, v in dicts.items()}
    try :
        key = dicts_flipped[int(pdgid)]
    except:
        key = dicts_flipped[-int(pdgid)]
    return key

def getTHDMprecisions(line = None, motherParticle= None, ID1= None, ID2= None, cardname = None, gettotal_width=False):
    with open(os.path.join(CMSSW_Calculators42HDM, cardname), 'r') as f:
        thdmc_BR = 0.
        thdmc_partialwidth = 0.
        thdmc_totalwidth = 0.
        mode = {'A':0, 'H':0}
        for line_ in f:
            if gettotal_width:
                if 'Decay table for {} '.format(motherParticle) not in line_ :
                    continue
                mode[motherParticle] = 1
                nextLine = next(f)
                if 'Total width:' in nextLine and mode[motherParticle] ==1:
                    thdmc_totalwidth = float(nextLine.split()[2])
            else:
                if '{}  -> {} {}'.format(motherParticle, getPDGID(ID1), getPDGID(ID2)) not in line_ and '{}  -> {} {}'.format(motherParticle, getPDGID(ID2), getPDGID(ID1)) not in line_ and '{}  -> {}  {}'.format(motherParticle, getPDGID(ID1), getPDGID(ID2)) not in line_ and '{}  -> {}  {}'.format(motherParticle, getPDGID(ID2), getPDGID(ID1)) not in line_:
                    continue
                print( 'IDS:', ID1, getPDGID(ID1), ID2, getPDGID(ID2) )
                print('thdmc:', line_)
                """
                Decay table for H
                Total width:   7.671e+01 GeV      BR
                H  -> s  s     7.945e-06      1.036e-07
                """
                thdmc_partialwidth = float(line_.split()[4])
                thdmc_BR= float(line_.split()[5])
        """"
        #      PDG        Width
        DECAY  35   2.318863e+02
        #  BR             NDA  ID1    ID2   ...
        9.095862e-01   2    36  23 # 210.920572285
        """
        pdgid = (35 if motherParticle== 'H' else( 36 if motherParticle== 'A' else (logger.error(' you are not suppose to change the decay of : {}'.format(motherParticle)))))
        if gettotal_width:
            newline = 'DECAY  {}   {:.6e}\n'.format(pdgid, thdmc_totalwidth)
        else:
            newline = '   {:.6e}   2    {}  {} # {:.11e}\n'.format(thdmc_BR, ID1, ID2, thdmc_partialwidth)
            if thdmc_BR == 0. or thdmc_partialwidth == 0. :
                logger.warning( 'THDMC does not include {} -> {} {} decay , the one from madspin will be kept'.format(motherParticle, ID1, ID2))
                logger.warning( line )
                newline =line
        print( 'old:', line)
        print( 'new:', newline )
    return newline

def set_ymb_to_MBOnshell(param_card1=None, param_card2=None):
    
    param_card = param_card1.replace('.decay_h2', '')
    mh2, mh3, tb = getcardsParams(param_card)
    cardname="madgraphInputs_mH-{}_mA-{}_tb-{}.log".format(mh2, mh3, tb)
    
    if os.path.exists( param_card):
        os.remove(param_card)
    if os.path.exists( param_card1) and os.path.exists( param_card2): 
        with open(param_card2, 'r') as inf2:
            with open(param_card, 'w+') as outf:
                ID1 =None
                ID2 =None
                inf2h2_mode = 0
                inf2h3_mode = 0
                for line2 in inf2:
                    if "DECAY  35" in line2:
                        inf2h2_mode = 1
                        inf2h3_mode = 0
                    elif "DECAY  36" in line2:
                        inf2h2_mode = 0
                        inf2h3_mode = 1
                        if tb =="1p50":
                            line2_modf =getTHDMprecisions(line=line2, motherParticle='A', ID1=None, ID2=None, cardname= cardname, gettotal_width=True)
                            outf.write(line2_modf)    
                    if "ymb" in line2:
                        outf.write('    5 {:.6e}   # ymb\n'.format(4.75))
                    elif inf2h3_mode ==1:
                        if tb =="1p50" and "DECAY  36" not in line2:
                            try:
                                ID1=line2.split()[2]
                                ID2=line2.split()[3]
                                line2_modf =getTHDMprecisions(line=line2, motherParticle='A', ID1=ID1, ID2=ID2, cardname= cardname, gettotal_width=False)
                                print( '--'*60)
                                outf.write(line2_modf)
                            except:
                                outf.write(line2)
                    elif "DECAY  35" in line2:
                        with open(param_card1, 'r') as inf1:
                            ID1_ =None
                            ID2_ =None
                            inf1h2_mode = 0
                            inf1h3_mode = 0
                            for line1 in inf1:
                                if "DECAY  35" in line1:
                                    inf1h2_mode = 1
                                    inf1h3_mode = 0
                                    if tb =="1p50":
                                        line1_modf =getTHDMprecisions(line=line1, motherParticle='H', ID1=None, ID2=None, cardname=cardname, gettotal_width=True) 
                                        outf.write(line1_modf)
                                elif "DECAY  36" in line1:
                                    inf1h2_mode = 0
                                    inf1h3_mode = 1
                                
                                if inf1h2_mode == 1:
                                    if tb =="1p50":
                                        if "DECAY  35" not in line1:
                                            try:
                                                ID1_=line1.split()[2]
                                                ID2_=line1.split()[3]
                                                line1_modf =getTHDMprecisions(line=line1, motherParticle='H', ID1=ID1_, ID2=ID2_, cardname=cardname, gettotal_width=False) 
                                                print( '--'*60)
                                                outf.write(line1_modf)
                                            except:
                                                outf.write(line1)
                                    else:
                                        outf.write(line1)
                    else:
                        outf.write(line2)
                    
        # there will be no need for these cards 
        #os.remove(param_card1)
        #os.remove(param_card2)
        print ( "{} successfully overwritten with h2 h3 and Z decay width and BR!".format(param_card) ) 
    else:
        logger.error(" param_card with h2 decay OR param_card with h3 and Z decay is missing, please run ./bin/mg5_aMC run_madwidths.sh from MG5_aMC_vX_X_X first !")
    return

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='', formatter_class=argparse.RawTextHelpFormatter)
    parser.add_argument('--param_card1', required=True, help='')
    parser.add_argument('--param_card2', required=True, help='')
    options = parser.parse_args()
    
    set_ymb_to_MBOnshell(param_card1=options.param_card1, param_card2=options.param_card2)
