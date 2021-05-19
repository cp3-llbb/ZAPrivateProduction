#!/usr/bin/env python
# -*- coding: utf-8 -*
# author: Pieter David 
import numpy as np

def loadMassesWidths(fileName):
    in_dtypes = [
            ("DatasetName", "U57"),
            ("Sushi_xsc@NLO[pb]", float),
            ("Sushi_xsc_err[pb]", float),
            ("BR(H -> ZA )", float),
            ("BR(A  -> bb)", float),
            ("Ymb,H[GeV]", float),
            ("Ymb,A[GeV]", float),
            ("Partialwidth(H ->bb)[GeV]", float),
            ("Partial_width(A ->bb)[GeV]", float),
            ("Totalwidth,H[GeV]", float),
            ("Totalwidth,H[GeV]", float),
            ("WHMHPercent", float),
            ("WAMAPercent", float)
            ]
    with open(fileName) as inF:
        arr = np.genfromtxt(inF, skip_header=1, dtype=in_dtypes)
    pars = np.array([ [ float(tk.replace("p", ".")) for tk in dsNm.split("_")[1:4] ] for dsNm in arr["DatasetName"] ])
    return np.hstack((pars[:,:2], ## mH,mA
        arr["WHMHPercent"][:,None]/100.,
        arr["WAMAPercent"][:,None]/100.
        ))

if __name__ == "__main__":
    
    from matplotlib import pyplot as plt
    arr_bbH = loadMassesWidths("data/list_all_bbH_HToZA_datasetnames.txt")
    arr_ggH = loadMassesWidths("data/list_all_ggH_HToZA_datasetnames.txt")

    arr1_bbH = loadMassesWidths("data/list_all_bbH_AToZH_datasetnames.txt")
    arr1_ggH = loadMassesWidths("data/list_all_ggH_AToZH_datasetnames.txt")
    for tanb, (arrH, arrA) in [("20 (bbH)", (arr_bbH, arr_bbA)), ("1.5 (ggH)", (arr_ggH, arr_ggA))]:
        for (iCH, iCA), lbl in [((2, 3), "Heaviest w/m"), ((3, 2), "Lightest w/m")]:
            title = r"{} for tan$\beta$ = {}".format(lbl, tanb)
            fig,ax = plt.subplots(1,1, num=title)
            ax.set_title(title)
            ax.set_xlabel("mA [GeV]")
            ax.set_ylabel("mH [GeV]")
            ax.set_xlim(0., 1025.)
            ax.set_ylim(0., 1025.)
            mxVal = (.35 if iCH == 2 else .025)
            cntr1 = ax.tricontourf(arrH[:,1], arrH[:,0], arrH[:,iCH], cmap="Purples", levels=35, vmin=0., vmax=mxVal)
            ax.tricontourf(arrA[:,0], arrA[:,1], arrA[:,iCA], cmap="Purples", levels=35, vmin=0., vmax=mxVal)
            fig.colorbar(cntr1, ax=ax)
            if iCH == 2:
                cntr2 = ax.tricontour(arrH[:,1], arrH[:,0], arrH[:,iCH], levels=[.10, .20, .30], colors=["k", "k", "k"])
                ax.clabel(cntr2, cntr2.levels, inline=True, fmt="{0:.0%}".format, fontsize=10)
                cntr2 = ax.tricontour(arrA[:,0], arrA[:,1], arrA[:,iCA], levels=[.10, .20, .30], colors=["k", "k", "k"])
                ax.clabel(cntr2, cntr2.levels, inline=True, fmt="{0:.0%}".format, fontsize=10)
            ax.plot(arrH[:,1], arrH[:,0], "ko", ms=1)
            ax.plot(arrA[:,0], arrA[:,1], "ko", ms=1)
            plt.savefig("{}_{}_tanb{}.png".format(lbl.replace('/', ''), 'fullmassplane', tanb.split()[0].replace('.', 'p')))
            plt.gcf().clear() 
    plt.show()
