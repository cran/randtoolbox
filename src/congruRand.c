/** 
 * @file  congruRand.c
 * @brief C file for congruential RNG
 *
 * @author Christophe Dutang
 * @author Petr Savicky 
 *
 * Copyright (C) 2022, Christophe Dutang
 * # remove a warning: this old-style function definition is not preceded by a prototype
 * # raised by 
 * > clang -DNDEBUG   -isystem /usr/local/clang15/include                                      \
 * -I"/Library/Frameworks/R.framework/Headers"  -fpic  -O3 -Wall -pedantic -Wstrict-prototypes \
 * -c congruRand.c -o congruRand.o
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
 *  Congruential random number generators
 *    
 *      C file
 *
 */


#include "congruRand.h"


#define two_64_d 18446744073709551616.0
#define two_64_s "18446744073709551616"
#define two_64m1 18446744073709551615ULL
#define two_64m1_h 0xffffffffffffffff




// general linear congruential generator

uint64_t mod, mask, mult, incr, congru_seed;

// possible value of user_unif_rand_selected in runifInterface.c
// when mask == 0LL
double user_unif_rand_congru_0(void)
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
// when mask > 0LL and mask != two_64m1_h
double user_unif_rand_congru_1(void)
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
// when mask > 0LL and mask == two_64m1_h 
// NB: the recursion mult * congru_seed + incr is automatically truncated by conversion to uint64_t
double user_unif_rand_congru_2(void)
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

// called from randtoolbox.c by congruRand function
double get_congruRand(void)
{
	double x;
  if(mask == 0) //mask == 0x0
  {  congru_seed  = (mult * congru_seed + incr) % mod; 
  }else if(mask == two_64m1_h) //mask == 0xffffffffffffffff 
  {  congru_seed  = (mult * congru_seed + incr); 
  }else //0x0 < mask < 0xffffffffffffffff
    congru_seed  = (mult * congru_seed + incr) & mask;
  if(mod == 0)
    x = (double) congru_seed / two_64_d;
  else //mod != 0
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
		uint64_t inp_incr, uint64_t inp_seed, uint64_t inp_mask)
{
	mod = inp_mod;
	mult = inp_mult;
	incr = inp_incr;
	congru_seed = inp_seed;
	mask = inp_mask;
}

// get seed
void get_seed_congruRand(uint64_t *out_seed)
{
	*out_seed = congru_seed;
}

// .C entry point used by get.description
void get_state_congru(char **params, char **seed)
{
  /* previous calls were
   sprintf(params[0], "%" PRIu64, mod); // defined in <stdio.h>
   sprintf(params[1], "%" PRIu64, mult);
   sprintf(params[2], "%" PRIu64, incr);
   sprintf(seed[0], "%" PRIu64, congru_seed);
   
   * revision 5168, Sun Nov 20 22:32:38 2011 UTC introduces 
   * a bug by replacing sprintf() by Rprintf()
   * 
   * revision 6372, Fri Jan 28 13:05:16 2023 UTC now uses 
   * ulltostr()
   */
  
	if (mod != 0LL) {
		ulltostr(mod, params[0], 10);
	} else {
		strcpy(params[0], two_64_s); /* defined in <string.h> */
	}
	ulltostr(mult, params[1], 10);
	ulltostr(incr, params[2], 10);
	ulltostr(congru_seed, seed[0], 10);
}

