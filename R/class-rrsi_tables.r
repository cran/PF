
.summarytable.rrsi.tex <- function(x, file = '', append = F,...){
	conf <- paste(round(100*(1-x@alpha),x@rnd),'\\% ',sep='')
	support <- paste('1/',round(x@k,x@rnd),' likelihood support interval for ',x@estimator,
		'.', sep = '')
	foot <- paste('\\footnotetext[\\value{footnote}]{corresponds to ',conf,'confidence\n  (under certain assumptions)}\n', sep = '')
	cat('\\addtocounter{footnote}{1}\n', file = file, append = append)
	cat('%\\usepackage{float, hyperref}\n', file = file, append = T)
	print(xtable(as.data.frame(x@estimate), caption = support), table.placement ='H', file = file, 
		sanitize.colnames.function = function(x){paste('estimate\\footnotemark[\\value{footnote}]', sep ='')}, append = T)
	cat(foot, file = file, append = T)
}


.summarytable.rrsi.texdoc <- function(x, file = '',...){
	cat('\\documentclass[12pt]{article}\n \\usepackage{float, hyperref}\n \\begin{document}\n', file = file)
	.summarytable.rrsi.tex(x = x, file = file, append = T)
	cat('\\end{document}\n', file = file, append = T)
}


.summarytable.rrsi.html <- function(x, file = '',...){
	support <- paste('1/',round(x@k,x@rnd),' likelihood support interval for ',x@estimator,
		'. <sup>1</sup>', sep = '')
	conf <- paste(round(100*(1-x@alpha),x@rnd),'% ',sep='')
	cat('<html>\n<head>\n<link rel="stylesheet" type="text/css" href="W:\\Biometrics\\Section\\Software\\style.css">\n</head>\n<body>\n', file = file)
	print(xtable(as.data.frame(x@estimate), caption = support), file = file, type = 'html', 
		sanitize.colnames.function = function(x){return('<div align = "center">estimate</div>')}, html.table.attributes = 'width = 300, 
		border = 1',
		append = T)
	cat(paste('<hr>1. Corresponds to ',conf,'confidence\n  (under certain assumptions)\n</body>\n</html>\n', sep =''), file = file, append = T)
}

.summarytable.rrsi.doc <- function(x, file = '', autoformat = 1,...){
	if(!'R2wd' %in% installed.packages()){	
		stop('package R2wd required for doc output')
	} else {
		support <- paste('1/',round(x@k,x@rnd),' likelihood support interval for ',x@estimator,
			'.', sep = '')
		conf <- paste(round(100*(1-x@alpha),x@rnd),'% ',sep='')
		df1 <- round(as.data.frame(x@estimate), x@rnd)
		names(df1) <- 'estimate'
		wdGet()
		wdSection(support)
		wdTable(df1, caption = paste('Corresponds to ',conf,'confidence\n  (under certain assumptions)', sep = ''), 
			autoformat = autoformat)
		if(file !=''){
			wdSave(file)
		}
		wdQuit()
	}
}


.summarytable.rrsi <- function(x, out = 'dev', file = '',...){
	args <- list(...)
	if(is.null(args$autoformat)){
		autoformat <- 1
	} else {
		autoformat <- args$autoformat
	}
	switch(	out,
			dev = print(x),
			tex = .summarytable.rrsi.tex(x = x, file = file),
			texdoc = .summarytable.rrsi.texdoc(x = x, file = file),
			html = .summarytable.rrsi.html(x = x, file = file),
			doc = .summarytable.rrsi.doc(x = x, file = file, autoformat = autoformat))
}


.getTable.rrsi <- function(x, type = 'summary', out = 'dev', file = '',...){
	.summarytable.rrsi(x = x, type = type, out = out, file = file,...)
}
