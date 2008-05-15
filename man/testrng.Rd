\name{randtoolbox.test}
\alias{randtoolbox.test}
\alias{gap.test}
\alias{freq.test}
\alias{serial.test}
\alias{poker.test}
\alias{mars.test}
\title{Tests for random number generation}
\description{
  The Gap test, the Frequency test, the Serial test, the Poker test and the Marsaglia test.
}
\usage{
gap.test(u, lower = 0, upper = 1/2, echo = TRUE)
freq.test(u, seq = 0:15, echo = TRUE)
serial.test(u , d = 8, echo = TRUE)
poker.test(u , d = 5, echo = TRUE)
mars.test(u, d = 3, echo = TRUE)
}
\arguments{
  \item{u}{sample of random numbers in ]0,1[.}
  \item{lower}{numeric for the lower bound, default \code{0}.}
  \item{upper}{numeric for the upper bound, default \code{1/2}.}
  \item{echo}{logical to plot detailed results, default \code{TRUE}}
  \item{seq}{a vector of contiguous integers, default \code{0:15}.}
  \item{d}{a numeric for the dimension, see details.}
}
\details{
	In all the tests, we consider a vector \code{u}, realisation of i.i.d. uniform random
	variables \eqn{U_1, \dots, U_n}{U1... Un}.

	The gap test works on the 'gap' variables defined as
	\deqn{ G_ i = 
	       	\left\{  
		\begin{array}{cl}
	       	 1 & \textrm{if} lower \leq U_i \leq upper\\
		 0 & \textrm{otherwiser}\\
		 \end{array}
		 \right.
		}{%
		1 if lower <= Ui <= upper, 0 otherwise.
		}
	Let \eqn{p} the probability that \eqn{G_i}{Gi} equals to one.
	Then we compute the length of zero gaps and denote by \eqn{n_j}{nj} the number
	of zero gaps of length \eqn{j}. The chi-squared statistic is given by
	\deqn{ S = \sum_{j=1}^m \frac{(n_j - n p_j)^2}{n p_j},
		}{%
		S =  \sum_{j=0}^m (n_j - n p_j)^2/[n p_j],
		}
	where \eqn{p_j}{pj} stands for the probability the length of zero gaps equals 
	to \eqn{j} (\eqn{ (1-p)^2 p^j
	   	   }{%
		   (1-p)^2 p^j
		   }) and \eqn{m} the max number of lengths (at least
	\eqn{\lceil \frac{ \log( 10^(-3) ) - \log( p ) }{ \log( 1 - p )} \rceil
		}{%
		ceiling( ( log( 10^(-3) ) - log( p ) ) / log( 1 - p )} ).

	The frequency test works on a serie \code{seq} of ordered contiguous integers 
	(\eqn{s_1,\dots,s_d}{s_1, ...,s_d}), where \eqn{s_j\in  Z\!\!Z}{s_j in Z}. From the
	sample \code{u}, we compute observed integers as
	\deqn{d_i = \lfloor u_i * ( s_d + 1 ) + s_1 \rfloor,
		  }{%
		  d_i = floor( u_i * ( s_d + 1 ) + s_1 ),} 
	(i.e. \eqn{d_i} are uniformely distributed in
	\eqn{\{s_1,\dots,s_d\}}{{s_1, ...,s_d}}). The expected number of integers equals to 
	\eqn{j} is \eqn{m= \frac{1}{s_d - s_1+1}\times n}{m=n/(s_d - s_1+1)}. Finally, the
	chi-squared statistic is 
 	\deqn{ S = \sum_{j=1}^d \frac{(card(d_i=s_j) - m)^2}{m}.
		}{%
		S =  \sum_{j=1}^d (card(d_i=s_j) - m)^2/m .
		}
	
	The serial test computes a serie of integer pairs \eqn{(p_i,p_{i+1})} 
	from the sample \code{u} with \eqn{p_i = \lfloor u_i d\rfloor}{
	p_i = floor(u_i d)} (\code{u} must have an even length). 
	Let \eqn{n_j}{n_j} be the number of pairs such that
	\eqn{j=p_i \times d + p_{i+1}}{j=p_i  d + p_{i+1}}. If \code{d=2}, we count
	the number of pairs equals to \eqn{00, 01, 10} and \eqn{11}. Since 
	all the combination of two elements in \eqn{\{0, \dots, d-1\}}{\{0, ..., d-1\}}
	are equiprobable, the chi-squared statistic is
	\deqn{ S = \sum_{j=0}^{d-1} \frac{n_j - n/(2 d^2))^2}{n/(2 d^2)}.
		}{%
		S =  \sum_{j=1}^d [n_j - n/(2 d^2)]^2/[n/(2 d^2)].
		}
	
	The poker test computes a serie of 'hands' in \eqn{\{0, \dots, d-1\}}{\{0, ..., d-1\}}
	from the sample \eqn{h_i = \lfloor u_i d\rfloor}{
	h_i = floor(u_i d)} (\code{u} must have a length dividable by \code{d}). Let
	\eqn{n_j} be the number of 'hands' with (exactly) \eqn{j} different cards. The
	probability is \deqn{ p_j = \frac{C_{d}^{j} * (d-1)! }{ (d^(j-1)*(d-j+1)!} 
	* (\frac{j}{d})^(d-j),  }{%
	p_j = C_d^j * (d-1)! / (d^(j-1)*(d-j+1)!) * (j/d)^(d-j), }
	where \eqn{C_d^j} denotes \eqn{\frac{d!}{j!(d-j)!}}{d!/[j!(d-j)!]}. Finally the 
	chi-squared statistic is 
	\deqn{ S = \sum_{j=0}^{d-1} \frac{n_j - np_j/d)^2}{np_j/d}.
		}{%
		S =  \sum_{j=1}^d [n_j - np_j/d ]^2/[np_j/d].
		}

	The Marsaglia test works on a sequence of triplets \eqn{x,y,z} of uniform i.i.d. 
	random variables. The triplet is build from the vector \eqn{u}. The nomber of 
	permutation among the components of a triplet is \eqn{3!=6}, i.e. \eqn{x<y<z},
	\eqn{x<z<y}, \eqn{y<x<z}, \eqn{y<z<x}, \eqn{z<x<y} and \eqn{z<y<x}. The
	Marsaglia test computes the empirical of the different permutations as well
	as the theoretical one \eqn{n/6} where \eqn{n} is the number of triplets.
	Finally the chi-squared statistic is 
	\deqn{ S = \sum_{j=0}^{6} \frac{n_j - n/6)^2}{n/6}.
		}{%
		S =  \sum_{j=1}^6 [n_j - n/6 ]^2/[n/6].
		}
}
\value{
  a list with the following components :

\code{statistic}	 the value of the chi-squared statistic.

\code{p.value}	 	 the p-value of the test.

\code{observed}	 the observed counts.

\code{expected}	 the expected counts under the null hypothesis.

\code{residuals}	 the Pearson residuals, (observed - expected) / sqrt(expected).

}
\references{
Planchet F., Jacquemin J. (2003), \emph{L'utilisation de methodes de 
simulation en assurance}. Bulletin Francais d'Actuariat, vol. 6, 11, 3-69. (available online)

}
\seealso{
    \code{\link{ks.test}} for the Kolmogorov Smirnov test and \code{\link{acf}} for
    the autocorrelation function.
}
\author{
 Christophe Dutang.
}
\examples{
# (1) the gap test
#
gap.test(runif(1000))
print( gap.test( runif(1000000), echo=FALSE ) )

# (2) the frequency test
#
freq.test(runif(1000))
print( freq.test( runif(1000000), echo=FALSE) )

# (3) the serial test
#
serial.test(runif(1000))
print( serial.test( runif(1000000), d=2, e=FALSE) )

# (4) the poker test
#

#hands of 5 'cards'
poker.test(runif(50000))
#hands of 4 'cards'
poker.test(runif(40000), 4)

# (5) the Marsaglia test
#

# mersenne twister
mars.test(runif(6000))
# torus
mars.test(torus(6000))
}
\keyword{distribution}
