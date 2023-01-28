/** 
 * @file  runifInterface.h
 * @brief header file for 'runif' interface
 *
 * @author Petr Savicky 
 *
 * Copyright (C) 2022, Christophe Dutang
 * # remove a warning: this old-style function definition is not preceded by a prototype
 * # raised by 
 * > clang -DNDEBUG   -isystem /usr/local/clang15/include                                      \
 * -I"/Library/Frameworks/R.framework/Headers"  -fpic  -O3 -Wall -pedantic -Wstrict-prototypes \
 * -c runifInterface.c -o runifInterface.o 
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
 *      header file
 *
 */

/* prototype*/
void user_unif_set_generator(int gener, void (*selected_init)(unsigned int), double (*selected_rand)(void));

#ifndef define_here
extern
#endif
/* function to be used with user_unif_set_generator */
void (*WELL_get_set_entry_point)(void (int, void (*)(unsigned int), double (*)(void)) );

#ifndef runifInterface_H
#define runifInterface_H

/* Functions accessed from .C() */
void set_noop(void);
void current_generator(int *pgener);
void put_user_unif_set_generator(void);

/* Functions to be found by RNGkind() */
double *user_unif_rand(void);
void user_unif_init(unsigned int seed);

#endif 
