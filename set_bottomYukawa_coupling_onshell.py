import os, os.path
import argparse, optparse
import shutil

def set_ymb_to_MBOnshell(param_card1=None, param_card2=None):
    
    param_card = param_card1.replace('.decay_h2', '')
    if os.path.exists( param_card):
        os.remove(param_card)
    
    with open(param_card2, 'r') as inf2:
        with open(param_card, 'w+') as outf:
            h2_mode = 0
            for line2 in inf2:
                # BLOCK MASS #
                if "ymb" in line2:
                    outf.write('    5 {:.6f}   # ymb\n'.format(4.75))
                elif "DECAY  35" in line2:
                    with open(param_card1, 'r') as inf1:
                        for line1 in inf1:
                            if "DECAY  35" in line1:
                                h2_mode = 1
                            elif "DECAY  36" in line1:
                                h2_mode = 0
                            if h2_mode == 1:
                                outf.write(line1)
                else:
                    outf.write(line2)
                
    # there will be no need for these cards 
    os.remove(param_card1)
    os.remove(param_card2)
    print ( "param_card successfully overwritten with h2 h3 and Z decay !" ) 
    return

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='', formatter_class=argparse.RawTextHelpFormatter)
    parser.add_argument('--param_card1', required=True, help='')
    parser.add_argument('--param_card2', required=True, help='')
    options = parser.parse_args()
    
    set_ymb_to_MBOnshell(param_card1=options.param_card1, param_card2=options.param_card2)
