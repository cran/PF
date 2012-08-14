
.summarytable.rror.tex <- function(x, file = '', append = F,...){
	cat('%\\usepackage{float, hyperref}\n', file = file, append = append)
	if(x@norm){
		conf <- paste(100 * (1 - x@alpha), "\\% gaussian intervals", sep = "")
	} else {
		conf <- paste(100 * (1 - x@alpha), "\\% t intervals on ", x@degf, " df", sep = "")
	}
	cat('\\section{', conf, '}\n', append = append, file = file)
	
	print(xtable(as.data.frame(x@estimate), digits = x@rnd), sanitize.colnames.function =
		function(x){'estimate'}, table.placement ='H', file = file, append = T)
	print(xtable(x@mu, digits = x@rnd), table.placement = 'H', file = file, append = T)
	
}


.summarytable.rror.texdoc <- function(x, file = '',...){
	cat('\\documentclass[12pt]{article}\n \\usepackage{float, hyperref}\n \\begin{document}\n', file = file)
	.summarytable.rror.tex(x = x, file = file, append = T)
	cat('\\end{document}\n', file = file, append = T)
}


.summarytable.rror.html <- function(x, file = '',...){
	if(x@norm){
		conf <- paste(100 * (1 - x@alpha), "% gaussian intervals", sep = "")
	} else {
		conf <- paste(100 * (1 - x@alpha), "% t intervals on ", x@degf, " df", sep = "")
	}
	cat('<html>\n<head>\n<link rel="stylesheet" type="text/css" href="W:\\Biometrics\\Section\\Software\\style.css">\n</head>\n<body>\n', file = file)
	cat(paste('<h3>', conf, '</h3>\n', sep = ''), file = file, append = T)
	print(xtable(as.data.frame(x@estimate), digits = x@rnd), file = file,  type = 'html', 
		sanitize.colnames.function = function(x){paste('<div align = "center">','estimate', '</div>')}, 
		html.table.attributes = 'border = 1', append = T)
	print(xtable(x@mu), file = file, type = 'html', 
		sanitize.colnames.function = function(x){paste('<div align = "center">', x, '</div>')}, 
		html.table.attributes = 'border = 1',append = T)
	cat(paste('</body>\n</html>\n', sep =''), file = file, append = T)
}



.summarytable.rror.doc <- function(x, file = '', autoformat = 1,...){
	if(!'R2wd' %in% installed.packages()){	
		stop('package R2wd required for doc output')
	} else {
	wdGet()
		if(x@norm){
			conf <- paste(100 * (1 - x@alpha), "% gaussian intervals", sep = "")
		} else {
			conf <- paste(100 * (1 - x@alpha), "% t intervals on ", x@degf, " df", sep = "")
		}
		wdSection(conf)
		temp <- format(round(as.data.frame(x@estimate), digits = x@rnd), nsmall = x@rnd)
		colnames(temp) <- 'estimate'
		wdTable(temp, autoformat = autoformat)
			
		wdTable(round(x@mu, x@rnd), autoformat = autoformat)
			
		if(file !=''){
			wdSave(file)
		}
		wdQuit()
	}
}

.summarytable.rror <- function(x, out = 'dev', file = '',...){
	args <- list(...)
	if(is.null(args$autoformat)){
		autoformat <- 1
	} else {
		autoformat <- args$autoformat
	}
	switch(	out,
			dev = print(x),
			tex = .summarytable.rror.tex(x = x, file = file),
			texdoc = .summarytable.rror.texdoc(x = x, file = file),
			html = .summarytable.rror.html(x = x, file = file),
			doc = .summarytable.rror.doc(x = x, file = file, autoformat = autoformat))
}


.getTable.rror <- function(x, type = 'summary', out = 'dev', file = '',...){
	.summarytable.rror(x = x, type = type, out = out, file = file,...)
}