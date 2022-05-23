## 
# @file  sobol-basic.R
# @brief R file implementing the Sobol recurrence
#
# @author Christophe Dutang
#
#
# The new BSD License is applied to this software.
# Copyright (c) 2017 Christophe Dutang. 
# Christophe Dutang, see http://dutangc.free.fr
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
### Sobol and auxiliary functions
###
###			R functions
### 
  


#get degree
degprimitpoly <- function(x, input="real") #associated
{
  input <- match.arg(input, c("binary", "real"))
  if(input == "real")
    x <- int2bit(x)
  stopifnot(all(x >= 0 & x <= 1))
  max(x*(1:length(x)-1))
}



# prevmj a matrix with binary decomposition of mj
# polycoef a binary decomposition of primtive polynomial
# i.e. (cq, cq-1,..., c1, c0)
# make mj recursion for one term
# i.e. (mj-q, .. mj-1)
mjrec <- function(prevmj, polycoef, echo=FALSE)
{
  stopifnot(all(prevmj >= 0 & prevmj <= 1))
  stopifnot(all(polycoef >= 0 & polycoef <= 1))
  
  deg <- degprimitpoly(polycoef, input="binary")
  stopifnot(deg >= 0)
  
  if(deg == 0)
    return(c(1, rep(0,31)))
  
  if(!is.matrix(prevmj))
    prevmj <- as.matrix(prevmj)
    
  if(NCOL(prevmj) < deg && deg > 0)
    while(NCOL(prevmj) < deg)
      prevmj <- cbind(1, prevmj)
  if(NCOL(prevmj) > deg && deg > 0)
    prevmj <- prevmj[, (NCOL(prevmj)-deg+1):NCOL(prevmj)]
  
  if(!is.matrix(prevmj))
    prevmj <- as.matrix(prevmj)
  
  #only keep coefficients c1,..., cq as c0=1 coefficient for x^q
  if(length(polycoef) > deg)
    polycoef <- polycoef[1:deg]
  
  if(echo)
  {
    cat("prevmj\n")
    print(prevmj)
    if(NCOL(prevmj) > 1)
      print(apply(prevmj, 2, bit2int))
    else
      print(bit2int(prevmj))
    cat("polycoef\n")
    print(polycoef)
    cat("degree", deg, "\n")
  }
  
  #mj-q
  mj <- prevmj[, 1]
  
  #compute c_k 2^k, from k=q-1,..,1
  ck2k <- rev(polycoef) * 2^(1:length(polycoef))
  #compute c_k 2^k, from k=1,..,q-1
  ck2k <- rev(ck2k)
  if(echo)
  {
    cat("c_k 2^k\n")
    print(ck2k)
  }
  
  if(echo)
  {
    cat("\nmj before recursion\n\n")
    print(mj)
  }
  
  for(k in 1:deg)
  {
    if(ck2k[k] != 0)
    {
      ck2kmjk <- int2bit(bit2int(prevmj[,k]) * ck2k[k])
      if(echo)
      {
        cat("k", k, "ck2k[k]\n")
        print(ck2k[k])
        cat("bit2int(prevmj[,k])\n")
        print(bit2int(prevmj[,k]))
        cat("bit2int(prevmj[,k] * ck2k[k])\n")
        print(bit2int(prevmj[,k] * ck2k[k]))
        cat("ck2kmjk\n")
        print(ck2kmjk)
      }
      mj <- oplus(mj, ck2kmjk)
      if(echo)
      {
        cat("mj\n")
        print(mj)
        cat("\n")
      }
    }
  }
  mj
}

