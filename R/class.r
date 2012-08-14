#' @title Data class pf
#' @name pf
#' @aliases pf
# @aliases pf-class
#' @rdname pf
#' @section Fields:
#' \itemize{
#' \item[\code{estimator}]{  either \code{"PF"} or \code{"IDR"}}
#' \item[\code{rnd}]{  how many digits to round display}
#' \item[\code{alpha}]{  complement of c.i.}
#' }
#' @seealso \code{\link{rr1-class}, \link{rrsi-class}, \link{rrsc-class}, \link{rrstr-class}}
#' @export
#' @author Marie Vendettuoli \email{marie.c.vendettuoli@@aphis.usda.gov}
pf <- setRefClass(  'pf', 
					fields = list(estimator = 'character', rnd = 'numeric',
	alpha = 'numeric'),
					methods = list(initialize = function(...){
						rnd <<- 3
						estimator <<- character(0)
						alpha <<- numeric(0)
						callSuper(...)}))

	
#' @title Data class rr1
#' @name rr1
#' @aliases rr1-class
#' @rdname rr1
#' @section Fields:
#' \itemize{
#' \item[\code{estimate}]{  vector with point and interval estimate}
#' \item[\code{estimator}]{  either \code{"PF"} or \code{"IDR"}}
#' \item[\code{y}]{  data vector}
#' \item[\code{rnd}]{  how many digits to round display}
#' \item[\code{alpha}]{  complement of c.i.}
#' }
#' @seealso \code{\link{IDRsc}, \link{RRotsst}, \link{RRtosst}}
#' @export
#' @author Marie Vendettuoli \email{marie.c.vendettuoli@@aphis.usda.gov}
rr1 <- setRefClass('rr1', contains = 'pf', fields = list(estimate = 'numeric',
	y = 'matrix'), methods = list(initialize = function(...){
		estimate <<- numeric(0)
		y <<- matrix(0)
		callSuper(...)}))

#' @title Data class rror
#' @name rror
#' @aliases rror-class
#' @rdname rrorclass
#' @section Fields:
#' \itemize{
#' \item[\code{estimate}]{  vector with point and interval estimate}
#' \item[\code{estimator}]{  either \code{"PF"} or \code{"IDR"}}
#' \item[\code{y}]{  data vector}
#' \item[\code{rnd}]{  how many digits to round display}
#' \item[\code{alpha}]{  complement of c.i.}
#' \item[\code{norm}]{  logical indicating Gaussian or t interval}
#' \item[\code{degf}]{  degrees of freedom}
#' \item[\code{mu}]{  matrix with rows giving probability estimates for each of the groups}
#' }
#' @seealso \code{\link{RRor}}
#' @export
#' @author Marie Vendettuoli \email{marie.c.vendettuoli@@aphis.usda.gov}
rror <- setRefClass('rror', contains = 'rr1', fields = list(norm = 'logical',
	degf = 'numeric', mu = 'matrix'), methods = list(initialize = function(...){
		norm <<- FALSE
		degf <<- 2
		mu <<- matrix(0, nrow = 2, ncol = 3, dimnames = list(c('txcon', 'txvac'), c('mu.hat', 'LL', 'UL')))
		callSuper(...)}))

#' @title Data class rrsi
#' @name rrsi
#' @aliases rrsi-class
#' @rdname rrsi
#' @section Fields:
#' \itemize{
#' \item[\code{y}]{  numeric data vector }
#' \item[\code{k}]{  likelihood ratio criterion}
#' \item[\code{rnd}]{  digits to round display}
#' \item[\code{alpha}]{  complement of c.i.}
#' \item[\code{estimate}]{  vector with point and interval estimate}
#' \item[\code{estimator}]{  either \code{"PF"} or \code{"IDR"}}
#' }
#' @seealso \code{\link{IDRlsi}, \link{RRlsi}}
#' @export
#' @author Marie Vendettuoli \email{marie.c.vendettuoli@@aphis.usda.gov}
rrsi <- setRefClass('rrsi', contains = 'pf', fields = list(y = 'numeric', k = 
	'numeric', estimate = 'numeric'), methods = list(initialize = function(...){
	y <<- numeric(0)
	k <<- numeric(0)
	estimate <<- numeric(0)
	callSuper(...)}))

