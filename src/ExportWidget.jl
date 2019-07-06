using Interact, Blink
using Gadfly, Distributions
using Match

function ExportWidget(x_in::Union{Array{Float64,1},CSV.Column{Float64,Float64}},
                      y_in::Union{Array{Float64,1},CSV.Column{Float64,Float64}},
                      transforms = ["linear","quadratic","cubic",
                                    "exp"#=,"log","sqrt"]=#])

    trans = sort(TransformGoF(x_in,y_in,transforms),order(:AIC))

    plots = []

    for i in 1:size(trans,1)
        push!(plots,PlotFit(x_in,y_in,trans[i,:]))
    end

    ui = vbox(hbox(plots[1]),
              hbox(plots[2:size(plots,1)]))

    return ui

end
