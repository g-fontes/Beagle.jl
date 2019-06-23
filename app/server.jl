using Interact, Mux
using Gadfly, Distributions
#include("bernoulli.jl")


ui_dist = @manipulate for α in 1:100, β = 1:100
    plot(x -> pdf(Beta(α, β), x), 0, 1)
end
@layout! ui_dist dom"div"(observe(_),:α,:β)

loadbutton = filepicker()
hellobutton = button("Hello!")
goodbyebutton = button("Good bye!")

ui_up = vbox(loadbutton,hbox(hellobutton,goodbyebutton))

@app abu = (
    Mux.defaults,
    page("/", req -> ui_dist),
    page("/upload", req -> ui_up),
    Mux.notfound())

Mux.serve(abu)
