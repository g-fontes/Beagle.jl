using DataFrames, Match
using Plots, Gadfly

function pl_ypreds(domain, coefs,transform)
    @match transform begin
        "linear"    => coefs[1][1] .+ coefs[1][2].*domain
        "quadratic" => coefs[1][2] .+ coefs[1][2].*domain .+
                        coefs[1][3].*(domain.^2)
        "cubic"     => coefs[1][2] .+ coefs[1][2].*domain .+
                        coefs[1][3].*(domain.^2) .+ coefs[1][4].*(domain.^3)
        "exp"       => coefs[1][2] .+ coefs[1][2].*exp.(domain)
    end
end

function PlotBestFit(x_in::Array{Float64,1},
    y_in::Array{Float64,1},trans::DataFrame)

    best_aic = trans.transforms[trans.AIC .== minimum(trans.AIC)]
    domain = collect(minimum(x_in):.01:maximum(x_in))
    coefs = trans.coef[trans.transforms .== best_aic]

    y_pl = pl_ypreds(domain,coefs,trans)

    p = Gadfly.plot(
        layer(x = x_in,y = y_in,Geom.point),
        layer(x = domain,y = y_pl,Geom.line))
    return p
end

