\name{randtoolbox-package}
\alias{randtoolbox-package}
\alias{randtoolbox}
\docType{package}
\title{
  General remarks on toolbox for pseudo and quasi random number generation
}
\description{The randtoolbox-package started in 2007 
  during a student working group at ISFA (France). From then, it
  grew quickly thanks to the contribution of Diethelm Wuertz
  and Petr Savicky. It was presented at a Rmetrics 
  workshop in 2009 in Meielisalp, Switzerland. 
   
  This package provides state-of-the-art pseudo RNGs 
  for simulations as well as the usual quasi RNGs.
  See \code{\link{pseudoRNG}} and \code{\link{quasiRNG}}, respectively. 
  There are also some RNG tests. 

  We recommend first users to take a look at the vignette 'Quick introduction of randtoolbox',
  whereas advanced users whould have a look at the vigentte 'A note on random number generation'.
  
  The stable version is available on CRAN 
  \url{https://CRAN.R-project.org/package=randtoolbox},
  while the development version is hosted on R-forge in the rmetrics project
  at \url{https://r-forge.r-project.org/projects/rmetrics/}.
  
} 
\details{
\tabular{ll}{
Package: \tab randtoolbox\cr
License: \tab BSD_3_clause + file LICENSE\cr
Warning 1: in this version, scrambling is disabled for Sobol sequences
in \code{sobol}.
}
}
\author{
Christophe Dutang and Petr Savicky.
}
\keyword{ package }


