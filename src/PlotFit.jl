using DataFrames, CSV, Match
using Plots, Gadfly

function pl_ypreds(domain, coefs,transform)
    @match transform begin
        "linear"    => coefs[1] .+ coefs[2].*domain
        "quadratic" => coefs[2] .+ coefs[2].*domain .+
                        coefs[3].*(domain.^2)
        "cubic"     => coefs[2] .+ coefs[2].*domain .+
                        coefs[3].*(domain.^2) .+ coefs[4].*(domain.^3)
        "exp"       => coefs[2] .+ coefs[2].*exp.(domain)
    end
end

function PlotFit(x_in::Union{Array{Float64,1},CSV.Column{Float64,Float64}},
                 y_in::Union{Array{Float64,1},CSV.Column{Float64,Float64}},
                 trans::DataFrameRow{DataFrame,DataFrames.Index})

    domain = collect(minimum(x_in):.01:maximum(x_in))
    coefs = trans.coef

    y_pl = pl_ypreds(domain,coefs,trans.transforms)

    p = Gadfly.plot(
        layer(x = x_in,y = y_in,Geom.point),
        layer(x = domain,y = y_pl,Geom.line))

    return p

end
