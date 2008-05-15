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


gap.test <- function(u, lower = 0, upper = 1/2, echo = TRUE)
{
    
        # compute gaps such as g_i = 1 if u_i > max or u_i < min, 0 otherwise 
        gap <-   ( ! ( ( u <= upper ) & ( u >= lower ) ) ) * 1 
        n <- length( u )
        p <- upper - lower
        
        #find index of zeros 
        indexzero <- ( gap == 1 ) * 1:n
        indexzero <- indexzero[ indexzero != 0 ]
        indexzero <- c(0, indexzero, n+1)
        lindzero <- length( indexzero )
        
        #compute sizes of zero lengths
        lengthsize <- indexzero[2:lindzero] - indexzero[2:lindzero-1] -1
        lengthsize <- lengthsize[lengthsize != 0]
        maxlen <- max( lengthsize )
        maxlen <- max( maxlen, ceiling( ( log( 10^(-3) ) - log( p ) ) / log( 1 - p ) ) )


        #compute observed and theoretical frequencies
        obsnum <- sapply( 1:maxlen, function(t) sum( lengthsize == t ) )
        expnum <- (1-p)^2*p^( 1:maxlen ) * n

        #compute chisquare statistic
        residu <-  (obsnum - expnum) / sqrt(expnum)
        stat <- sum( residu^2 )
        pvalue <- pchisq( stat, maxlen - 1, lower.tail = FALSE)
        
        if( echo )
        {
            cat("\n\t\t\t Gap test\n")
            cat("\nchisq stat = ", stat, ", df = ",maxlen-1, ", p-value = ", pvalue, "\n", sep="")
            cat("\n\t\t (sample size : ",length(u),")\n\n", sep="")
            cat("length\tobserved freq\t\ttheoretical freq\n")
            for(i in 1:maxlen)
                cat(i,"\t\t\t", obsnum[i],"\t\t\t", expnum[i],"\n")
        }
        
        res <- list( statistic = stat, parameter = maxlen-1, 
                                    p.value = pvalue, observed = obsnum, 
                                    expected = expnum, residuals = residu ) 
        return( invisible( res ) )
}


freq.test <- function(u, seq = 0:15, echo = TRUE)
{
        #compute integers such as min(seq) <= integernum[i] < max(seq)
        integernum <- floor( u * ( max( seq ) + 1 ) + min( seq ) )
    
        # observed numbers equal to seq[i]
        obsnum <- sapply( seq, function(x) sum( integernum == x ) )
    
        # expected number equal to seq[i]
        expnum <- length( u ) / length( seq )    
    
        #compute chisquare statistic
        residu <-  (obsnum - expnum) / sqrt(expnum)
        stat <- sum( residu^2 )
        pvalue <- pchisq( stat, length( seq ) - 1, lower.tail = FALSE)
    
        if( echo )
        {
            cat("\n\t\t\t Frequency test\n")
            cat("\nchisq stat = ", stat, ", df = ",length(seq)-1, ", p-value = ", pvalue, "\n", sep="")
            cat("\n\t\t (sample size : ",length(u),")\n\n", sep="")
            cat("\tobserved number\t",obsnum,"\n")
            cat("\texpected number\t",expnum,"\n")    
        } 
    
        res <- list( statistic = stat, parameter = length( seq ) -1, 
                    p.value = pvalue, observed = obsnum, 
                    expected = expnum, residuals =residu ) 
        return( invisible( res ) )
}

#taille paire de l echantillon
serial.test <- function(u , d = 8, echo = TRUE)
{
        #compute pairs in {0, ..., d-1}
        pair <- matrix( floor( u * d ), length( u ) / 2, 2)

        #compute u_i * d + u_i+1 in {0, ..., d^2-1}
        poly <- pair[ ,1] * d + pair[ ,2]

        #compute numbers
        obsnum <- sapply( 0 : ( d^2 - 1 ), function(x) sum( poly == x ) )
        expnum <- length( u ) / ( 2 * d^2 )    
    
        #compute chisquare statistic
        residu <-  (obsnum - expnum) / sqrt(expnum) 
        stat <- sum( residu^2 )
        pvalue <- pchisq( stat, d^2 - 1, lower.tail = FALSE)
        
        if( echo )
        {
            cat("\n\t\t\t Serial test\n")
            cat("\nchisq stat = ", stat, ", df = ",d^2-1, ", p-value = ", pvalue, "\n", sep="")
            cat("\n\t\t (sample size : ",length(u),")\n\n", sep="")
            cat("\tobserved number\t",obsnum,"\n")
            cat("\texpected number\t",expnum,"\n")    
        } 
        
        res <- list( statistic = stat, parameter = d^2 -1, 
                    p.value = pvalue, observed = obsnum, 
                    expected = expnum, residuals = residu) 
        return( invisible( res ) )
}
    

