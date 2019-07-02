using Interact, Blink
using Gadfly, Distributions
using Match

ui_dist = @manipulate for α in 1:100, β = 1:100
    plot(x -> pdf(Beta(α, β), x), 0, 1)
end
@layout! ui_dist dom"div"(observe(_),:α,:β)

menu_bts = vbox(HTML("""<button class="button" onclick='Blink.msg("press", "Explore")'>go</button>"""),
		HTML("""<button class="button" onclick='Blink.msg("press", "Descriptive")'>go</button>"""),
                HTML("""<button class="button" onclick='Blink.msg("press", "Data")'>go</button>"""
                HTML("""<button class="button" onclick='Blink.msg("press", "Diagnostics")'>go</button>"""


main_w = Window()
body!(main_w, hbox(menu_bts,ui_dist));
handle(main_w, "press") do args
  @match args begin
	 "Explore"     => body!(main_w,hbox(menu_bts,ui_dist), async=false)  
         "Descriptive" => body!(main_w,hbox(menu_bts,args), async=false) 
         "Data"        => body!(main_w,hbox(menu_bts,args), async=false) 
         "Diagnostics" => body!(main_w,hbox(menu_bts,args), async=false)  
  end
end
load!(main_w,"../style/panel_buttons.css")
