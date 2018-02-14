/** 
 * @file  init.c
 * @brief init file for all RNGs
 *
 * @author Christophe Dutang
 * @author Petr Savicky 
 *
 *
 * Copyright (C) 2013, Christophe Dutang, 
 * Petr Savicky, Academy of Sciences of the Czech Republic. 
 * All rights reserved.
 *
 * The new BSD License is applied to this software.
 * Copyright (c) 2013 Christophe Dutang, Petr Savicky. 
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
 *  randtoolbox to generate pseudo and quasi random sequences
 *
 *		init file
 *  
 *	Native routines registration, see 'writing R extensions'
 *
 */

#include <Rinternals.h>
#include <R_ext/Rdynload.h>
#include "randtoolbox.h"
#include "runifInterface.h"
#include "testrng.h"

//table of registration

/* .C calls */
extern void current_generator(int *pgener);
extern void getMersenneTwister(int *init, int *res, int *state);
extern void initMersenneTwister(int *type, int *nseed, unsigned int *iseed, unsigned int *state);
extern void putMersenneTwister(int *init, int *res, int *state);
extern void put_user_unif_set_generator();
extern void set_noop();
extern void version_randtoolbox(char **s);
extern double *user_unif_rand(void);

/* .Fortran calls */
extern void F77_NAME(halton)(void *, void *, void *, void *, void *, void *, void *);
extern void F77_NAME(sobol)(void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *);

static const R_CMethodDef CEntries[] = {
    {"current_generator",           (DL_FUNC) &current_generator,           1},
    {"getMersenneTwister",          (DL_FUNC) &getMersenneTwister,          3},
    {"get_primes",                  (DL_FUNC) &get_primes,                  2},
    {"get_state_congru",            (DL_FUNC) &get_state_congru,            2},
    {"initMersenneTwister",         (DL_FUNC) &initMersenneTwister,         4},
    {"putMersenneTwister",          (DL_FUNC) &putMersenneTwister,          3},
    {"put_state_congru",            (DL_FUNC) &put_state_congru,            3},
    {"put_user_unif_set_generator", (DL_FUNC) &put_user_unif_set_generator, 0},
    {"set_noop",                    (DL_FUNC) &set_noop,                    0},
    {"version_randtoolbox",         (DL_FUNC) &version_randtoolbox,         1},
    {"user_unif_rand",		    (DL_FUNC) &user_unif_rand,		    0},
    {NULL, NULL, 0}
};

static const R_FortranMethodDef FortranEntries[] = {
    {"F_halton", (DL_FUNC) &F77_NAME(halton),  7},
    {"F_sobol",  (DL_FUNC) &F77_NAME(sobol),  11},
    {NULL, NULL, 0}
};

static const R_CallMethodDef callMethods[] = 
{
        {"doTorus", (DL_FUNC) &doTorus, 6},
        {"doSetSeed", (DL_FUNC) &doSetSeed, 1},
        {"doCongruRand", (DL_FUNC) &doCongruRand, 6},
        {"doSFMersenneTwister", (DL_FUNC) &doSFMersenneTwister, 4},
        {"doPokerTest", (DL_FUNC) &doPokerTest, 3},
        {"doCollisionTest", (DL_FUNC) &doCollisionTest, 3},
        {"doWELL", (DL_FUNC) &doWELL, 5},
        {"doKnuthTAOCP", (DL_FUNC) &doKnuthTAOCP, 2},
        {NULL, NULL, 0}
};


//table of registered routines
void R_init_randtoolbox(DllInfo *info)
{
        R_registerRoutines(info, CEntries, callMethods, FortranEntries, NULL); 
		
        //make randtoolbox C functions available for other packages
        R_RegisterCCallable("randtoolbox", "torus", (DL_FUNC) torus);
        R_RegisterCCallable("randtoolbox", "setSeed", (DL_FUNC) setSeed);
        R_RegisterCCallable("randtoolbox", "congruRand", (DL_FUNC) congruRand);
        R_RegisterCCallable("randtoolbox", "SFmersennetwister", (DL_FUNC) SFmersennetwister);
        R_RegisterCCallable("randtoolbox", "pokerTest", (DL_FUNC) pokerTest);
        R_RegisterCCallable("randtoolbox", "collisionTest", (DL_FUNC) collisionTest);
        R_RegisterCCallable("randtoolbox", "knuthTAOCP", (DL_FUNC) knuthTAOCP); 
		 
		//retrieve WELL rng entry point in the rngWELL pkg
		WELLrng = (void (*) (double *, int, int, int, int, int)) R_GetCCallable("rngWELL", "WELLrng");
		WELL_get_set_entry_point =(void (*) (void (*)())) R_GetCCallable("rngWELL", "WELL_get_set_entry_point");
		/*getRngWELL = (void (*) (int *, int *, unsigned int *)) R_GetCCallable("rngWELL", "getRngWELL");
		putRngWELL = (void (*) (int *, int *, unsigned int *)) R_GetCCallable("rngWELL", "putRngWELL");
		initMT2002 = (void (*) (unsigned int *, int *, unsigned int *)) R_GetCCallable("rngWELL", "initMT2002");*/

	R_useDynamicSymbols(info, FALSE);
}

