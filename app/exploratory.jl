using CSV
using Plots
using Distributions
using GLM, StatsBase

include("example/generate_examples.jl")
df = CSV.read("example/df_example.csv")

xlims!(-5,5)
scatter(df[:x,],df[:y_linear],lab="linear")
scatter!(df[:x,],df[:y_quadratic],lab="quadratic")
scatter!(df[:x,],df[:y_cubic],lab="cubic")
scatter!(df[:x,],df[:y_exp],lab="exp")
scatter!(df[:x,],df[:y_log],lab="log")
scatter!(df[:x,],df[:y_sqrt],lab="sqrt")
ylims!(-5,15)

# TransformAIC
# Given x and y, Calculate:
# StatsBase::aic
# StatsBase::r2(obj,variant=:Nagelkerke)
# using every transform function

transforms =  ["linear","quadratic","cubic","exp","log","'sqrt"]

function TransformAIC(x,y,transforms)

    df = DataFrame(x = x, y = y)
    trans = DataFrame(transforms = transforms,
                         AIC = repeat(NaN,length(transforms)),
                         r2 = repeat(NaN,length(transforms)))
    for t in transforms
        if t == "linear"
            model = lm(@formula(y ~ x),df)
            trans.AIC[:linear] = aic(model)
            trans.r2[:linear] = r2(model)
        end
        if t == "quadratic"
            model = lm(@formula(y ~ x),df)
            trans.AIC[:linear] = aic(model)
            trans.r2[:linear] = r2(model)
        end
        if t == "linear"
            trans.AIC[:linear] = aic(lm(@formula(y_linear ~ exp(x)),df)))
        end
        if t == "linear"
            trans.AIC[:linear] = aic(lm(@formula(y_linear ~ exp(x)),df)))
        end
        if t == "linear"
            trans.AIC[:linear] = aic(lm(@formula(y_linear ~ exp(x)),df)))
        end
        if t == "linear"
            trans.AIC[:linear] = aic(lm(@formula(y_linear ~ exp(x)),df)))
        end
    end

end
