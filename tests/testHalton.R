library(randtoolbox)

#### outputs ####
print(halton(1, 5))

options(digits=15)
n <- 30
cbind( 1/get.primes(n), as.vector(halton(1, n) ) )

#### n argument ####
try(halton(-1))

#### dim argument ####
try(halton(1, 0))


#### init argument ####
halton(5)
randtoolbox:::.getrandtoolboxEnv(".halton.seed")
halton(5, init=TRUE)
randtoolbox:::.getrandtoolboxEnv(".halton.seed")
halton(5, init=FALSE)
try(halton(5, init="a"))

#### mixed argument ####

try(halton(1, mixed=3))
halton(3, mixed=TRUE)

#### usetime argument ####
#QMC with time machine start
halton(5, usetime=TRUE)
halton(5, usetime=TRUE)

#hybrid QMC with SFMT : test continuing the sequence (bug reported by Hiroyuki Kawakatsu)
setSeed(1234); 
print( halton(3, init=TRUE, mixed=TRUE, mexp=607) );
print( halton(3, init=FALSE, mixed=TRUE) );

setSeed(1234); 
print( halton(3, init=TRUE, mixed=TRUE, mexp=607) );
print( halton(3, init=FALSE, mixed=TRUE) )

#### method argument ####
n <- 5
d <- 4
halton(n, d, method="C")
halton(n, d, method="Fortran", start=0)
halton(n, d, method="Fortran", start=1)
randtoolbox:::.getrandtoolboxEnv(".halton.seed")
halton(n, d, method="C", start=5)
halton(n, d, method="Fortran", start=5)

#### normal argument ####
halton(3, normal=TRUE)
try(halton(3, normal=1))

#### mexp argument ####
halton(3, mexp=607)
try(halton(3, mexp=3))
try(halton(3, mexp="3"))


#### start argument ####
try(halton(3, start="3"))
halton(5, start=0)
halton(5, start=1)


#### testing time ####

if(FALSE)
{
  n <- 10
  d <- 10000
  check <- all(halton(n, d, method="C") == halton(n, d, method="Fortran"))
  check
  
  n <- 1e3
  d <- 1e3
  system.time(halton(n, d, method="C"), gcFirst = TRUE)
  system.time(halton(n, d, method="Fortran"), gcFirst = TRUE)
}