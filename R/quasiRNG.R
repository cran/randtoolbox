## 
# @file  quasiRNG.R
# @brief R file for all quasi RNGs
#
# @author Christophe Dutang
# @author Diethelm Wuertz 
#
#
# The new BSD License is applied to this software.
# Copyright (c) 2022 Christophe Dutang, Diethelm Wuertz. 
# All rights reserved.
#
#      Redistribution and use in source and binary forms, with or without
#      modification, are permitted provided that the following conditions are
#      met:
#      
#          - Redistributions of source code must retain the above copyright
#          notice, this list of conditions and the following disclaimer.
#          - Redistributions in binary form must reproduce the above
#          copyright notice, this list of conditions and the following
#          disclaimer in the documentation and/or other materials provided
#          with the distribution.
#          - Neither the name of the ETH Zurich nor the names of its 
#          contributors may be used to endorse or promote 
#          products derived from this software without specific prior written
#          permission.
#     
#      THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
#      "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
#      LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
#      A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
#      OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
#      SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
#      LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
#      DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
#      THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
#      (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
#      OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#  
#
#############################################################################
### quasi random generation
###
###			R functions
### 


### quasi random generation ###

torus <- function(n, dim = 1, prime, init = TRUE, mixed = FALSE, usetime = FALSE, 
                  normal=FALSE, mexp = 19937, start = 1)
{
  ## Check arguments
  if(is.array(n) || !is.numeric(n))
    stop("invalid argument 'n'")
  if(length(dim) >  1)
    stop("invalid argument 'dim'")
  if(dim < 1 || dim > 100000)
    stop("invalid argument 'dim'")
  if(!is.logical(init))
    stop("invalid argument 'init'")
  if(!is.logical(mixed))
    stop("invalid argument 'mixed'")
  if(!is.logical(usetime))
    stop("invalid argument 'usetime'")
  if(!is.logical(normal))
    stop("invalid argument 'normal'")
  if(!is.numeric(mexp))
    stop("invalid argument 'mexp'")
  if(!is.numeric(start))
    stop("invalid argument 'start'")
  
  if(missing(prime)) 
    prime <- NULL
  else
  {
    if(!is.numeric(prime))
      stop("invalid argument 'prime'")
    if(any(prime < 0) || !is.vector(prime))
      stop("invalid argument 'prime'")
    
    dim <- length(prime)
    prime <- as.integer( prime )
  }
  ## Mersenne exponent only used when mixed=TRUE
  authorizedParam <- c(607, 1279, 2281, 4253, 11213, 19937, 44497, 86243, 132049, 216091)
  if( !(mexp %in% authorizedParam) )
    stop("'mexp' must be in {607, 1279, 2281, 4253, 11213, 19937, 44497, 86243, 132049, 216091}.")
  
  ## Restart Settings:
  if(init) 
    .setrandtoolboxEnv(.torus.seed = list(offset = as.integer(start)))
  if(!exists(".torus.seed", envir=.randtoolboxEnv, mode="list"))
    stop("Torus algorithm not initialized.")
  
  ## Compute        
  nb <- ifelse(length(n)>1, length(n), n)
  if(nb < 0) stop("invalid argument 'n'")
  if(nb == 0) return(numeric(0))
  startpt <- .getrandtoolboxEnv(".torus.seed")$offset
  
  #not necessary
  #if(init && start != 0 && !normal) 
  #  warning("You should start your sequence from 0 as recommended by Owen (2020).")
  
  #implemented in src/randtoolbox.c
  res <- .Call(CF_doTorus, nb, dim, prime, startpt, mixed, usetime, mexp)
  
  if(any(res > 1 | res < 0))
    warning("A call to torus() generate numerics outside [0,1).")
  
  ## Normal transformation
  if(normal)
    res <- qnorm(res)
  
  ## For the next numbers save (only used if init=FALSE in the next call)
  .setrandtoolboxEnv(.torus.seed = list(offset = startpt+nb))	
  
  ## Result	
  if(dim == 1)
    as.vector(res)
  else
    as.matrix(res)
}

get.primes <- function(n)
{
  n <- min(n,100000)
  .C("get_primes",as.integer(n),integer(n))[[2]]
}

#(n, dim = 1, prime, init = TRUE, usetime = FALSE, normal=FALSE)
halton <- function (n, dim = 1, init = TRUE, normal = FALSE, usetime = FALSE, 
                    mixed = FALSE, method="C", mexp = 19937, start = 1)
{   
  # A function based on Diethelm Wuertz's code
  
  ## Check arguments
  if(is.array(n) || !is.numeric(n))
    stop("invalid argument 'n'")
  if(length(dim) >  1)
    stop("invalid argument 'dim'")
  if(dim < 1 || dim > 100000)
    stop("invalid argument 'dim'")
  if(!is.logical(init))
    stop("invalid argument 'init'")
  if(!is.logical(mixed))
    stop("invalid argument 'mixed'")
  if(!is.logical(usetime))
    stop("invalid argument 'usetime'")
  if(!is.logical(normal))
    stop("invalid argument 'normal'")
  if(!is.numeric(start))
    stop("invalid argument 'start'")
  if(!is.numeric(mexp))
    stop("invalid argument 'mexp'")
  method <- match.arg(method, "C")
  
  # Description:
  #   Uniform Halton Low Discrepancy Sequence
  
  # Details:
  #   DIMENSION : dimension limited to 100000
  #       N : LD numbers to create
  
  # Initiate starting point:
  if(usetime)
    start <- as.numeric(Sys.time())
  else
  {
    start <- as.integer(start)
  }
  
  # Restart Settings:
  if (init) 
    .setrandtoolboxEnv(.halton.seed = list(base = rep(0, dim), offset = start))
  if(!exists(".halton.seed", envir=.randtoolboxEnv, mode="list"))
    stop("Halton algorithm not initialized.")
  
  nb <- ifelse(length(n)>1, length(n), n)
  if(nb < 0) stop("invalid argument 'n'")
  if(nb == 0) return(numeric(0))
  rngEnv <- .getrandtoolboxEnv(".halton.seed")
  
  #not necessary
  #if(init && start != 0 && !normal) 
  #  warning("You should start your sequence from 0 as recommended by Owen (2020).")
  
  #method == "C"
  ## Mersenne exponent only used when mixed=TRUE
  authorizedParam <- c(607, 1279, 2281, 4253, 11213, 19937, 44497, 86243, 132049, 216091)
  if( !(mexp %in% authorizedParam) )
    stop("'mexp' must be in {607, 1279, 2281, 4253, 11213, 19937, 44497, 86243, 132049, 216091}. ")
  
  #implemented in src/randtoolbox.c
  result <- .Call(CF_doHalton, nb, dim, rngEnv$offset, mixed, usetime, mexp)
  # For the next numbers save (only used if init=FALSE in the next call)
  lshift <- list("base" = get.primes(dim), 
                 "offset" = rngEnv$offset+nb)
  .setrandtoolboxEnv(.halton.seed = lshift)
  
  if(any(result > 1 | result < 0))
    warning("A call to halton() generate numerics outside [0,1).")
  
  ## Normal transformation
  if(normal)
    result <- qnorm(result)
  
  # Return Value:
  if(dim == 1)
    as.vector(result)
  else
    as.matrix(result)
}


