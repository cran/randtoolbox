library(randtoolbox)

#### outputs ####
frac <- function(x) x-floor(x)

torusR <- function(n, k)
	frac(1:n %o% sqrt(get.primes(k)))

torusR(10, 5) - torus(10, 5) 

#### n argument ####
try(torus(-1))

#### dim argument ####
try(torus(1, 0))

#### prime argument ####
try(torus(1, prime="a"))
torus(2, prime=5) - torus(2, 3)[,3]

#### init argument ####
torus(5)
randtoolbox:::.getrandtoolboxEnv(".torus.seed")
torus(5, init=TRUE)
randtoolbox:::.getrandtoolboxEnv(".torus.seed")
torus(5, init=FALSE)
try(torus(5, init="a"))

#### mixed argument ####

try(torus(1, mixed=3))
torus(3, mixed=TRUE)


#hybrid QMC with SFMT : test continuing the sequence (bug reported by Hiroyuki Kawakatsu)
setSeed(1234); 
print( torus(3, init=TRUE, mixed=TRUE, mexp=607) );
print( torus(3, init=FALSE, mixed=TRUE) );


setSeed(1234); 
print( torus(3, init=TRUE, mixed=TRUE, mexp=607) );
print( torus(3, init=FALSE, mixed=TRUE) )

#### usetime argument ####

#QMC with time machine start
torus(5, usetime=TRUE)
torus(5, usetime=TRUE)

#### normal argument ####
torus(3, normal=TRUE)
try(torus(3, normal=1))

#### mexp argument ####
torus(3, mexp=607)
try(torus(3, mexp=3))
try(torus(3, mexp="3"))

#### start argument ####
try(torus(3, start="3"))
torus(5, start=0)
torus(5, start=1)
