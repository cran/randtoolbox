
library(randtoolbox)

mytrace <- TRUE
mytrace <- FALSE

if(FALSE)
{
#degree 0
res <- sobol.directions.mj(1, 1, 5)
apply(res, 2, bit2int)
  

#degree 3 : x^3+x^2+1, p306 Glasserman (2003)
p13 <- int2bit(13)
m1 <- 1
m2 <- m3 <- 3

prevmj <- cbind(int2bit(m1), int2bit(m2), int2bit(m3))
sobol.directions.mj(prevmj, p13, 5, input="binary", output="real")



#degree 1 : x+1, p319 Glasserman (2003)
p3 <- int2bit(3)
m1 <- 1 
sobol.directions.mj(int2bit(m1), p3, 7, input="binary", output="real", echo=mytrace)

#degree 2 : x^2+x+1, p319 Glasserman (2003)
p7 <- int2bit(7)
m1 <- m2 <- 1 
prevmj <- cbind(int2bit(m1), int2bit(m2))
sobol.directions.mj(prevmj, p7, 6, input="binary", output="real", echo=mytrace)
sobol.directions.vj(prevmj, p7, 6, input="binary", output="real", echo=mytrace)

#degree 3 : x^3+x+1, p319 Glasserman (2003)
p11 <- int2bit(11)
m1 <- 1
m2 <- 3
m3 <- 7
prevmj <- cbind(int2bit(m1), int2bit(m2), int2bit(m3))
sobol.directions.mj(prevmj, p11, 6, input="binary", output="real", echo=mytrace)
sobol.directions.vj(prevmj, p11, 6, input="binary", output="real", echo=mytrace)

}
