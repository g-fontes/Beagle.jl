using DataFrames, CSV, Match
using GLM
using StatsBase: aic , r2


# To
## StatsBase::aicc
## StatsBase::r2(obj,variant=:Nagelkerke)
## Include negative every transform function

function elem_fits(transform::String, df::DataFrame)
    @match transform begin
        "linear"    => lm(@formula(y ~ x),df)
        "quadratic" => lm(@formula(y ~ x + x2),df)
        "cubic"     => lm(@formula(y ~ x + x2 + x3),df)
        "exp"       => lm(@formula(y ~ exp),df)
    #   "log" && minimum(df.x) >= 0 => push!(model,lm(@formula(y ~ log(x)),df))
    #   "sqrt" && minimum(df.x) >= 0=> push!(model,lm(@formula(y ~ sqrt(x)),df))
    end
end

function TransformGoF(x_in::Union{Array{Float64,1},CSV.Column{Float64,Float64}},
                      y_in::Union{Array{Float64,1},CSV.Column{Float64,Float64}},
                      transforms = ["linear","quadratic","cubic","exp"#=,"log","sqrt"]=#])

    df = DataFrame(x = x_in, y = y_in)
    df.x2 = df.x.^2
    df.x3 = df.x.^3
    df.exp = exp.(df.x)
    trans = DataFrame(transforms = transforms,
                         AIC = .0,
                         r2 = .0)
    coefs = []

    for t in transforms
        model = elem_fits(t,df)
        trans[trans.transforms .== t,:AIC] = aic(model)
        trans[trans.transforms .== t,:r2] = r2(model)
        push!(coefs,coef(model))
    end

    trans.coef = coefs
    return trans

end
