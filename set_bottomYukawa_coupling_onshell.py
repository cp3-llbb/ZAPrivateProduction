import os, os.path
import argparse, optparse
import shutil

def set_ymb_to_MBOnshell(backup_card=None):
    needed_card = backup_card.replace('.backup','')
    with open(backup_card, 'r') as inf:
        with open(os.path.join(needed_card), 'w+') as outf:
            for line in inf:
                # BLOCK MASS #
                if "ymb" in line:
                    outf.write('    5 {:.6f}   # ymb\n'.format(4.75))
                else:
                    outf.write(line)
    return

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='', formatter_class=argparse.RawTextHelpFormatter)
    parser.add_argument('--backup_card', required=True, help='')
    options = parser.parse_args()
    set_ymb_to_MBOnshell(backup_card=options.backup_card)
