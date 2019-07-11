using DataFrames, CSV, Match
using Plots, Gadfly
using Blink, StatsBase
using Interact


#Density and histogram

p = Gadfly.plot(
    layer(df, x=:x,alpha=:x,Geom.histogram(density=true, maxbincount=20), Theme(default_color=Colors.RGBA(0,0,0, 0.4))),
    layer(df, x=:x, Geom.density),
    layer(df, x=:x, xintercept=[mean(df.x)],Geom.vline(color=["orange"])))
w= Window()
hbox(p)
body!(w, hbox(p))
