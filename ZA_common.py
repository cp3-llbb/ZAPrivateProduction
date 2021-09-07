#!/bin/env python
import json
from scipy.stats import gaussian_kde
import numpy as np
import matplotlib.pyplot as plt

def string_to_mass(s):
    s = s.replace('p', '.')
    return float(s)

def which_points(grid):
    grid['atlas_benchmarks'] = [
            ( 200, 125), 
            ( 500, 250),
            ( 240, 130),
            ( 500, 300), 
            #( 550, 300), 
            ( 670, 500), 
            ( 780, 680), 
            ( 700, 200), 
            ( 800, 140),
            ]
    grid['fullsim'] = [
            ( 200, 50), ( 200, 100),
            ( 250, 50), ( 250, 100),
            ( 300, 50), ( 300, 100), ( 300, 200),
            ( 500, 50), ( 500, 100), ( 500, 200), ( 500, 300), ( 500, 400),
            ( 650, 50),
            ( 800, 50), ( 800, 100), ( 800, 200),              ( 800, 400),              ( 800, 700),
            (1000, 50),              (1000, 200),                           (1000, 500),
        ]
    with open('data/points_1.000000_1.000000.json') as f:
        d = json.load(f)
        # format the output into tuples
        grid['ellipses_rho_1'] = [(mH, mA,) for mA, mH in d]
    
    with open('data/points_0.500000_0.500000.json') as f:
        d = json.load(f)
        # format the output into tuples
        grid['ellipses_rho_0p5'] = [(mH, mA,) for mA, mH in d]
    with open('data/list_gridpacks.txt') as f:
        grid['gridpacks_available'] = []
        for line in f:
            mH, mA = line.split('_')[1:3]
            mH = string_to_mass(mH)
            mA = string_to_mass(mA)
            grid['gridpacks_available'].append((mH, mA,))
    return grid

def mass_to_string(m):
    r = '{:.2f}'.format(m)
    r = r.replace('.', 'p')
    return r

def point_to_string(p):
    return mass_to_string(p[0]) + "_" + mass_to_string(p[1])

def float_to_mass(m):
    r = '{:.2f}'.format(m)
    return float(r)

grid = {}
grid = which_points(grid)
fig= plt.figure(figsize=(8,6))
ax = fig.add_subplot(111)

#process = ['ggH', 'bbH']
processes = ['both']
#gglistOftanbeta = [0.5, 1.0, 1.5, 2.0, 3.0, 4.5, 5.0, 6.0, 6.5, 7.0]
#bblistOftanbeta = [8., 10., 20., 30., 40., 50., 55., 60.]
gglistOftanbeta = [1.5]
bblistOftanbeta = [20.]
colors=['forestgreen', 'pink', 'crimson', 'magenta', 'indigo', 'limegreen', 'blueviolet', 'plum', 'purple', 'hotpink', 'mediumseagreen', 'springgreen', 'aquamarine', 'turquoise', 'aqua', 'mediumslateblue', 'orchid', 'deeppink', 'darkturquoise', 'teal', 'mediumslateblue']

As =[]
Hs =[]
for p in processes:
    nbrsignal = 0
    m = 0
    lab = ''
    lab2 = ''
    for H, A in (grid['fullsim']+grid['ellipses_rho_1'] +grid['atlas_benchmarks']):#+ grid['ellipses_rho_0p5']): 
        #if H < 350.:
        #    tbvalues = gglistOftanbeta + bblistOftanbeta
        #else:
        #    tbvalues=(gglistOftanbeta if p =='ggH'  else( bblistOftanbeta))
        
        #for i, tb in enumerate(tbvalues):
        As.append(A)
        Hs.append(H)
        if (H, A) in (grid['atlas_benchmarks']):
            c ='cyan' if (H, A) ==( 200, 125) else('red')
            if (H, A) ==( 200, 125):
                lab2 = r'$A\rightarrow Zh(125)$'
            if m==0:
                lab2 = r'$A\rightarrow ZH$'
            plt.plot([A], [H], marker='*', markersize=12, color=c, label = lab2)
            plt.plot([H], [A], marker='*', markersize=12, color=c)
            m +=1
            lab2 = ''
        if nbrsignal==0:
            lab = r'$H\rightarrow ZA$'
        #plt.plot([A], [H], '2', color='crimson')
        plt.plot([A], [H], 'o', color='darkblue', label = lab)

        nbrsignal +=1
        lab = ''
        #plt.scatter([A], [H], c=[tb], cmap="jet", s=tb)#, alpha = 0.5 )
        #handles, labels = ax.get_legend_handles_labels()
    print('** Total Nbr of Signal Mass Points for {} process :'.format(p), 2*nbrsignal)
    print('** Total Nbr to be requested events for {} process(gg-fusion and b-associated production ) for the 3years (20k per sample ):'.format(p), 2*nbrsignal*30000*3)
    #cbar = plt.colorbar()
    #cbar.set_label(r'$tan\beta$')
    #cbar.set_ticks([0.5, 1.5, 6.5, 10., 20., 30., 40., 50., 55., 60.])
    print( 'minA :', min (As) , 'minH:', min(Hs) )
    plt.xlim(0., 1000.)
    plt.ylim(0., 1050.)
    #plt.clim(0.5, 60.)
    plt.xlabel(r'$M_{A} [GeV]$', fontsize=12)
    plt.ylabel(r'$M_{H} [GeV]$', fontsize=12)
    #labels = [str(i) for i in (gglistOftanbeta +bblistOftanbeta)]
    #ax.legend(handles, labels, title=r'$tan\beta$')
    plt.title(r"2HDM typeII, run2 ULegacy search map ")
    plt.legend(loc='best')
    plt.grid(zorder = 0, alpha = 0.3)
    plt.tight_layout()
    plt.savefig('ZAmap_process-{}.png'.format(p))
    plt.gcf().clear()
