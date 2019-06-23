# Abu  
![By http://lauracros.com/](abu-laura-cross.jpg)

---  

Version  : 0.0.3  
Mantainer: Felipe Argolo [@argolof](https://github.com/fargolo)  

This software is alpha version. Use at your own risk.  

Ab (أَب), from a theoretical, abstract form (آبَاءٌ ʼabawun) (triliteral ʼ-b-w) is Arabic for "father".  

In the construct state, Abū (أبو) is followed by another word to form a complete name, e.g.: Abu Mazen, another name for Mahmoud Abbas.  

Abu may be used as a kunya, an honorific. To refer to a man by his fatherhood (of male offspring) is polite, so that ʼabū takes the function of an honorific. [1](https://en.wikipedia.org/wiki/Ab_(Semitic))  

---  

## A grimoire for Bayesian Inference

Software has become a valuable tool for mathematical modelling.  
Responsive interfaces (e.g. dashboards) help one to explore ideas, concepts and measurements in real time. They are widely used for several applications, from basic descriptive summaries to specialized model diagnostics.  
Abu is intended to mirror the underlying structure of analysis procedures, aiding with data processing, automatic visualization and off the shelf mathematical tools.  
The first module targets *Baysian inference* using **Stan** (through CmdStan.jl as backend.  

**Abu** aims to be:  
* Intuitive. It should intertwine *data, abstractions and representations* to aid **thinking**. It is intended to run *"What you see is what you get"* responsive panels for real-time manipulation. Pipelines are based on analysis procedures. Check out [Luna Lang](https://docs.luna-lang.org/) for a more general purpose WYSIWYG software.  
* Plug and play. We aim for small installing & configuration times. The GUI is web based, like [Jupyter](https://jupyter.org/) and [Tableau](https://www.tableau.com/). [R Shiny](https://shiny.rstudio.com/).  
* Fast. **Abu** uses **Julia** under the hood. 
* Useful. I am a researcher building a tool *for myself and for the community*. For more on my views, take a look at [my book](https://github.com/fargolo/stat-learn-en).  

## Releases / Contributors guide

Check the specific documentation for [contributions](docs/contrib.md) and [releases](docs/releases.md). We welcome developers with any level of background expertise.  

I`m currently integrating Julia web apps, interactive widgets and CmdStan.jl, a framework for
Bayesian Inference. You can read an introduction with Julia [here (undergoing translation)](https://github.com/fargolo/stat-learn-en/blob/master/manuscript/chap5-bayes.md). Check the book *Statistical Rethinking: A Bayesian Course with Examples in R and Stan (Chapman & Hall/CRC Texts in Statistical Science)* for in depth content.  
This module will offer capabilties similar to [shinystan](https://mc-stan.org/users/interfaces/shinystan).   
