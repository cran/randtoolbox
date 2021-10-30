library(randtoolbox)

n <- 5

#produce the same outputs since the same seed is used

setSeed(1234)
SFMT(n, mexp=607, usepset=FALSE)
setSeed(1234)
SFMT(n, mexp=607, usepset=FALSE)

#only first call produce the same outputs since time machine is used otherwise

setSeed(1234)
SFMT(n, mexp=607, usepset=FALSE)
SFMT(n, mexp=607, usepset=FALSE)
setSeed(1234)
SFMT(n, mexp=607, usepset=FALSE)
SFMT(n, mexp=607, usepset=FALSE)