#polycoef = (c_q, c_q-1, ..., c_2, c_1, 1) for q=deg with c_q=1 (always)
#prevmj = (m_j-1, m_j-2,..., m_j-q)
sobol.directions.mj <- function(prevmj, polycoef, nbpoint, 
                                echo=FALSE, input="real", output="real")
{
  input <- match.arg(input, c("binary", "real"))
  output <- match.arg(output, c("binary", "real"))
  
  if(input == "real")
  {
    stopifnot(is.vector(prevmj))
    prevmj <- sapply(prevmj, int2bit)
  }
  
  #binary representation
  if(!is.matrix(prevmj))
  {
    #it is already a binary vector for a single mj
    if(all(prevmj >= 0 & prevmj <= 1))
      prevmj <- as.matrix(prevmj)
    else 
      stop("wrong matrix prevmj")
  }
  
  stopifnot(is.matrix(prevmj))
  stopifnot(all(prevmj <= 1 & prevmj >= 0))
  
  if(!all(polycoef <= 1 & polycoef >= 0))
    polycoef <- int2bit(polycoef)
  if(echo)
  {
    cat("primitive polynomial\n")
    print(bit2int(polycoef))
  }
  
  deg <- degprimitpoly(polycoef, input="binary")
  
  allmj <- prevmj
  if(echo)
  {
    cat("prevmj\n")
    if(NCOL(prevmj) > 1)
      print(apply(prevmj, 2, bit2int))
    else
      print(bit2int(prevmj))
  }
  if(nbpoint > 0)
    for(n in 1:nbpoint)
    {
      d <- NCOL(allmj)
      #if(echo)
      #  print(allmj)
      if(deg > 0)
      {
        nextmj <- mjrec(prevmj, polycoef)
      }else
        nextmj <- allmj[,d]
      if(echo) 
      {
        cat("n", n, "mj", bit2int(nextmj), "\n")
      }
      allmj <- cbind(allmj, nextmj)
      prevmj <- allmj[, -1]
    }
  #remove name
  colnames(allmj) <- NULL
  #reverse binary expansion
  if(output == "real")
    allmj <- as.numeric(apply(allmj, 2, bit2int))
  allmj
}

#polycoef = (c_q, c_q-1, ..., c_2, c_1, 1) for q=deg with c_q=1 (always)
#prevmj = (m_j-1, m_j-2,..., m_j-q)
sobol.directions.vj <- function(prevmj, polycoef, nbpoint, 
                                echo=FALSE, input="real", output="binary")
{
  output <- match.arg(output, c("binary", "real"))
  input <- match.arg(input, c("binary", "real"))
  
  M <- sobol.directions.mj(prevmj, polycoef, nbpoint, echo,
                               output="binary", input=input)
  if(echo)
    print(M)
  
  if(NCOL(M) > 1)
  {
    #compute direction numbers vj (in place): dividing by 2 means reversing
    for(j in 2:NCOL(M))
      M[1:j, j] <- rev(M[1:j, j])
    colnames(M) <- paste0("v",1:NCOL(M))
  }
  
  #reverse binary expansion
  if(output == "real" && NCOL(M) > 1)
    M <- as.numeric(apply(M, 2, bit2int))
  if(output == "real" && NCOL(M) == 1)
    M <- as.numeric(bit2int(M))
  M
}

  

#vecpoly = (p1, ..., pd) (interger form)
#listmj = list( (m_j-1, m_j-2,..., m_j-q),..., (m_j-1, m_j-2,..., m_j-q) )
sobol.V <- function(listmj, vecpoly, bitnb=32, echo=FALSE)
{
  stopifnot(length(listmj) == length(vecpoly))
  stopifnot(length(listmj) > 0)
 
  d <- length(listmj)
  V <- lapply(1:d, function(i)
  {
    q <- degprimitpoly(vecpoly[i])
    r <- length(listmj[[i]])
    nbpoint <- bitnb - r
    if(echo)
      cat("nbpoint", nbpoint, "\n")
    Vi <- sobol.directions.vj(listmj[[i]], vecpoly[i], nbpoint=nbpoint, echo=echo, 
                        input="real", output="binary")
    Vi[1:bitnb,]
  })
  V
}