runif.halton <- halton


sobol <- function (n, dim = 1, init = TRUE, scrambling = 0, seed = NULL, normal = FALSE,
                   mixed = FALSE, method="C", mexp = 19937, start = 1,
                   maxit = 10)
{   
  ## Check arguments
  if(is.array(n) || !is.numeric(n))
    stop("invalid argument 'n'")
  if(length(dim) >  1)
    stop("invalid argument 'dim'")
  if(dim < 1 || dim > 1111) #prepare the future release
    stop("invalid argument 'dim'")
  if(!is.logical(init))
    stop("invalid argument 'init'")
  if(!is.logical(mixed))
    stop("invalid argument 'mixed'")
  if(!is.logical(normal))
    stop("invalid argument 'normal'")
  if(!is.numeric(start))
    stop("invalid argument 'start'")
  if( !any(scrambling == 0:3) )
    stop("invalid argument 'scrambling'")   
  if(!is.numeric(mexp))
    stop("invalid argument 'mexp'")
  if(!is.numeric(maxit))
    stop("invalid argument 'maxit'")
  method <- match.arg(method, "C")
  
  #for scrambled sequences when sobol_fortran() generates numbers outside [0,1)
  if(maxit <= 0 || maxit > 1e3)
    stop("maxit should be a positive integer below 1000.")
  
  nb <- ifelse(length(n)>1, length(n), n)
  if(nb < 0) stop("invalid argument 'n'")
  if(nb == 0) return(numeric(0))
  
  if(init && start != 0 && start != 1) 
    warning("start argument is ignored.")
  #not necessary
  #if(init && start != 0 && !normal) 
  #  warning("You should start your sequence from 0 as recommended by Owen (2020).")
  
  scramblmixed <- scrambling > 0 || mixed
  
  if(scrambling > 0)
    warning("scrambling is currently disabled.")
  # if(scrambling > 0 && mixed)
  #   warning("only scrambling is used.")
  if(scrambling > 0)
  {
    if(is.null(seed))
      seed <- 4711 #default value
    else
      seed <- as.integer(seed) #convert it to integer
  }else if(scrambling == 0)
  {
    if(mixed)
    {
      seed <- as.integer(round(2^30*runif(1)))
      iter <- 0
      while(is.na(seed) && iter < maxit)
      {
        iter <- iter + 1
        seed <- as.integer(round(2^30*runif(1)))
      }
      if(iter == maxit)
        stop("100 calls to as.integer(round(2^30*runif(1))) have all generated NA, so we resign.") 
    }else
      seed <- 0 #default value for pure QMC
    
  }
  
  #method == "C"
  
  # Description:
  #   Uniform Sobol Low Discrepancy Sequence
  # Details:
  #   DIMENSION : dimension <= 1111
  #           N : LD numbers to create
  #  SCRAMBLING : One of the numbers 0,1,2,3 => not yet implemented
  
  # Restart Settings:
  if (init) 
    .setrandtoolboxEnv(.sobol.seed = 
                         list(quasi = rep(0, dim), ll = 0, count = 0, sv = rep(0, dim*30), seed = seed))
  if(!exists(".sobol.seed", envir=.randtoolboxEnv, mode="list"))
    stop("Sobol algorithm not initialized.")
  C_sobol_init <- TRUE
  
  #Determine the number of points
  if(init) 
  {
    nbfinal <- nb + start
  }else
  {
    nbfinal <- nb + as.integer( .getrandtoolboxEnv(".sobol.seed")$seed )
  }
  #generate more points that needed as CF_doSobol() starts from 0
  sobolres <- .Call(CF_doSobol, nbfinal, dim, 0, FALSE, FALSE, mexp)
  #keep last nb points without names
  sobolres <- tail(sobolres, nb, keepnums=FALSE)
  
  # For the next numbers save (only used if init=FALSE in the next call)
  if(C_sobol_init) 
    .setrandtoolboxEnv(.sobol.seed = list(seed = tail(nbfinal, 1)))
  
  ## Normal transformation
  if(normal)
    sobolres <- qnorm(sobolres)   
  
  # Return Value:
  if(dim == 1)
    as.vector(sobolres)
  else
    as.matrix(sobolres)    
}


runif.sobol <- sobol