#' @title Data class rrmp
#' @name rrmp
#' @aliases rrmp-class
#' @rdname rrmp
#' @section Fields:
#' \itemize{
#' \item[\code{estimate}]{  vector with point and interval estimate}
#' \item[\code{estimator}]{  either \code{"PF"} or \code{"IDR"}}
#' \item[\code{y}]{  data vector}
#' \item[\code{rnd}]{  how many digits to round display}
#' \item[\code{alpha}]{  complement of c.i.}
#' \item[\code{xtable}]{  2 x 2 data matrix} 
#' \item[\code{compare}]{  text vector, same as input}
#' \item[\code{frecvec}]{  data arrayed a vector of length 4}
#' \item[\code{multvec}]{  data.frame showing the multinomial representation of the data}
#' }
#' @seealso \code{\link{RRmpWald}}
#' @export
#' @author Marie Vendettuoli \email{marie.c.vendettuoli@@aphis.usda.gov}
rrmp <- setRefClass('rrmp', contains = 'rr1', fields = list(compare = 'character',
	xtable = 'matrix', freqvec = 'numeric', multvec = 'data.frame'), methods = list(
	initialize = function(...){
		compare <<- character(0)
		xtable <<- matrix(0, nrow = 2, ncol = 2)
		freqvec <<- numeric(0)
		multvec <<- data.frame(0)
		callSuper(...)}))

#' @title Data class rrsc
#' @name rrsc
#' @aliases rrsc-class
#' @rdname rrscclass
#' @section Fields:
#' \itemize{
#' \item[\code{estimate}]{  vector with point and interval estimate}
#' \item[\code{rnd}]{  how many digits to round display}
#' \item[\code{alpha}]{  complement of c.i.}
#' \item[\code{estimator}]{  either \code{"PF"} or \code{"RR"}}
#' \item[\code{y}]{  data vector}
#' }
#' @seealso \code{\link{RRsc}}
#' @export
#' @author Marie Vendettuoli \email{marie.c.vendettuoli@@aphis.usda.gov}
rrsc <- setRefClass('rrsc', contains = 'pf', fields = list(estimate = 'matrix',
	y = 'numeric'), methods = list(initialize = function(...){
		estimate <<- matrix(0, nrow = 5, ncol = 3, dimnames = list(c('log method', 
			'0.5 method', 'MN method', 'score method', 'skew corr'), c('PF', 'LL', 'UL')))
		y <<- numeric(0)
		callSuper(...)}))
	
#' @title Data class rrstr
#' @name rrstr
#' @aliases rrstr-class
#' @rdname rrstrclass
#' @section Fields:
#' \itemize{
#' \item[\code{estimate}]{  vector with point and interval estimate}
#' \item[\code{rnd}]{  how many digits to round display}
#' \item[\code{alpha}]{  complement of c.i.}
#' \item[\code{estimator}]{  either \code{"PF"} or \code{"RR"}}
#' \item[\code{hom}]{  list of homogeneity statistic, p-value, and degrees of freedom}
#' \item[\code{y}]{  matrix of data}
#' \item[\code{compare}]{  groups compared}
#' }
#' @seealso \code{\link{RRstr}}
#' @export
#' @author Marie Vendettuoli \email{marie.c.vendettuoli@@aphis.usda.gov}
rrstr <- setRefClass('rrstr', contains = 'pf', fields = list(estimate = 'matrix',
	hom = 'list', y = 'matrix', compare = 'character'), methods = list(initialize = function(...){
		estimate <<- matrix(0, nrow = 3, ncol = 3, dimnames = list(c('starting', 'mle', 'skew corr'), c('RR', 'LL', 'UL')))
		
		hom <<- list(0)
		y <<- matrix(0)
		compare <<- character(0)
		callSuper(...)}))
	
