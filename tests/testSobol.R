library(randtoolbox)


#### n argument ####
try(sobol(-1))

#### dim argument ####
try(sobol(1, 0))


#### init argument ####
sobol(5)
randtoolbox:::.getrandtoolboxEnv(".sobol.seed")
sobol(5, init=TRUE)
randtoolbox:::.getrandtoolboxEnv(".sobol.seed")
sobol(5, init=FALSE)
try(sobol(5, init="a"))

#### mixed argument ####

try(sobol(1, mixed=3))
sobol(3, mixed=TRUE)

#### normal argument ####
sobol(3, normal=TRUE)
try(sobol(3, normal=1))


#### start argument ####
try(sobol(3, start="3"))
sobol(5, start=0)
sobol(5, start=1)


