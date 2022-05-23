library(randtoolbox)

n <- 5

#### outputs ####
frac <- function(x) x-floor(x)

torusR <- function(n, k)
	frac(1:n %o% sqrt(get.primes(k)))

torusR(n, 5) - torus(n, 5) 

#### n argument ####
try(torus(-1))

#### dim argument ####
try(torus(1, 0))

#### prime argument ####
try(torus(1, prime="a"))
torus(n, prime=5) - torus(n, 3)[,3]

#### init argument ####
torus(n)
randtoolbox:::.getrandtoolboxEnv(".torus.seed")
torus(n, init=TRUE)
randtoolbox:::.getrandtoolboxEnv(".torus.seed")
torus(n, init=FALSE)
try(torus(5, init="a"))

#### mixed argument ####

try(torus(1, mixed=3))
torus(n, mixed=TRUE)


#hybrid QMC with SFMT : test continuing the sequence (bug reported by Hiroyuki Kawakatsu)
setSeed(1234); 
torus(n, init=TRUE, mixed=TRUE, mexp=607) 
torus(n, init=FALSE, mixed=TRUE) 


setSeed(1234); 
torus(n, init=TRUE, mixed=TRUE, mexp=607) 
torus(n, init=FALSE, mixed=TRUE)

#### usetime argument ####

#QMC with time machine start
torus(n, usetime=TRUE)
torus(n, usetime=TRUE)

#### normal argument ####
torus(n, normal=TRUE)
try(torus(3, normal=1))

#### mexp argument ####
torus(n, mexp=607)
try(torus(3, mexp=3))
try(torus(3, mexp="3"))

#### start argument ####
try(torus(3, start="3"))
torus(n, start=0)
torus(n, start=1)
