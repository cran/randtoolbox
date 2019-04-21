/** 
 * @file  randtoolbox.h
 * @brief header file for all RNGs
 *
 * @author Christophe Dutang
 * @author Petr Savicky 
 *
 * Copyright (C) 2019, Christophe Dutang, 
 * Petr Savicky, Academy of Sciences of the Czech Republic. 
 * Christophe Dutang, see http://dutangc.free.fr 
 * All rights reserved.
 *
 * The new BSD License is applied to this software.
 * Copyright (c) 2019 Christophe Dutang, Petr Savicky. 
 * All rights reserved.
 *
 *      Redistribution and use in source and binary forms, with or without
 *      modification, are permitted provided that the following conditions are
 *      met:
 *      
 *          - Redistributions of source code must retain the above copyright
 *          notice, this list of conditions and the following disclaimer.
 *          - Redistributions in binary form must reproduce the above
 *          copyright notice, this list of conditions and the following
 *          disclaimer in the documentation and/or other materials provided
 *          with the distribution.
 *          - Neither the name of the Academy of Sciences of the Czech Republic
 *          nor the names of its contributors may be used to endorse or promote 
 *          products derived from this software without specific prior written
 *          permission.
 *     
 *      THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 *      "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 *      LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 *      A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 *      OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 *      SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 *      LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 *      DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 *      THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 *      (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 *      OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *  
 */
/*****************************************************************************
 *  Random number generators algorithms
 *  
 *			header file
 *
 */

//R header files
#include <R.h>
#include <Rinternals.h>
#include <Rdefines.h>
#include <Rmath.h>
#include <R_ext/Error.h>

#include "config.h"
#include "locale.h"

//Halton
#include "LowDiscrepancy-halton.h"

//Sobol
#include "LowDiscrepancy-sobol.h"

//congruRand
#include "congruRand.h"

//SFMT
#include "SFMT.h"

//Knuth TAOCP
#include "knuthTAOCP2002.h"

//WELL RNGs
#include "wellrng.h"

//the first 100 000 prime numbers taken from http://primes.utm.edu/ is included 
//in randtoolbox.c by #include "primes.h"





//time header files
#if HAVE_TIME_H
# include <time.h>
#endif

#if HAVE_SYS_TIME_H
# include <sys/time.h>
#endif

#if HAVE_WINDOWS_H
# include <windows.h>
#endif

#if defined(HAVE_SSE2)
# include <emmintrin.h>
#endif


/* Functions accessed from .Call() */
SEXP doTorus(SEXP n, SEXP d, SEXP p, SEXP offset, SEXP ismixed, SEXP timedseed, SEXP mersexpo);
SEXP doHalton(SEXP n, SEXP d, SEXP offset, SEXP ismixed, SEXP timedseed, SEXP mersexpo);
SEXP doSobol(SEXP n, SEXP d, SEXP offset, SEXP ismixed, SEXP timedseed, SEXP mersexpo);
SEXP doSetSeed(SEXP s);
SEXP doCongruRand(SEXP n, SEXP d, SEXP modulus, SEXP multiplier, SEXP increment, SEXP echo);
SEXP doSFMersenneTwister(SEXP n, SEXP d, SEXP mersexpo, SEXP paramset);
SEXP doWELL(SEXP n, SEXP d, SEXP order, SEXP tempering, SEXP version);
SEXP doKnuthTAOCP(SEXP n, SEXP d);

/* utility functions */
void torus(double *u, int nb, int dim, int *prime, int offset, int ismixed, int usetime, int mexp);
void halton_c(double *u, int nb, int dim, int offset, int ismixed, int usetime, int mexp);
void sobol_c(double *u, int nb, int dim, int offset, int ismixed, int usetime, int mexp);
void congruRand(double *u, int nb, int dim, uint64_t mod, uint64_t mult, uint64_t incr, uint64_t mask, int show);
void SFmersennetwister(double *u, int nb, int dim, int mexp, int usepset);
void knuthTAOCP(double *u, int nb, int dim);

void setSeed(long s);
void randSeedByArray(int length);
void randSeed();

void reconstruct_primes();

/* Functions accessed from .C() */
void get_primes(int *n, int *pri);

