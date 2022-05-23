/**
* @file LowDiscrepancy-halton.c
* @brief Halton sequence
*
* @author Christophe Dutang
*
*
* Copyright (C) Aug. 2016, Christophe Dutang, C translation of a previous code
*
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
*
*--------------------------------------------------------------------------
*/

#include "LowDiscrepancy-halton.h"

/*********************************/
/*       constants               */


//the first 100 000 prime numbers computed from their differences stored in primes.h
static int primeNumber[100000];


//old translation of Fortran code

void INITHALTON(int DIMEN, double *QUASI)
{
    //in Fortran code BASE contains prime numbers
    int ITER, DIGIT;
    double HALF;
    int OFFSET = 0;
    
    int NB;
    
    //create the first quasi random number for all dimensions
    for(NB = 0; NB < DIMEN; NB++)
    {
        ITER = OFFSET;
        QUASI[NB] = 0.0;
        HALF = 1.0 / primeNumber[NB];
        do
        {
            DIGIT = ITER % primeNumber[NB];
            QUASI[NB] = QUASI[NB] + DIGIT * HALF;
            ITER = ( ITER - DIGIT ) / primeNumber[NB];
            HALF = HALF / primeNumber[NB];
        } while (ITER != 0);
    }
    OFFSET = OFFSET + 1;
    
}

//compute the radical inverse function of integer OFFSET with base primeNumber[DIMEN]
double HALTONREC(int DIMEN, unsigned long long OFFSET)
{
    //in Fortran code BASE contains prime numbers
    unsigned long long ITER, DIGIT;
    double HALF;
    double QUASI;
    
    ITER = OFFSET;
    QUASI = 0.0;
    HALF = 1.0 / primeNumber[DIMEN];
    if (primeNumber[2] == 1)
      reconstruct_prime();
    do
    {
        DIGIT = ITER % primeNumber[DIMEN];
        QUASI = QUASI + DIGIT * HALF;
        ITER = ( ITER - DIGIT ) / primeNumber[DIMEN];
        HALF = HALF / primeNumber[DIMEN];
    } while (ITER != 0);
    return QUASI;
}

#include "primes.h"
void reconstruct_prime()
{
  int i;
  if (primeNumber[2] == 1)
    for (i = 2; i < 100000; i++)
      primeNumber[i] = primeNumber[i-1] + 2*primeNumber[i];
}


