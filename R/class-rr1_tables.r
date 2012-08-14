
.summarytable.rr1.tex <- function(x, file = '', append = F,...){
	conf <- paste(x@estimator, " ", round(100*(1-x@alpha),x@rnd),'\\% interval estimates',sep='')
	cat('%\\usepackage{float, hyperref}\n', file = file, append = T)
	print(xtable(as.data.frame(x@estimate), caption = conf), table.placement ='H', file = file, 
		sanitize.colnames.function = function(x){paste('estimate', sep ='')}, append = T)
}


.summarytable.rr1.texdoc <- function(x, file = '',...){
	cat('\\documentclass[12pt]{article}\n \\usepackage{float, hyperref}\n \\begin{document}\n', file = file)
	.summarytable.rr1.tex(x = x, file = file, append = T)
	cat('\\end{document}\n', file = file, append = T)
}



.summarytable.rr1.html <- function(x, file = '',...){
	conf <- paste(x@estimator, " ", round(100*(1-x@alpha),x@rnd),'% interval estimates',sep='')
	cat('<html>\n<head>\n<link rel="stylesheet" type="text/css" href="W:\\Biometrics\\Section\\Software\\style.css">\n</head>\n<body>\n', file = file)
	print(xtable(as.data.frame(x@estimate), caption = conf), file = file, type = 'html', 
		sanitize.colnames.function = function(x){return('<div align = "center">estimate</div>')}, html.table.attributes = 'width = 300, 
		border = 1',
		append = T)
	cat(paste('</body>\n</html>\n', sep =''), file = file, append = T)
}



.summarytable.rr1.doc <- function(x, file = '', autoformat = 1,...){
	if(!'R2wd' %in% installed.packages()){	
		stop('package R2wd required for doc output')
	} else {
		conf <- paste(x@estimator, " ", round(100*(1-x@alpha),x@rnd),'% interval estimates',sep='')
		df1 <- round(as.data.frame(x@estimate), x@rnd)
		names(df1) <- 'estimate'
		wdGet()
		wdTable(df1, caption = conf, autoformat = autoformat)
		if(file !=''){
			wdSave(file)
		}
		wdQuit()
	}
}


.summarytable.rr1 <- function(x, out = 'dev', file = '',...){
	args <- list(...)
	if(is.null(args$autoformat)){
		autoformat <- 1
	} else {
		autoformat <- args$autoformat
	}
	switch(	out,
			dev = print(x),
			tex = .summarytable.rr1.tex(x = x, file = file),
			texdoc = .summarytable.rr1.texdoc(x = x, file = file),
			html = .summarytable.rr1.html(x = x, file = file),
			doc = .summarytable.rr1.doc(x = x, file = file, autoformat = autoformat))
}



.getTable.rr1 <- function(x, type = 'summary', out = 'dev', file = '',...){
	.summarytable.rr1(x = x, type = type, out = out, file = file,...)
}