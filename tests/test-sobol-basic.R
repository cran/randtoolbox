library(randtoolbox)


if(FALSE)
{
  
  n <- 10
  mymj <- list(
    c(1),
    c(1),
    c(1,3,7))
  mypj <- c(1, 3, 7)
  
  myV <- sobol.V(mymj ,mypj, bitnb=31, echo=FALSE)

    
  uD1 <- sobol.basic(n, myV[[1]], bitnb=31, echo=FALSE, output="real",
                          start=1)
  uD2 <- sobol.basic(n, myV[[2]], bitnb=31, echo=FALSE, output="real",
              start=1)
  uD3 <- sobol.basic(n, myV[[3]], bitnb=31, echo=FALSE, output="real",
              start=1)
  
  sobol.check <- read.csv("sobol.check.csv")
  
  sobol.check[1:n, 1:3] == cbind(uD1, uD2, uD3)
  
  
  sobol.R(n, 3)
}

