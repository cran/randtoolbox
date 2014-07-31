/** 
 * @file  congruRand.c
 * @brief C file for congruential RNG
 *
 * @author Christophe Dutang
 * @author Petr Savicky 
 *
 *
 * Copyright (C) 2014, Christophe Dutang,
 * Petr Savicky, Academy of Sciences of the Czech Republic. 
 * All rights reserved.
 *
 * The new BSD License is applied to this software.
 * Copyright (c) 2014 Christophe Dutang, Petr Savicky. 
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
 *  Congruential random number generators
 *    
 *      C file
 *
 */


#include "congruRand.h"
#include "runifInterface.h"

#define two_64_d 18446744073709551616.0
#define two_64m1 18446744073709551615ULL
#define two_64_s "18446744073709551616"
#define two_64m1_h 0xffffffffffffffff




// general linear congruential generator

uint64_t mod, mask, mult, incr, congru_seed;

// possible value of user_unif_rand_selected in runifInterface.c
double user_unif_rand_congru_0()
{
	double x;
	congru_seed  = (mult * congru_seed + incr) % mod;
	x = (double) congru_seed / (double) mod;
	if (x == 0.0) {
		x = 0.5 / (double) mod;
	}
	return x;
}

// possible value of user_unif_rand_selected in runifInterface.c
double user_unif_rand_congru_1()
{
	double x;
	congru_seed  = (mult * congru_seed + incr) & mask;
	x = (double) congru_seed / (double) mod;
	if (x == 0.0) {
		x = 0.5 / (double) mod;
	}
	return x;
}

// possible value of user_unif_rand_selected in runifInterface.c
double user_unif_rand_congru_2()
{
	double x;
	congru_seed  = (mult * congru_seed + incr);
	x = (double) congru_seed / two_64_d;
	if (x == 0.0) {
		x = 0.5 / two_64_d;
	}
	return x;
}

// possible value of user_unif_init_selected in runifInterface.c
void user_unif_init_congru(uint32_t seed)
{
	congru_seed = (uint64_t) seed;
}

// called from randtoolbox.c from congruRand function
double get_congruRand()
{
	double x;
	congru_seed  = (mult * congru_seed + incr) % mod;
	x = (double) congru_seed / (double) mod;
	if (x == 0.0) {
		x = 1.0;
	}
	return x;
}

// check several criteria on parameters
int check_congruRand(uint64_t mod, uint64_t mask,
	uint64_t mult, uint64_t incr,
	uint64_t seed)
{
	if (mult == 0LL) return - 1;
	if (mask == 0LL) {
		if (mult >= mod) return - 2;
		if (incr >= mod) return - 3;
		if (mod - 1 > (two_64m1 - incr) / mult) return - 4;
		if (seed >= mod) return - 5;
		return 0;
	} else {
		if (mult > mask) return - 12;
		if (incr > mask) return - 13;
		if (seed > mask) return - 14;
		if (mask == two_64m1_h) return 2;
		return 1;
	}
}

// set parameters
void set_congruRand(uint64_t inp_mod, uint64_t inp_mult,
		uint64_t inp_incr, uint64_t inp_seed)
{
	mod = inp_mod;
	mult = inp_mult;
	incr = inp_incr;
	congru_seed = inp_seed;
}

// get seed
void get_seed_congruRand(uint64_t *out_seed)
{
	*out_seed = congru_seed;
}

// .C entry point used by get.description
void get_state_congru(char **params, char **seed)
{
	if (mod != 0LL) {
		Rprintf(params[0], "%" PRIu64 "\n", mod);
	} else {
		strcpy(params[0], two_64_s);
	}
	Rprintf(params[1], "%" PRIu64 "\n", mult);
	Rprintf(params[2], "%" PRIu64 "\n", incr);
	Rprintf(seed[0], "%" PRIu64 "\n", congru_seed);
}

// .C entry point used by put.description
void put_state_congru(char **params, char **seed, int *err)
{
	uint64_t inp_mod, inp_mask, inp_mult, inp_incr, inp_seed;
	if (strcmp(params[0], two_64_s) == 0) {
		inp_mod = 0;
		inp_mask = two_64m1_h;
	} else {
		sscanf(params[0], "%" PRIu64 "\n", &inp_mod);
		if ((inp_mod & (inp_mod - 1)) == 0) {
			inp_mask = inp_mod - 1;
		} else {
			inp_mask = 0;
		}
	}
	sscanf(params[1], "%" PRIu64 "\n", &inp_mult);
	sscanf(params[2], "%" PRIu64 "\n", &inp_incr);
	sscanf(seed[0], "%" PRIu64 "\n", &inp_seed);
	*err = check_congruRand(inp_mod, inp_mask, inp_mult, inp_incr, inp_seed);

	if (*err < 0) return;
	mod = inp_mod;
	mask = inp_mask;
	mult = inp_mult;
	incr = inp_incr;
	congru_seed = inp_seed;
	switch (*err) {
	case 0:
		user_unif_set_generator(1, user_unif_init_congru, user_unif_rand_congru_0);
		break;
	case 1:
		user_unif_set_generator(1, user_unif_init_congru, user_unif_rand_congru_1);
		break;
	case 2:
		user_unif_set_generator(1, user_unif_init_congru, user_unif_rand_congru_2);
	}
	*err = 0;
}

