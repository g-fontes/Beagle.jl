using CSV
using Plots
using Distributions

df = CSV.read("example/df_example.csv")

scatter(df[1,],df[2,])
scatter!(df[1,],df[3,])
scatter!(df[1,],df[4,])
