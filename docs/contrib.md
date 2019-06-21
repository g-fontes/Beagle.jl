## Contributors guide
Feel free to suggest sketchboard ideas to analyze data. I also appreciate help with tips on software architecture.  

### Roadmap  

* (X) Scaffolding
        * (X) Docker image
        * (X) Genie.jl (*halted branch*)
        * (X) Interact.jl + Mux.jl.
	* ( ) CmdStan.jl
* ( ) 1 - Bayesian analysis.
        * ( ) Diagnostics (**shinystan**).
        * ( ) Data upload.
        * ( ) Use Julia code from user input.
        * ( ) ?
* ( ) 2 - Hypothesis testing.
* ( ) 3 - Causal modelling.
* ( ) 4 - Exploratory Dashboard for visualizations and descriptive statisticsi.

## Instructions  
### Using Docker  
1. Install docker.
2. Clone repo and enter the directory.
3. Build the docker image: `docker image build -t myname:mytag .`.
4. Run `docker run -it -p 8080:8000 myname:mytag`.
5. Access `127.0.0.1:8080` using your browser.
 
### From julia REPL
1. Install Julia (1.0.4) 
2. Install Mux (0.7.0) and Interact(0.10.2) using **Pkg**: `julia>Pkg.add("Mux")`  
3. Run server from REPL using `julia>include("server.jl")`  
4. Access `127.0.0.1:8080` using your browser                                             