#output = real : x_j in [0,1)
#output = integer : y_j on which to compute the radical inverse
sobol.basic <- function(n, V, bitnb=32, echo=FALSE, output=c("real", "integer"),
                        start=1)
{
  output <- match.arg(output, c("real", "integer"))
  
  stopifnot(is.matrix(V))
  stopifnot(V >= 0 & V <= 1)
  stopifnot(NCOL(V) == bitnb && NROW(V) == bitnb)
  stopifnot(is.numeric(n))
  
  nb <- ifelse(length(n)>1, length(n), n)
  if(nb < 0) stop("invalid argument 'n'")
  if(nb == 0) return(numeric(0))
  
  if(echo) print(V)
  #computer output reals or integers
  x <- numeric(nb)
  for(i in start+0:(nb-1))
  {
    #current integer by rec (modulo 2)
    y <- (V %*% int2bit(i)[1:bitnb]) %% 2
    if(echo) 
    {
      cat("i", i, "\n")
      print(y)
      print(bit2int(y))
    }
    if(output == "real") #convert in [0,1)
    {
      x[i] <- bit2unitreal(y)
    }else
      x[i] <- bit2int(y)
  }
  x
}


sobol.R <- function(n, d, echo=FALSE)
{
  stopifnot(d <= 10)
  #see LowDiscrepancy.f, line 550
  polynomvect <- c(1,3,7,11,13,19,25,37,59,47,61,55,41,67,97,91,
                   109,103,115,131,193,137,145,143,241,157,185,167,229,171,213,
                   191,253,203,211,239,247,285,369,299,301,333,351,355,357,361,
                   391,397,425,451,463,487,501,529,539,545,557,563,601,607,617,
                   623,631,637,647,661,675,677,687,695,701,719,721,731,757,761,
                   787,789,799,803,817,827,847,859,865,875,877,883,895,901,911,
                   949,953,967,971,973,981,985,995,1001,1019,1033,1051,1063,
                   1069,1125,1135,1153,1163,1221,1239,1255,1267,1279,1293,1305,
                   1315,1329,1341,1347,1367,1387,1413,1423,1431,1441,1479,1509,
                   1527,1531,1555,1557,1573,1591,1603,1615,1627,1657,1663,1673,
                   1717,1729,1747,1759,1789,1815,1821,1825,1849,1863,1869,1877,
                   1881,1891,1917,1933,1939,1969,2011,2035,2041,2053,2071,2091,
                   2093,2119,2147,2149,2161,2171,2189,2197,2207,2217,2225,2255,
                   2257,2273,2279,2283,2293,2317,2323,2341,2345,2363,2365,2373,
                   2377,2385,2395,2419,2421,2431,2435,2447,2475,2477,2489,2503,
                   2521,2533,2551,2561,2567,2579,2581,2601,2633,2657,2669)
  polynomvect <- polynomvect[1:10]
  #see Glasserman, page 311
  initmj <- list(
    1, 
    1,
    c(1 , 1 ),
    c(1 , 3 , 7 ),
    c(1 , 1 , 5 ),
    c(1 , 3 , 1 , 1 ),
    c(1 , 1 , 3 , 7 ),
    c(1 , 3 , 3 , 9 , 9 ),
    c(1 , 3 , 7 , 13 , 3 ),
    c(1 , 1 , 5 , 11 , 27  ))
 
  #maximum number of components for the binary representation
  bitnb <- ceiling(log(n)/log(2)) 
  
  #compute direction numbers V
  listV <- sobol.V(initmj, polynomvect, bitnb=bitnb, echo=FALSE)
  
  #compute reals
  x <- matrix(nrow=n, ncol=d)
  for(i in 1:d)
  for(j in 1:n)
  {
    #current integer by rec (modulo 2)
    y <- (listV[[i]] %*% int2bit(j)[1:bitnb]) %% 2
    x[j,i] <- bit2unitreal(y)
  }
  x
}


