\name{soboltestfunctions}
\alias{sobol.R}
\alias{int2bit}
\alias{bit2int}
\alias{bit2unitreal}
\title{Some test functions for Sobol sequences}
\description{
	Some test functions for Sobol sequences
}
\usage{
sobol.R(n, d, echo=FALSE)

int2bit(x)
bit2int(x)
bit2unitreal(x)
}
\arguments{
  \item{n}{number of observations.}
  \item{d}{dimension of observations.}
  \item{echo}{a logical to show some traces.}
  \item{x}{an integer to convert in base 2 or its binary representation}
}
\details{

\code{sobol.R} computes Sobol sequences but not using Gray code so points are
not in the same order as in \code{sobol}.

\code{sobol.basic} compute the Sobol sequence in one dimension according to a primitive
polynomial and specified integers \eqn{m_j}.

\code{int2bit} computes the binary representation of the integer part of a real,
\code{bit2int} computes an integer from its binary representation.
\code{bit2unitreal} computes the radical inverse function in base 2.


}
\value{
  a vector of length \code{n} or a matrix for \code{sobol.R}.
}
\references{
Glasserman P., (2003);
\emph{Monte Carlo Methods in Financial Engineering},
Springer. \doi{10.1007/978-0-387-21617-1}
}
\seealso{
    \code{\link{quasiRNG}} for quasi random number generation. 
}
\author{
 Christophe Dutang
}
\examples{
#page 306 of Glassermann
sobol.R(10,2)


}
\keyword{distribution}