// .C entry point used by put.description
void put_state_congru(char **params, char **seed, int *err)
{
  
  /* see 
   * convert string to unsigned long long 
   * on UNIX, we use strtoull or strtoul, see 
   https://linux.die.net/man/3/strtoull 
   https://linux.die.net/man/3/strtoul 
   * on windows, we use string to unsigned int64, see
   https://learn.microsoft.com/en-us/cpp/c-runtime-library/reference/strtoui64-wcstoui64-strtoui64-l-wcstoui64-l
   * the code (uint64_t) _atoi64 could have been used 
   */
  
  /* former calls use sscanf 
   sscanf(params[0], "%" SCNu64 "\n", &inp_mod); //defined in <stdio.h>
   sscanf(params[1], "%" SCNu64 "\n", &inp_mult) 
   sscanf(params[2], "%" SCNu64 "\n", &inp_incr); 
   sscanf(seed[0], "%" SCNu64 "\n", &inp_seed); 
   */
  
  /* temporary outputs of string-to-unsigned-long-long() */
	uint64_t inp_mod, inp_mask, inp_mult, inp_incr, inp_seed;

  if (strcmp(params[0], two_64_s) == 0) 
  { /* defined in <string.h> */
		inp_mod = 0;
		inp_mask = two_64m1_h;
	}else 
	{
	  /* former call was  */
#if HAVE_STRTOULL
{
    /* value is set by the function to the next character after the numerical value */
    char * endptrarg1a;
	  inp_mod = strtoull(params[0], &endptrarg1a, 10);
}
#elif HAVE_STRTOUL
{
    /* value is set by the function to the next character after the numerical value */
    char * endptrarg1b;
    inp_mod = strtoul(params[0], &endptrarg1b, 10);
}
#elif HAVE_WINDOWS_STR_UI64_H
{
    /* value is set by the function to the next character after the numerical value */
    char * endptrarg1c;
    inp_mod = _strtoui64(params[0], &endptrarg1c, 10);
}
#else
{
    inp_mod = atoi(params[0]);  
}
#endif

		if ((inp_mod & (inp_mod - 1)) == 0) {
			inp_mask = inp_mod - 1;
		} else {
			inp_mask = 0;
		}
	}
	
#if HAVE_STRTOULL
{
  /* value is set by the function to the next character after the numerical value */
  char * endptrarg2a;
  inp_mult = strtoull(params[1], &endptrarg2a, 10);
  inp_incr = strtoull(params[2], &endptrarg2a, 10);
  inp_seed = strtoull(seed[0], &endptrarg2a, 10);
}
#elif HAVE_STRTOUL
{
  /* value is set by the function to the next character after the numerical value */
  char * endptrarg2b;
  inp_mult = strtoul(params[1], &endptrarg2b, 10);
  inp_incr = strtoul(params[2], &endptrarg2b, 10);
  inp_seed = strtoul(seed[0], &endptrarg2b, 10);
  
}
#elif HAVE_WINDOWS_STR_UI64_H
{
  /* value is set by the function to the next character after the numerical value */
  char * endptrarg2c;
  inp_mult = _strtoui64(params[1], &endptrarg2c, 10);
  inp_incr = _strtoui64(params[2], &endptrarg2c, 10);
  inp_seed = _strtoui64(seed[0], &endptrarg2c, 10);
}
#else
{
  inp_mult = atoi(params[1]);
  inp_incr = atoi(params[2]);
  inp_seed = atoi(seed[0]);
}
#endif
/* debug 
Rprintf("inp_mod is %llu\n", inp_mod);
Rprintf("inp_mult is %llu\n", inp_mult);
Rprintf("inp_incr is %llu\n", inp_incr);
Rprintf("inp_seed is %llu\n", inp_seed);
*/

	*err = check_congruRand(inp_mod, inp_mask, inp_mult, inp_incr, inp_seed);
	
	if (*err < 0) return;
	/* if no error, set the new value */
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
	/* */
}

/* utility function to convert unsigned long long to string 
 * NB: on some systems, there is ulltoa() in <stdlib.h>.
 */
void ulltostr(uint64_t value, char* stroutput, int base)
{
  uint64_t tmp_digit = 0, tmp_res = 0;
  uint64_t tmp_dignb = value;
  int count = 0;
  
  if(stroutput != NULL)
  {
    if (tmp_dignb == 0)
    {
      count++;
    }
    /* compute digit number */
    while(tmp_dignb > 0)
    {
      tmp_dignb = tmp_dignb/base;
      count++;
    }
    /* go to first digit */
    stroutput += count;
    
    /* compute digits */
    *stroutput = '\0';
    do
    {
      tmp_digit = value / base;
      tmp_res = value - base * tmp_digit;
      if (tmp_res < 10)
      {
        * --stroutput = '0' + tmp_res;
      }
      else if ((tmp_res >= 10) && (tmp_res < 16))
      {
        * -- stroutput = 'A' - 10 + tmp_res;
      }
    } while ((value = tmp_digit) != 0);
    
  }
}


