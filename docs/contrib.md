## Contributors guide
Feel free to suggest sketchboard ideas to analyze data. I also appreciate help with tips on software architecture.  

### Roadmap  

* (X) Scaffolding
        * (X) Docker image
        * (X) Genie.jl (*halted branch*)
        * (X) Interact.jl + Mux.jl.
        * (X) Gadfly.jl + Distributions.jl
	* (X) CmdStan.jl
* ( ) Bayesian analysis.
	* ( ) Model visualization (Prior, Data, Posterior)
        * ( ) Diagnostics 
        * ( ) Data upload.

### For bug hunters
* ( ) Separate docker volume with cmdstan (1.1 GB)
* ( ) Currently, the Gadfly+Distributions widget (on `server.jl`) is responsive on Juno but not on Mux(browser). 

## Instructions  
### Using Docker  
1. Install docker.
2. Clone repo and enter the directory.
3. Clone cmdstan repo and copy it into the directory.
4. Build the docker image: `docker image build -t myname:mytag .`.  
5. Run `docker run -it -p 8080:8000 myname:mytag`.  
6. Access `127.0.0.1:8080` using your browser.  
 
### From julia REPL
1. Install Julia (1.0.4).  
2. Install Mux (0.7.0); Interact(0.10.2), CmdStan(5.0.5), Gadfly(1.0.1), Distributions (0.20.0), using **Pkg**: `julia>Pkg.add("Mux")`. Notice that each package may require external depencies not managed by Julia `Pkg`.  
3. Run server from REPL using `julia>include("server.jl")`  
4. Access `127.0.0.1:8080` using your browser                                             
5. Check `bernouli.jl` for a sample model.  
