
library(randtoolbox)

mytrace <- TRUE
mytrace <- FALSE

if(FALSE)
{

#degree 0
mjrec(1, 1, echo=mytrace)

#degree 3 : x^3+x^2+1, p306 Glasserman (2003)
p13 <- int2bit(13)
m1 <- 1
m2 <- m3 <- 3

prevmj <- cbind(int2bit(m1), int2bit(m2), int2bit(m3))
res <- mjrec(prevmj, p13, echo=mytrace)
m4 <- bit2int(res)

prevmj <- cbind(int2bit(m2), int2bit(m3), int2bit(m4))
res <- mjrec(prevmj, p13, echo=mytrace)
m5 <- bit2int(res)

c(m1, m2, m3, m4, m5)

#degree 1 : x+1, p319 Glasserman (2003)
p3 <- int2bit(3)
m1 <- 1 
res <- mjrec(int2bit(m1), p3, echo=mytrace)
m2 <- bit2int(res)

prevmj <- cbind(int2bit(m1), int2bit(m2))
res <- mjrec(prevmj, p3, echo=mytrace)
m3 <- bit2int(res)

prevmj <- cbind(int2bit(m1), int2bit(m2), int2bit(m3))
res <- mjrec(prevmj, p3, echo=mytrace)
m4 <- bit2int(res)

c(m1, m2, m3, m4)

}
