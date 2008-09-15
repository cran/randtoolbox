\name{randtoolbox}
\alias{randtoolbox}
\alias{torus}
\alias{congruRand}
\alias{SFMT}
\alias{WELL}
\alias{knuthTAOCP}
\alias{setSeed}
\title{Toolbox for pseudo and quasi random number generation}
\description{
	General linear congruential generators such as Park Miller sequence,
	generalized feedback shift register such as SF-Mersenne Twister algorithm
	and WELL generator; and a quasi random generator 
	(pseudo random generators) and the Torus algorithm (quasi random
	generation).
}
\usage{
torus(n, dim = 1, prime, mixed = FALSE, usetime = FALSE)
congruRand(n, dim = 1, mod = 2^31-1, mult = 16807, incr = 0, echo)
SFMT(n, dim = 1, mexp = 19937, usepset = TRUE, withtorus = FALSE, usetime = FALSE)
WELL(n, dim = 1, order = 512, temper = FALSE)
knuthTAOCP(n, dim = 1)
setSeed(seed)
}
\arguments{
  \item{n}{number of observations. If length(n) > 1, 
  		  the length is taken to be the number required.}
  \item{dim}{dimension of observations (must be <=100 000, default 1).}
  \item{prime}{a single prime number or a vector of prime numbers to be used
  		 in the Torus sequence. (optional argument).}
  \item{mixed}{a logical to use the mixed Torus algorithm, default FALSE.}
  \item{usetime}{a logical to use the machine time to start the Torus sequence, 
  		   default TRUE. if FALSE, the Torus sequence start from the first term.}
  \item{seed}{a single value, interpreted as a positive integer for the seed. e.g.
  		append your day, your month and your year of birth.}
  \item{mod}{an integer defining the modulus of the linear congruential generator.}
  \item{mult}{an integer defining the multiplier of the linear congruential generator.}
  \item{incr}{an integer defining the increment of the linear congruential generator.}
  \item{echo}{a logical to plot the seed while computing the sequence.}
  \item{mexp}{an integer for the mersenne exponent of SFMT algorithm. see details}
  \item{withtorus}{a numeric in ]0,1] defining the proportion of the torus
                    sequence appended to the SFMT sequence; 
                    or a logical equals to FALSE (default).}
  \item{usepset}{a logical to use a set of 12 parameters set for SFMT. default TRUE.}
  \item{order}{a positive integer for the order of the characteristic polynomial. see details}
  \item{temper}{a logical if you want to do a tempering stage. see details}
}
\details{

The currently available generator are given below.
\describe{
    \item{\bold{Torus algorithm:}}{
	The \eqn{k}th term of the Torus algorithm in d dimension is given by
	    	\deqn{u_k = \left(frac(k \sqrt{p_1}), ..., frac(k \sqrt{p_d}) \right)}{%
			    u_k = (frac(k sqrt(p_1)), ..., frac(k sqrt(p_d)) )}
	where \eqn{p_i} denotes the ith prime number, \eqn{frac} the fractional part
	(i.e. \eqn{frac(x) = x-floor(x)}). We use the 100 000 first prime numbers
	from \url{http://primes.utm.edu/}.
	The Torus sequence starts from \eqn{k=1} if
	\code{usetime = FALSE} otherwise it uses the machine time
	 \eqn{k= [ 2^16 * second ] xor [ microsecond ]} when microseconds
	are available.}

    \item{\bold{Linear congruential generators:}}{	
	The \eqn{k}th term of a linear congruential generator is defined as
	   \deqn{u_k = \frac{ ( a * u_{k-1} + c ) \textrm{~mod~} m }{m}}{%
			[ ( a * u_{k-1} + c ) mod m ] / m}
	where \eqn{a} denotes the multiplier, \eqn{c} the increment and \eqn{m} 
	the modulus, with the constraint \eqn{0 <= a < m } and \eqn{0 <= c < m }.
	The default setting is the Park Miller sequence with \eqn{a=16807}, 
	\eqn{m=2^31-1} and \eqn{c=0}.}

    \item{\bold{SF Mersenne-Twister algorithm:}}{
	\code{SFMT} function implements the SIMD-oriented Fast Mersenne Twister algorithm
	(cf. \url{http://www.math.sci.hiroshima-u.ac.jp/~m-mat/MT/SFMT/index.html}).	
	The SFMT generator has a period of length \eqn{2^m-1} where \eqn{m} is a
	Mersenne exponent. In the function \code{SFMT}, \eqn{m} is given through
	\code{mexp} argument. By default it is 19937 like the ''old'' MT algorithm.
	The possible values for the Mersenne exponent are 607, 1279, 2281, 4253, 
	11213, 19937, 44497, 86243, 132049, 216091. 

	There are numerous parameters 
	for the SFMT algorithm (see the article for details). By default, we use
	a different set of parameters (among 32 sets) 
	at \emph{each call} of \code{SFMT} (\code{usepset=TRUE}).
	The user can use a fixed set of parameters with \code{usepset=FALSE}. Let us
	note there is for the moment just \emph{one} set of parameters for 44497, 86243, 132049, 
	216091 mersenne exponent.
	Sets of parameters can be found in appendix of the vignette. 

	The use of different parameter sets is motivated by the following 
	citation of Matsumoto and Saito on this topic :

	"\emph{Using one same pesudorandom number generator for generating multiple independent
	streams by changing the initial values may cause a problem (with
	negligibly small probability). To avoid the problem, using
	diffrent parameters for each generation is prefered. 
	See Matsumoto M. and Nishimura T. (1998) for detailed information.}"

	All the C code for SFMT algorithm used in this 
	package is the code of M. Matsumoto and M. Saito (cf. 
	\url{http://www.math.sci.hiroshima-u.ac.jp/~m-mat/MT/emt.html}), except we add
	some C code to \emph{interface} with R. Streaming SIMD Extensions 2 (SSE2) 
	operations are not yet supported.}

   \item{\bold{WELL generator:}}{
	The WELL (which stands for Well Equidistributed Long-period Linear) is in a sentence
	a generator with better equidistribution than Mersenne Twister algorithm but this
	gain of quality has to be paid by a slight higher cost of time. 
	See Panneton et al. (2006) for	details. 

	The \code{order} argument of \code{WELL}
	generator is the order of the characteristic polynomial, which is denoted by \eqn{k} in 
	Paneton F., L'Ecuyer P. and Matsumoto M. (2006). Possible values for \code{order} 	
	are 512, 1024, 19937, 44497. Furthermore a tempering stage is possible for
	the last two values through the \code{temper} argument. 
	
	All the C code for WELL generator used in this 
	package is the code of P. L'Ecuyer (cf. 
	\url{http://www.iro.umontreal.ca/~lecuyer/}), except
	some C code, we add, to \emph{interface} with R.}

   \item{\bold{Knuth TAOCP 2002 (double version):}}{
	The Knuth-TACOP-2002 is a Fibonnaci-lagged 
	generator invented by Knuth(2002), based on the
	following recurrence.
	\deqn{x_n = (x_{n-37} + x_{n-100}) \textrm{~mod~} 2^{30},}{
		x_n = (x_{n-37} + x_{n-100}) mod 2^{30},}	
	In R, there is the integer version of this generator.	

	All the C code for this generator called RAN\_ARRAY by Knuth is the code of 
	D. Knuth (cf.  \url{http://www-cs-faculty.stanford.edu/\~knuth/news02.html\#rng}) except some C code, we add, to \emph{interface} with R.}

   \item{\bold{Set the seed:}}{
	The function \code{setSeed} is similar to the function \code{set.seed} in R. It sets
	the seed to the one given by the user. Do not use a seed with too few ones in its
	binary representation. Generally, we append our day, our month and our year of birth or
	append a day, a month and a year. We recall by default with use the machine time
	to set the seed except for quasi random number generation.
	}

}%end of describe
See the vignette for details.
}
\value{
  \code{torus}, \code{SFMT}, \code{WELL} and \code{congruRand} generates random variables in ]0,1[, ]0,1[, [0,1[ and [0,1[ respectively. It returns a \eqn{n}x\eqn{dim} matrix, when \code{dim}>1 otherwise a vector of length \code{n}.

  \code{setSeed} set the seed of the \code{randtoolbox} package 
(i.e. both for the \code{torus}, \code{SFMT}, \code{WELL} and \code{congruRand} functions).
}
\references{
Knuth D. (1997), \emph{The Art of Computer Programming V2 Seminumerical Algorithms}, Third Edition, Massachusetts: Addison-Wesley.

Matsumoto M. and Nishimura T. (1998), \emph{Dynamic Creation of Pseudorandom Number Generators},
Monte Carlo and Quasi-Monte Carlo Methods, Springer, pp 56--69. (available online)

Matsumoto M., Saito M. (2008), \emph{SIMD-oriented Fast Mersenne Twister: a 128-bit Pseudorandom Number Generator}. (available online)

Paneton F., L'Ecuyer P. and Matsumoto M. (2006), \emph{Improved Long-Period Generators 
Based on Linear Recurrences Modulo 2}, ACM Transactions on Mathematical Software. (preprint
available online)

Park S. K., Miller K. W. (1988), \emph{Random number generators: good
ones are hard to find}. Association for Computing Machinery, vol. 31, 10, pp 1192-2001. (available online) 

Planchet F., Jacquemin J. (2003), \emph{L'utilisation de methodes de 
simulation en assurance}. Bulletin Francais d'Actuariat, vol. 6, 11, 3-69. (available online)


Wikipedia (2008), \emph{a linear congruential generator}.
}
\seealso{
    \code{\link{.Random.seed}} for what is done in R about random number generation. 
}
\author{
 Christophe Dutang.
}
\examples{
# (1) the Torus algorithm
#
torus(100)

# example of setting the seed
setSeed(1)
torus(5)
setSeed(6)
torus(5)
#the same
setSeed(1)
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
setSeed(1)
congruRand(10, echo=TRUE)

# the 9998+ th terms 
# 925166085       9998
# 1484786315       9999
# 1043618065      10000
# 1589873406      10001
# 2010798668      10002
setSeed(1614852353) #seed for the 9997th term
congruRand(5, echo=TRUE)

# (3) the SF Mersenne Twister algorithm
SFMT(1000)

#Kolmogorov Smirnov test
#KS statistic should be around 0.037
ks.test(SFMT(1000), punif) 
	
#KS statistic should be around 0.0076
ks.test(SFMT(10000), punif) 

#different mersenne exponent with a fixed parameter set
#
SFMT(10, mexp = 607, usepset = FALSE)
SFMT(10, mexp = 1279, usepset = FALSE)
SFMT(10, mexp = 2281, usepset = FALSE)
SFMT(10, mexp = 4253, usepset = FALSE)
SFMT(10, mexp = 11213, usepset = FALSE)
SFMT(10, mexp = 19937, usepset = FALSE)
SFMT(10, mexp = 44497, usepset = FALSE)
SFMT(10, mexp = 86243, usepset = FALSE)
SFMT(10, mexp = 132049, usepset = FALSE)
SFMT(10, mexp = 216091, usepset = FALSE)

#use different sets of parameters [default when possible]
#
for(i in 1:7) print(SFMT(1, mexp = 607))
for(i in 1:7) print(SFMT(1, mexp = 2281))
for(i in 1:7) print(SFMT(1, mexp = 4253))
for(i in 1:7) print(SFMT(1, mexp = 11213))
for(i in 1:7) print(SFMT(1, mexp = 19937))

#use a fixed set and a fixed seed
#should be the same output
setSeed(08082008)
SFMT(1, usepset = FALSE)
setSeed(08082008)
SFMT(1, usepset = FALSE)


# (4) withtorus argument
# 

# one third of outputs comes from Torus algorithm
u <- SFMT(1000, with=1/3)
# the third term of the following code is the first term of torus sequence
print(u[666:670] )

# (5) WELL generator
#

# 'basic' calls
# WELL512
WELL(10, order = 512)
# WELL1024
WELL(10, order = 1024)
# WELL19937
WELL(10, order = 19937)
# WELL44497
WELL(10, order = 44497)
# WELL19937 with tempering 
WELL(10, order = 19937, temper = TRUE)
# WELL44497 with tempering
WELL(10, order = 44497, temper = TRUE)

# tempering vs no tempering
setSeed(08082008)
WELL(10, order =19937)
setSeed(08082008)
WELL(10, order =19937, temper=TRUE)

# (6) Knuth TAOCP generator
#
knuthTAOCP(10)
knuthTAOCP(10, 2) 

# (7) computation times on my macbook, mean of 1000 runs
#

\dontrun{
# algorithm			time in seconds for n=10^6
# Torus algo					0.058 
# mixed Torus algo 	       			0.087 
# classical Mersenne Twister  			0.066 
# SF Mersenne Twister  	       			0.044 
# WELL generator				0.065
# Knuth TAOCP					0.046
# Park Miller  		      			0.174 
n <- 1e+06
mean( replicate( 1000, system.time( torus(n), gcFirst=TRUE)[3]) )
mean( replicate( 1000, system.time( torus(n, mixed=TRUE), gcFirst=T)[3]) )
mean( replicate( 1000, system.time( runif(n), gcFirst=TRUE)[3]) )
mean( replicate( 1000, system.time( SFMT(n), gcFirst=TRUE)[3]) )
mean( replicate( 1000, system.time( WELL(n), gcFirst=TRUE)[3]) )
mean( replicate( 1000, system.time( knuthTAOCP(n), gcFirst=TRUE)[3]) )
mean( replicate( 1000, system.time( congruRand(n), gcFirst=TRUE)[3]) )
	}

}
\keyword{distribution}
