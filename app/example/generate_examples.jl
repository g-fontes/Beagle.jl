using Distributions, DataFrames, CSV

x_o = collect(-5:.1:5)
x_positive = collect(0:.05:5)
y_1 = 2*x_o .+ .5
y_2 = x_o.^2 .+ .3*x_o .+ .5
y_3 = .5*x_o.^3 .+ 2*x_o.^2 .- .5*x_o
y_exp = exp.(x_o)
y_log = log.(x_positive)
y_sqrt = sqrt.(x_positive)

df = DataFrame(x = x_o, x_positive = x_positive, y_linear = y_1, y_quadratic = y_2,
               y_cubic = y_3, y_exp = y_exp,
               y_log = y_log, y_sqrt = y_sqrt)

CSV.write("example/df_example.csv",df)
