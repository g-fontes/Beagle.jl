using Interact, Mux

loadbutton = filepicker()
hellobutton = button("Hello!")
goodbyebutton = button("Good bye!")
ui = vbox(loadbutton,hbox(hellobutton, goodbyebutton))

@app abu = (
    Mux.defaults,
    page("/",req -> ui),
    Mux.notfound())

Mux.serve(abu)
