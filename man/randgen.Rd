\name{randtoolbox}
\alias{randtoolbox}
\alias{torus}
\alias{congruRand}
\alias{SFMT}
\alias{setTorusSeed}
\title{Toolbox for pseudo and quasi random number generation}
\description{
	General linear congruential generators such as Park Miller sequence 
	and SF-Mersenne Twister algorithm; and a quasi random generator 
	(pseudo random generators) and the Torus algorithm (quasi random
	generation).
}
\usage{
torus(n, dim = 1, prime, mixed = FALSE, usetime = TRUE)
congruRand(n, dim = 1, mod = 2^31-1, mult = 16807, incr = 0, echo)
SFMT(n, dim = 1, sse2=TRUE)
setTorusSeed(seed)
}
\arguments{
  \item{n}{number of observations. If length(n) > 1, 
  		  the length is taken to be the number required.}
  \item{dim}{dimension of observations (must be <=1000, default 1).}
  \item{prime}{a single prime number or a vector of prime numbers to be used
  		 in the Torus sequence. (optional argument).}
  \item{mixed}{a logical to use the mixed Torus algorithm, default FALSE.}
  \item{usetime}{a logical to use the machine time to start the Torus sequence, 
  		   default TRUE. if FALSE, the Torus sequence start from the first term.}
  \item{seed}{a single value, interpreted as a positive integer for the seed.}
  \item{mod}{an integer defining the modulus of the linear congruential generator.}
  \item{mult}{an integer defining the multiplier of the linear congruential generator.}
  \item{incr}{an integer defining the increment of the linear congruential generator.}
  \item{echo}{a logical to plot the seed while computing the sequence.}
  \item{sse2}{a logical for Intel SSE2.}
}
\details{
	The \eqn{k}th term of the Torus algorithm in d dimension is given by
	    	\deqn{u_k = \left(frac(k \sqrt{p_1}), ..., frac(k \sqrt{p_d}) \right)}{%
			    u_k = (frac(k sqrt(p_1)), ..., frac(k sqrt(p_d)) )}
	where \eqn{p_i} denotes the ith prime number, \eqn{frac} the fractional part
	(i.e. \eqn{frac(x) = x-floor(x)}). The Torus sequence starts from \eqn{k=1} if
	\code{usetime = FALSE} otherwise it uses the machine time
	 \eqn{k= [ 2^16 * second ] xor [ milisecond ]}.	
	
	The \eqn{k}th term of a linear congruential generator is defined as
	   \deqn{u_k = \frac{ ( a * u_{k-1} + c ) mod m }{m}}{%
			[ ( a * u_{k-1} + c ) mod m ] / m}
	where \eqn{a} denotes the multiplier, \eqn{c} the increment and \eqn{m} 
	the modulus, with the constraint \eqn{0 <= a < m } and \eqn{0 <= c < m }.
	The default setting is the Park Miller sequence with \eqn{a=16807}, 
	\eqn{m=2^31-1} and \eqn{c=0}.

	SFMT function uses the SIMD-oriented Fast Mersenne Twister (SFMT) algorithm
	(cf. \url{http://www.math.sci.hiroshima-u.ac.jp/~m-mat/MT/SFMT/index.html}).

	All the C code for SFMT algorithm used in this package is the code of M. Matsumoto and M. Saito (cf. \url{http://www.math.sci.hiroshima-u.ac.jp/~m-mat/MT/emt.html}).


}
\value{
  \code{torus}, \code{SFMT} and \code{congruRand} generates random variables in ]0,1[, ]0,1[ and [0,1[ respectively. It returns a \eqn{n}x\eqn{dim} matrix, when \code{dim}>1 otherwise a vector of length \code{n}.

  \code{setTorusSeed} set the seed of the \code{torus} package 
(i.e. both for the \code{torus}, \code{SFMT} and \code{congruRand} functions).
}
\references{
Planchet F., Jacquemin J. (2003), \emph{L'utilisation de methodes de 
simulation en assurance}. Bulletin Francais d'Actuariat, vol. 6, 11, 3-69. (available online)

Park S. K., Miller K. W. (1988), \emph{Random number generators: good
ones are hard to find}. Association for Computing Machinery, vol. 31, 10, 1192-2001. 

Matsumoto M., Saito M. (2008), \emph{SIMD-oriented Fast Mersenne Twister: a 128-bit Pseudorandom Number Generator}. (available online)

Wikipedia (2008), \emph{a linear congruential generator}.
}
\seealso{
    \code{\link{.Random.seed}}.
}
\author{
 Christophe Dutang.
}
\examples{
# (1) the Torus algorithm
#
torus(100)

# example of setting the seed
setTorusSeed(1)
torus(5)
setTorusSeed(6)
torus(5)
#the same
setTorusSeed(1)
torus(10)

#no use of the machine time
torus(10, use=FALSE)

#Kolmogorov Smirnov test
#KS statistic should be around 0.0019
ks.test(torus(1000), punif) 
	
#KS statistic should be around 0.0003
ks.test(torus(10000), punif) 

#the mixed Torus sequence
torus(10, mix=TRUE)
par(mfrow = c(1,2))
acf(torus(10^6))
acf(torus(10^6, mix=TRUE))

# (2) the Park Miller sequence
#
# Park Miller sequence, i.e. mod = 2^31-1, mult = 16807, incr=0
# the first 10 seeds used in Park Miller sequence
# 16807          1
# 282475249          2
# 1622650073          3
# 984943658          4
# 1144108930          5
# 470211272          6
# 101027544          7
# 1457850878          8
# 1458777923          9
# 2007237709         10
setTorusSeed(1)
congruRand(10, echo=TRUE)

# the 9998+ th terms 
# 925166085       9998
# 1484786315       9999
# 1043618065      10000
# 1589873406      10001
# 2010798668      10002
setTorusSeed(1614852353) #seed for the 9997th term
congruRand(5, echo=TRUE)

# (3) the SF Mersenne Twister algorithm
SFMT(1000)

#Kolmogorov Smirnov test
#KS statistic should be around 0.037
ks.test(SFMT(1000), punif) 
	
#KS statistic should be around 0.0076
ks.test(SFMT(10000), punif) 



# (4) computation times on my macbook
#
\dontrun{
# algorithm			time in seconds for n=10^6
# torus algo					0.118 
# mixed torus algo 	       			0.177 
# classical mersenne twister  		0.139 
# SF mersenne twister  	       		0.084 
# park miller  		      			0.174 
n <- 1e+06
mean( rep( system.time( torus(n), gcFirst=TRUE)[3], n) )
mean( rep( system.time( torus(n, mixed=TRUE), gcFirst=T)[3], n) )
mean( rep( system.time( runif(n), gcFirst=TRUE)[3], n) )
mean( rep( system.time( SFMT(n), gcFirst=TRUE)[3], n) )
mean( rep( system.time( congruRand(n), gcFirst=TRUE)[3], n) )
	}

}
\keyword{distribution}
