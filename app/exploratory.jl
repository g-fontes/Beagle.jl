using CSV
using Plots
using Distributions
using GLM, StatsBase, StatsPlots

include("example/generate_examples.jl")
df = CSV.read("app/example/df_example.csv", copycols = true)

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
    df.x2 = df.x.^2
    df.x3 = df.x.^3
    df.exp = exp.(df.x)
    trans = DataFrame(transforms = transforms,
                         AIC = .0,
                         r2 = .0)
    coefs = []

    for t in transforms

        if t == "linear"
            model = lm(@formula(y ~ x),df)
            trans[trans.transforms .== t,:AIC] = aic(model)
            trans[trans.transforms .== t,:r2] = r2(model)
        end
        if t == "quadratic"
            model = lm(@formula(y ~ x + x2),df)
            trans[trans.transforms .== t,:AIC] = aic(model)
            trans[trans.transforms .== t,:r2] = r2(model)
        end
        if t == "cubic"
            model = lm(@formula(y ~ x + x2 + x3),df)
            trans[trans.transforms .== t,:AIC] = aic(model)
            trans[trans.transforms .== t,:r2] = r2(model)
        end
        if t == "exp"
            model = lm(@formula(y ~ exp),df)
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
        push!(coefs,coef(model))

    end

    trans.coef = coefs

    return trans

end

function PlotBestAIC(x,y,trans)

    best_aic = trans.transforms[trans.AIC .== minimum(trans.AIC)]
    domain = collect(minimum(x):.01:maximum(x))

    if best_aic[1] == "linear"
        coefs = trans.coef[trans.transforms .== best_aic]
        p = plot(
            layer(x = x,y = y,Geom.point),
            layer(x = domain,y = coefs[1][1] .+ coefs[1][2].*domain,Geom.line),
        )
    end

    if best_aic[1] == "quadratic"
        coefs = trans.coef[trans.transforms .== best_aic]
        p = plot(
            layer(x = x,y = y,Geom.point),
            layer(x = domain,y = coefs[1][2] .+
                                 coefs[1][2].*domain .+
                                 coefs[1][3].*(domain.^2),
                  Geom.line)
        )
    end

    if best_aic[1] == "cubic"
        coefs = trans.coef[trans.transforms .== best_aic]
        p = plot(
            layer(x = x,y = y,Geom.point),
            layer(x = domain,y = coefs[1][2] .+
                                 coefs[1][2].*domain .+
                                 coefs[1][3].*(domain.^2) .+
                                 coefs[1][4].*(domain.^3),
                  Geom.line)
        )        
    end

    if best_aic[1] == "exp"
        coefs = trans.coef[trans.transforms .== best_aic]
        p = plot(
            layer(x = x,y = y,Geom.point),
            layer(x = domain,y = coefs[1][2] .+
                                 coefs[1][2].*exp.(domain),
                  Geom.line)
        )
    end
end
