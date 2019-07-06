Version : 0.0.1   
Date :(05 JUL 2019)   
Mantainer:Felipe M Ferreira [@fdemacedof](https://github.com/fdemacedof)   
	  Felipe Argolo [@argolof](https://github.com/fargolo)  
Utilities for exploratory insights based on data visualization and statistical modeling.  
Beagle.jl currently exports two functions:  
	*  TransformGoF: Returns *Dataframe* containing goodness-of-fit (AIC, $R^{2}$) for GLMs using several transformation functions on the input vector, along with parameters obtained with **GLM.jl**.    
	*  PlotFit: Plots scatterplot along with regression curve for a given transform, using coeficients provided by *TransformGoF*.    
	*  ExportWidget: Exports **Interact.jl** Widget object, consisting of plots created by *PlotFit* for all the transforms required by the user.  
