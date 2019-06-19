# Abu  
![By http://lauracros.com/](abu-laura-cross.jpg)

---  

Version  : 0.0.1  
Mantainer: Felipe Argolo [@argolof](https://github.com/fargolo)  

This software is alpha version. Use at your risk.  

Ab (أَب), from a theoretical, abstract form (آبَاءٌ ʼabawun) (triliteral ʼ-b-w) is Arabic for "father".  

In the construct state, Abū (أبو) is followed by another word to form a complete name, e.g.: Abu Mazen, another name for Mahmoud Abbas.  

Abu may be used as a kunya, an honorific. To refer to a man by his fatherhood (of male offspring) is polite, so that ʼabū takes the function of an honorific. [1](https://en.wikipedia.org/wiki/Ab_(Semitic))  

---  

## A sketchbook for quantitative analysis  

Software has become a valuable tool for visualization and mathematical modelling.  
Responsive interfaces help one to explore ideas, concepts and measurements in real time. They are widely used for several applications, from basic descriptive summaries to specialized model diagnostics.   

**Abu** aims to be:  
* Intuitive. It should frame together *data, abstractions and representations* to aid **thinking**. Hence, features are convention driven, considering goals philosophically guided (e.g. hypothesis testing, causal modelling, diagnostics).   
* Fast. Computations should not slow the investigation process. **Abu** uses **Julia** under the hood. It allows for concise, painless coding while providing "C/C++ like" performance.  
* Plug and play. Cognitive overhead and software configuration should not consume one's time. A web-based interface is easy to set up and to access from anywhere. Install it on the cloud, use it in your mobile.  

The sketchbook is intended to run "What you see is what you get" responsive panels for real-time manipulation. The intended experience is inspired by software like [Luna Lang](https://docs.luna-lang.org/), [Tableau](https://www.tableau.com/), [Shiny](https://shiny.rstudio.com/) and Jupyter.  

## Roadmap

* (X) Dockerize a Genie sample app.  
* ( ) Bayesian analysis.  
	* ( ) Diagnostics (**shinystan**). 
	* ( ) Data upload. 
	* ( ) Use Julia code from user input.  
	* ( ) ?
* ( ) Hypothesis testing.
* ( ) Causal modelling
* ( ) Exploratory (flexible) descriptive statistics and visualizations. 

## Instructions  
### Docker  
1. Install docker.  
2. Clone repo and enter the directory.  
3. Build the docker image: `docker image build -t myname:mytag .`.  
4. Run `docker run -it -p 8080:8000 myname:mytag`.  
5. Access 127.0.0.1:8080 using your browser.  

