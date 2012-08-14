#' Package for PF.
#'
#' Includes functions related to prevented fraction. 
#'
#' \tabular{ll}{
#' Package: \tab pf-package\cr
#' Type: \tab Package\cr
#' Version: \tab 9.4\cr
#' Date: \tab 2012-08-14\cr
#' License: \tab MIT\cr
#' LazyLoad: \tab yes\cr
#' LazyData: \tab yes\cr
#' }
#'
#' @name PF-package
#' @aliases PF
#' @docType package
#' @author David Siev \email{David.Siev@@aphis.usda.gov}
#' @examples
#' #---------------------------------------------
#' # Checking PF package
#' #---------------------------------------------
#' example(RRsc)
#' example(RRstr)
#' example(RRmh)
#' example(RRor)
#' example(phiWt)
#' example(tauWt)
#' example(rsbWt)
#' example(rsb)
#' example(RRlsi)
#' example(IDRsc)
#' example(IDRlsi)
#' #---------------------------------------------
#' # The next two take a moment to run
#' #---------------------------------------------
#' example(RRtosst)
#' example(RRotsst)
#' #---------------------------------------------
#' # End examples
#' #---------------------------------------------
#' invisible()
NA

#' @name New
#' @title New dataset
#' @alias New-data
#' @docType data
#' @description This data set is the outcome of a vaccination-challenge study. Each cage housed two dogs, one randomized to vaccine, the other received placebo. 
#' All subjects were later challenged with the virulent pathogen. Those affected by the disease were recorded as positive.
#' @format a data frame with 52 observations of the following 3 variables, no NAs
#' \describe{
#' \item{cage}{Cage ID. 1 - 26}
#' \item{tx}{Treatment. One of 'con' or 'vac'}
#' \item{pos}{Response indicator. 0 = negative or 1 = positive}
#' }
#' @keywords datasets
NA

#' @name Table6
#' @title Table6 dataset
#' @alias Table6-data
#' @rdname dfTable6
#' @docType data
#' @description These are the data from Table 1 in Gart (1985). They show the number of pulmonary tumors among four combinations of sex and strain of mice.
#' @format a data.frame with 8 observations of the following variables, no NAs
#' \describe{
#' \item{y}{number positive}
#' \item{n}{number positive + number negative}
#' \item{tx}{treatment 'a' or 'b'}
#' \item{clus}{cluster ID}
#' }
#' @references Gart JJ, 1985. Approximate tests and interval estimation of the common relative risk in the combination of \eqn{2 x 2} tables. \emph{Biometrika} 72:673-677. Table 1.
#' @keywords datasets
NA

#' @name bird
#' @title bird dataset
#' @description This data set is the outcome of a vaccination-challenge study in chickens. Chickens were randomized to one of six cages, and the cages were then randomized to vaccine or placebo groups.
#' Some time after vaccination, all subjects were challenged with the virulent pathogen. Those affected by the disease were recorded as positive.
#' @alias bird-data
#' @docType data
#' @format A data.frame with 6 observations, no NAs
#' \describe{
#' \item{y}{number positive}
#' \item{n}{number positive + number negative}
#' \item{tx}{treatment 'vac' or 'con'}
#' }
#' @keywords datasets
NA

#' @name birdm
#' @title birdm dataset
#' @description This is an artificial modification of the \code{\link{bird}} data set for an example described in the PF Vignette, Section 4.2.2.
#' @alias birdm-data
#' @docType data
#' @format a data.frame with 6 observations, no NAs
#' \describe{
#' \item{y}{number positive}
#' \item{n}{number positive + number negative}
#' \item{tx}{treatment 'vac' or 'con'}
#' }
#' @seealso \code{\link{bird}}
#' @keywords datasets
NA


#' @name table6
#' @title table6 dataset
#' @alias table6-data
#' @format matrix for of data in \code{\link{Table6}}
#' @keywords datasets
NA

#' @name rat
#' @title rat dataset
#' @alias rat-data
#' @description Weil's rat data. Two groups of 16 pregnant rats were fed a treated diet or a control diet. For each of the 32 litters, the numbers of neonates weaned are recorded as positive.
#' @format a data.frame with 32 observations of the following variables, no NAs
#' \describe{
#' \item{y}{number positive}
#' \item{n}{number positive + number negative}
#' \item{group}{treatment group: 'control' or 'treated'}
#' }
#' @references Weil's rat data, as shown in Table 1 of Rao and Scott: \cr \cr
#' Rao JNK, Scott AJ, 1992. A simple method for the analysis of clustered binary data. \emph{Biometrics} 48:577-585.
#' @keywords datasets
NA

