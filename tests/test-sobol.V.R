
library(randtoolbox)

mytrace <- TRUE
mytrace <- FALSE

if(FALSE)
{
#p318 Glasserman (2003)

mymj <- list(
c(1,1,1),
c(1,3,5),
c(1,1,7))
mypj <- c(1, 3, 7)

sobol.V(mymj ,mypj, bitnb=5, echo=FALSE)


mymj <- list(
  c(1),
  c(1),
  c(1,1,7))
mypj <- c(1, 3, 7)

sobol.V(mymj ,mypj, bitnb=5, echo=FALSE)

}