#poker.test needs to be update!
poker.test <- function(u , d = 5, echo = TRUE)
{
    
        cat("\nwarning poker.test is not fully implemented\n\n")
        nbl <- length( u ) / d
        #compute "d-hands" in {0, ..., d-1}
        hands <- matrix( as.integer( floor( u * d ) ), nbl, d) 
    
   
    
        #compute observed hands
        obshands <- .Call("doTest", hands, nbl, d)
        
        #compute expected hands
        fact <- vector("numeric", 2*d)
        fact[1] <- 1
        for(i in 2 : (2 * d - 1) )
            fact[i] <- fact[i-1] * (i-1)
        #fact contains 0!,1!, 2! ... (2d)!
        j <- 1 : d
    exphands <- fact[d+1] / fact[j+1] / fact[d-j+1] 
    exphands <- exphands * fact[d-1+1] / ( d^(j-1) * fact[d-j+1+1] )
    exphands <- exphands * (j/d)^(d-j) * nbl
#        lambda <- fact[d+r-1] / fact[r] / fact[d-1]
        #combinaison with repetition Lambda_d^r = C_{d+r-1}^r 
        #       = (d+r-1)! / r! / (d-1)! for r=1..d
#    exphands <-   lambda / d^r * nbl  #* nbl * (1/r)^r * (1-1/r)^(d-r)
#   exphands <- (d-r+1) * (1/d) ^ (d-r+1) * nbl
    
    x <- as.integer(1:d-1)
    y <- as.integer(rep(x,d))
    if(d==4)
    {
        z <- c( as.integer(rep(0,d)) , as.integer(rep(1,d)) , as.integer(rep(2,d)), as.integer(rep(3,d)))
        theohands<- rbind(cbind(as.integer(0),as.integer(0),z,y), cbind(as.integer(0),as.integer(1),z,y), cbind(as.integer(0),as.integer(2),z,y), cbind(as.integer(0),as.integer(3),z,y)) 
    }
    if(d == 5)
    {
        z <- c( as.integer(rep(0,d)) , as.integer(rep(1,d)) , as.integer(rep(2,d)), as.integer(rep(3,d)), as.integer(rep(4,d)))
        theohands<- rbind(cbind(as.integer(0),as.integer(0),z,y), cbind(as.integer(0),as.integer(1),z,y), cbind(as.integer(0),as.integer(2),z,y), cbind(as.integer(0),as.integer(3),z,y), cbind(as.integer(0),as.integer(4),z,y)) 
        theohands <- rbind( cbind(as.integer(0), theohands), cbind(as.integer(1), theohands), cbind(as.integer(2), theohands), cbind(as.integer(3), theohands), cbind(as.integer(4), theohands))
    }
    
    
#print(theohands)
       theo <- .Call("doTest", theohands, dim(theohands)[1], dim(theohands)[2])
        theo <- theo / d^(d-1) * nbl
       
#    print(hands)
#        print(obshands)
#        cat("sum", sum(obshands), "\n")
#    print(exphands)
#        cat("sum ", sum(exphands), "\n")
#       print(theo)
#    cat("sum ", sum(theo), "\n")
#        print(lambda)
#        print(u)
#        
#        print(res)
    
    stat <- sum( (obshands - exphands) ^ 2 / exphands )
    pvalue <- pchisq( stat, d^d - 1, lower.tail = FALSE)
    
    if( echo )
    {
        cat("\n\t\t\t Poker test\n")
        cat("\nchisq stat = ", stat, ", df = ",d^d-1, ", p-value = ", pvalue, "\n", sep="")
        cat("\n\t\t (sample size : ",length(u),")\n\n", sep="")
        cat("\tobserved number\t",obshands,"\n")
        cat("\texpected number\t",exphands,"\n")    
    } 
    
        
    res <- list( statistic = stat, parameter = d^d-1, 
                p.value = pvalue, observed = obshands, 
                expected = exphands, residuals = (obshands - exphands) ^ 2 / exphands ) 
    return( invisible( res ) )
}

mars.test <- function(u, d = 3, echo = TRUE)
{
    if(d != 3)
        stop("not yet implemented")
    # store u in a matrix
    u <- matrix(u, length(u) / d, d)

        
    # compute observed numbers
    obsnum <- vector("numeric", length=factorial(d))
        
    obsnum[1] <- sum(u[,1] < u[,2] & u[,2] <u[,3])
    obsnum[2] <- sum(u[,1] < u[,3] & u[,3] <u[,2])
    obsnum[3] <- sum(u[,2] < u[,1] & u[,1] <u[,3])
    obsnum[4] <- sum(u[,2] < u[,3] & u[,3] <u[,1])
    obsnum[5] <- sum(u[,3] < u[,2] & u[,2] <u[,1])
    obsnum[6] <- sum(u[,3] < u[,1] & u[,1] <u[,2])
        
    # compute expected numbers
    expnum <- length(u[ ,1]) / factorial(d)
    
#compute chisquare statistic
    residu <-  (obsnum - expnum) / sqrt(expnum) 
    stat <- sum( residu^2 )
    pvalue <- pchisq( stat, d^2 - 1, lower.tail = FALSE)
    
    if( echo )
    {
        cat("\n\t\t\t Marsiglia test\n")
        cat("\nchisq stat = ", stat, ", df = ",d^2-1, ", p-value = ", pvalue, "\n", sep="")
        cat("\n\t\t (sample size : ",length(u),")\n\n", sep="")
        cat("\tobserved number\t",obsnum,"\n")
        cat("\texpected number\t",expnum,"\n")    
    } 
    
    res <- list( statistic = stat, parameter = d^2 -1, 
                p.value = pvalue, observed = obsnum, 
                expected = expnum, residuals = residu) 
    return( invisible( res ) )
}
