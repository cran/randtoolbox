 #############################################################################
 #   Copyright (c) 2008 Christophe Dutang                                                                                                  #
 #                                                                                                                                                                        #
 #   This program is free software; you can redistribute it and/or modify                                               #
 #   it under the terms of the GNU General Public License as published by                                         #
 #   the Free Software Foundation; either version 2 of the License, or                                                   #
 #   (at your option) any later version.                                                                                                            #
 #                                                                                                                                                                         #
 #   This program is distributed in the hope that it will be useful,                                                             #
 #   but WITHOUT ANY WARRANTY; without even the implied warranty of                                          #
 #   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the                                 #
 #   GNU General Public License for more details.                                                                                    #
 #                                                                                                                                                                         #
 #   You should have received a copy of the GNU General Public License                                           #
 #   along with this program; if not, write to the                                                                                           #
 #   Free Software Foundation, Inc.,                                                                                                              #
 #   59 Temple Place, Suite 330, Boston, MA 02111-1307, USA                                                             #
 #                                                                                                                                                                         #
 #############################################################################
### Torus algorithm to generate quasi random numbers
###
###			R functions
### 


torus <- function(n, dim = 1, prime, mixed = FALSE, usetime = TRUE)
{
        if(n <0 || is.array(n))
                stop("invalid argument 'n'")
        if(dim < 0 || length(dim) >1)
                stop("invalid argument 'dim'")
        if(!is.logical(usetime))
                stop("invalid argument 'mixed'")
        if(!is.logical(mixed))
                stop("invalid argument 'mixed'")
    
        if(missing(prime)) 
                prime <- NULL
        else
        {
                if(any(prime < 0) || !is.vector(prime))
                        stop("invalid argument 'prime'")

                dim <- length(prime)
                prime <- as.integer( prime )
        }
    
        
        if(length(n) > 1)
                res <- .Call("doTorus", length(n), dim, prime, mixed, usetime)
        else
                res <- .Call("doTorus", n, dim, prime, mixed, usetime)	
        if(dim == 1)
                as.vector(res)
        else
                as.matrix(res)
}

setTorusSeed <- function(seed)
	invisible( .Call("doSetTorusSeed", seed) )

congruRand <- function(n, dim = 1, mod = 2^31-1, mult = 16807, incr = 0, echo)
{
        if(!is.numeric(n) || any(n <=0))
                stop("invalid argument 'n'")
        if(!is.numeric(dim) || length(dim) !=1 || any(dim <= 0))
                stop("invalid argument 'dim'")
        if(!is.numeric(mod) || length(mod) !=1)
                stop("invalid argument 'mod'")
        if(!is.numeric(mult) || length(mult) != 1 || mult > mod || mult < 0)
                stop("invalid argument 'mult'")
        if(!is.numeric(incr) || length(incr) != 1 || incr > mod || incr < 0)
                stop("invalid argument 'incr'")    
           
        if(missing(echo))
                echo <- FALSE
    
        if(length(n) > 1)
                res <- .Call("doCongruRand", length(n), dim, mod, mult, incr, echo)
        else
                res <- .Call("doCongruRand", n, dim, mod, mult, incr, echo)	
        if(dim == 1)    
                as.vector(res)
        else
                as.matrix(res)
}

SFMT <- function(n, dim = 1, sse2=TRUE)
{
        if(n <0 || is.array(n))
                stop("invalid argument 'n'")
        if(dim < 0 || length(dim) >1)
                stop("invalid argument 'dim'")
    
        if(length(n) > 1)
                res <- .Call("doSFMersenneTwister", length(n), dim, sse2)
        else
                res <- .Call("doSFMersenneTwister", n, dim, sse2)	
        if(dim == 1)
                as.vector(res)
        else
                as.matrix(res)
}
 
testTorus <- function(n, dim=1)
{
	primeNumber <- c(2,      3,      5,      7,     11,     13,     17,     19,     23,     29, 
	31,     37,     41,     43,     47,     53,     59,     61,     67,     71, 
	73,     79,     83,     89,     97,    101,    103,    107,    109,    113, 
    127,    131,    137,    139,    149,    151,    157,    163,    167,    173, 
    179,    181,    191,    193,    197,    199,    211,    223,    227,    229, 
    233,    239,    241,    251,    257,    263,    269,    271,    277,    281, 
    283,    293,    307,    311,    313,    317,    331,    337,    347,    349, 
    353,    359,    367,    373,    379,    383,    389,    397,    401,    409, 
    419,    421,    431,    433,    439,    443,    449,    457,    461,    463, 
    467,    479,    487,    491,    499,    503,    509,    521,    523,    541 )
	
	prime <- primeNumber[1:dim]
	
	nSqrtP <- outer(1:n, sqrt(prime))
	
	return( nSqrtP - floor(nSqrtP) )
} 

graphTest <- function(nmax = 100, dim=2, h=100)
{
	echant <- 1:nmax*h
	resTimeC <- sapply(echant, function(x) system.time(torus(x, dim))[3])
	resTimeR <- sapply(echant, function(x) system.time(testTorus(x, dim))[3])
	
	plot(echant, resTimeR, t='l', col="blue", main="computation time")
	lines(echant, resTimeC, col="green")
	legend("bottomright",c("in R","in C"), col=c("blue","green"),lty=1)
}