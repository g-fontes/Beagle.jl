module Hello3

using Genie, Genie.Router, Genie.Renderer, Genie.AppServer

function main()
  Base.eval(Main, :(const UserApp = Hello3))

  include("../genie.jl")

  Base.eval(Main, :(const Genie = Hello3.Genie))
  Base.eval(Main, :(using Genie))
end

main()

end
