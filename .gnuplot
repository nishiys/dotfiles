set term qt
set grid

# ------ default line & point style setting -----------
set linetype 1 lc rgb "light-red" lw 1 pt 7
set linetype 2 lc rgb "#e69f00" lw 1 pt 9
set linetype 3 lc rgb "dark-yellow" lw 1 pt 5
set linetype 4 lc rgb "#009e73" lw 1 pt 2
set linetype 5 lc rgb "#0072b2" lw 1 pt 6
set linetype 6 lc rgb "navy" lw 1 pt 8
set linetype 7 lc rgb "purple" lw 1 pt 4
set linetype 8 lc rgb "black" lw 1 pt 12
set linetype cycle 8
# -----------------------------------------------------

# ------- default font setting -----------------------
set tics font "Helvetica, 13"
set xlabel font "Times, 17"
set ylabel font "Times, 17"
set y2label font "Times, 17"
set title font "Palatino, 18"
set key font "Arial, 14"
# ----------------------------------------------------

# ------- default margin setting ---------------------
set xtics offset 0,-0.2
set ytics offset -0.2,0
set xlabel offset 0,-1
set ylabel offset -2,0

set lmargin 14
set tmargin 5
set rmargin 14
set bmargin 6
# ----------------------------------------------------
