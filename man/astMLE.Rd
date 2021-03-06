% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/astMLE.R
\name{astMLE}
\alias{astMLE}
\alias{astmle}
\title{Fitting function for Asymmetric Student-t distribution}
\usage{
astMLE(data, start_pars = c(), fixed_pars = c(), solver = c("nlminb",
  "nloptr", "Rsolnp"), solver_control = list(), symmetric = FALSE)
}
\arguments{
\item{data}{a univariate data object to be fitted}

\item{start_pars}{a named numeric vector of starting parameters for the optimization algorithm, not all parameters are needed}

\item{fixed_pars}{a named numeric vector of parameters to be kept fixed during the optimization routine, not all parameters are needed}

\item{solver}{solver used for MLE, one of 'nlminb', 'nloptr', 'Rsolnp', default is 'nlminb'}

\item{solver_control}{list of control arguments passed to the solver}

\item{symmetric}{a logical argument, when TRUE, the function fits an SST distribution(Symmetric Student-t, nu1 = nu2) instead, default to FALSE}
}
\value{
A \code{ast} object(S3), the components of the object are:
    \item{data}{the univariate data object for the AST distribution to be fitted}
    \item{solver}{the solver called}
    \item{solver_control}{the list of control argumetns passed to the solver called}
    \item{start_pars}{named numeric vector of starting parameters used}
    \item{fixed_pars}{named numeric vector of fixed parameters used}
    \item{symmetric}{logical argument controlling the symmetry of tail parameters in the MLE}
    \item{solver_result}{output of the called solver}
    \item{fitted_pars}{named vector of fitted arguemnts of the AST distribution}
    \item{objective}{the optimal log-likelihood value obtained by the solver}
    \item{time_elapsed}{the time elapesed for the MLE routine}
    \item{message}{the message of convergence status produced by the called solver}
    \item{standard_errors}{standard errors of the fitted parameters}
}
\description{
Method for fitting an AST distribution to a univariate data series by Maximum Likelihood Estimation,
returns an \code{ast} object.
}
\details{
The \code{astMLE} function fits an AST distribution to a univariate data series by estimating the distribution parameters
through Maximum Likelihood Estimation.

For details of the list of control arguments, please refer to \code{nlminb}, \code{nloptr::nloptr}, \code{Rsolnp::solnp}
}
\examples{
pars <- c(0.12, 0.6, 0.6, 6, 5)
data <- rast(1000, pars = pars)
fit <- astMLE(data)
summary(fit)
moments(fit)
fitted(fit)
se(fit)
objective(fit)
plot(fit)
}
\references{
Zhu, D., & Galbraith, J. W. (2010). A generalized asymmetric Student-t distribution with application to financial econometrics. Journal of Econometrics, 157(2), 297-305.\url{https://www.sciencedirect.com/science/article/pii/S0304407610000266}
\url{https://econpapers.repec.org/paper/circirwor/2009s-13.htm}
}
