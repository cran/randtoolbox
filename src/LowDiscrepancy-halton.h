/*
* @file LowDiscrepancy-halton.h
* @brief Halton sequence
*
* @author Christophe Dutang
*
* Copyright (C) 2022, Christophe Dutang
* # remove a warning: this old-style function definition is not preceded by a prototype
* # raised by 
* > clang -DNDEBUG   -isystem /usr/local/clang15/include \
* -I"/Library/Frameworks/R.framework/Headers"  -fpic  -O3 -Wall -pedantic -Wstrict-prototypes \
* -c LowDiscrepancy-halton.c -o LowDiscrepancy-halton.o
* 
* Copyright (C) Aug. 2016, Christophe Dutang, C translation of a Fortran code
*
* The new BSD License is applied to this software.
* Christophe Dutang, see http://dutangc.free.fr
*
*      Redistribution and use in source and binary forms, with or without
*      modification, are permitted provided that the followingConditions are
*      met:
*
*          - Redistributions of sourceCode must retain the aboveCopyright
*          notice, this list ofConditions and the following disclaimer.
*          - Redistributions in binary form must reproduce the above
*         Copyright notice, this list ofConditions and the following
*          disclaimer in the documentation and/or other materials provided
*          with the distribution.
*          - Neither the name of the ETH Zurich nor the names of its Contributors
*          may be used to endorse or promote products derived from this software
*          without specific prior written permission.
*
*      THIS SOFTWARE IS PROVIDED BY THECOPYRIGHT HOLDERS ANDCONTRIBUTORS
*      "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
*      LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
*      A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THECOPYRIGHT
*      OWNER ORCONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
*      SPECIAL, EXEMPLARY, ORCONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
*      LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
*      DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVERCAUSED AND ON ANY
*      THEORY OF LIABILITY, WHETHER INCONTRACT, STRICT LIABILITY, OR TORT
*      (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
*      OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*--------------------------------------------------------------------------
*/


//R header files
#include <R.h>
#include <Rinternals.h>
#include <Rmath.h>


/* utility functions to be called in randtoolbox.c */

double HALTONREC(int DIMEN, unsigned long long OFFSET);
void INITHALTON(int DIMEN, double *QUASI); // not used
void reconstruct_prime(void); //same as void reconstruct_primes()
