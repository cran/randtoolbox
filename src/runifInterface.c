/** 
 * @file  runifInterface.c
 * @brief C file for 'runif' interface
 *
 * @author Petr Savicky 
 *
 *
 * Copyright (C) 2009, Petr Savicky, Academy of Sciences of the Czech Republic. 
 * All rights reserved.
 *
 * The new BSD License is applied to this software.
 * Copyright (c) 2009 Petr Savicky, Academy of Sciences of the Czech Republic. 
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
 *  runif interface
 *    
 *      C file
 *
 */

#include <R.h>
#include <Rmath.h>
#include <R_ext/Random.h>

#include "congruRand.h"
#include "runifInterface.h"

static int generator;
static double (*user_unif_rand_selected) (void); // not (double *) as user_unif_rand
static void (*user_unif_init_selected) (unsigned int seed);

void user_unif_set_generator(int gener, void (*selected_init)(unsigned int), double (*selected_rand)())
{
	generator = gener;
	user_unif_init_selected = selected_init;
	user_unif_rand_selected = selected_rand;
}

// .C entry point called from randtoolbox initialization (.onLoad)
void put_user_unif_set_generator()
{
	WELL_get_set_entry_point(user_unif_set_generator);
}

double x;

// R_ext/Random.h entry point
double *user_unif_rand(void)
{
    x = user_unif_rand_selected();
    return(&x);
}

// R_ext/Random.h entry point
void user_unif_init(unsigned int seed)
{
	seed = 3602842457U * seed + 105890386U; // undo initial scrambling
    user_unif_init_selected(seed);
}

// .C entry point
void current_generator(int *pgener)
{
	*pgener = generator;
}

// this will be called by RNGkind("user-supplied")
void no_operation(unsigned int seed)
{
    ;
}

// .C entry point
void set_noop(void)
{
	user_unif_init_selected = no_operation;
}

