using Interact, Blink
using Gadfly, Distributions

ui_dist = @manipulate for α in 1:100, β = 1:100
    plot(x -> pdf(Beta(α, β), x), 0, 1)
end
@layout! ui_dist dom"div"(observe(_),:α,:β)

loadbutton = filepicker()
hellobutton = button("Hello!")
goodbyebutton = button("Good bye!")
s = slider(1:100)
e_label = latex("\\sum_{i=1}^{\\infty} e^i")

ui_up = hbox(e_label,
            vbox(loadbutton,hbox(hellobutton,goodbyebutton,s),
                ui_dist))

main_w = Window()
body!(main_w, ui_up);
