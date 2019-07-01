using CSV
using Plots
using Distributions
using GLM, StatsBase, StatsPlots

include("example/generate_examples.jl")
df = CSV.read("example/df_example.csv", copycols = true)

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

function TransformAIC(x,y,
                      transforms = ["linear","quadratic","cubic","exp"#=,"log","sqrt"]=#])

    df = DataFrame(x = x, y = y)
    trans = DataFrame(transforms = transforms,
                         AIC = .0,
                         r2 = .0)
    models = []

    for t in transforms

        if t == "linear"
            model = lm(@formula(y ~ x),df)
            trans[trans.transforms .== t,:AIC] = aic(model)
            trans[trans.transforms .== t,:r2] = r2(model)
        end
        if t == "quadratic"
            model = lm(@formula(y ~ x^2),df)
            trans[trans.transforms .== t,:AIC] = aic(model)
            trans[trans.transforms .== t,:r2] = r2(model)
        end
        if t == "cubic"
            model = lm(@formula(y ~ x^3),df)
            trans[trans.transforms .== t,:AIC] = aic(model)
            trans[trans.transforms .== t,:r2] = r2(model)
        end
        if t == "exp"
            model = lm(@formula(y ~ exp(x)),df)
            trans[trans.transforms .== t,:AIC] = aic(model)
            trans[trans.transforms .== t,:r2] = r2(model)
        end
        #=if t == "log" && minimum(df.x) >= 0
            model = lm(@formula(y ~ log(x)),df)
            trans[trans.transforms .== t,:AIC] = aic(model)
            trans[trans.transforms .== t,:r2] = r2(model)
        end
        if t == "sqrt" && minimum(df.x) >= 0
            model = lm(@formula(y ~ sqrt(x)),df)
            trans[trans.transforms .== t,:AIC] = aic(model)
            trans[trans.transforms .== t,:r2] = r2(model)
        end=#
        push!(models,model)

    end

    return trans, models

end
