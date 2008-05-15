/**********************************************************************************************
 *   Copyright (c) 2008 Christophe Dutang                                                                    *
 *                                                                                                                                           *
 *   This program is free software; you can redistribute it and/or modify                 *
 *   it under the terms of the GNU General Public License as published by           *
 *   the Free Software Foundation; either version 2 of the License, or                     *
 *   (at your option) any later version.                                                                              *
 *                                                                                                                                           *
 *   This program is distributed in the hope that it will be useful,                               *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of            *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the   *
 *   GNU General Public License for more details.                                                      *
 *                                                                                                                                           *
 *   You should have received a copy of the GNU General Public License             *
 *   along with this program; if not, write to the                                                             *
 *   Free Software Foundation, Inc.,                                                                                *
 *   59 Temple Place, Suite 330, Boston, MA 02111-1307, USA                               *
 *                                                                                                                                           *
 **********************************************************************************************/
/*
 *  Torus algorithm to generate quasi random numbers 
 *
 *		init file
 *  
 *	Native routines registration, see 'writing R extensions'
 *
 */

#include <Rinternals.h>
#include <R_ext/Rdynload.h>
#include "randtoolbox.h"
#include "testrng.h"

//table of registration
static const R_CallMethodDef callMethods[] = 
{
        {"doTorus", (DL_FUNC) &doTorus, 5},
        {"doSetTorusSeed", (DL_FUNC) &doSetTorusSeed, 1},
        {"doCongruRand", (DL_FUNC) &doCongruRand, 6},
        {"doSFMersenneTwister", (DL_FUNC) &doSFMersenneTwister, 3},
        {"doTest", (DL_FUNC) &doTest, 3},
        {NULL, NULL, 0}
};

void R_init_randtoolbox(DllInfo *info)
{
        //register method accessed with .Call
        R_registerRoutines(info, NULL, callMethods, NULL, NULL); 
        //make torus C functions available from other packages
        R_RegisterCCallable("randtoolbox", "torus", (DL_FUNC) torus);
        R_RegisterCCallable("setTorusSeed", "setTorusSeed", (DL_FUNC) setTorusSeed);
        R_RegisterCCallable("congrurand", "congrurand", (DL_FUNC) congrurand);
        R_RegisterCCallable("SFmersennetwister", "SFmersennetwister", (DL_FUNC) SFmersennetwister);
        R_RegisterCCallable("pokerTest", "pokerTest", (DL_FUNC) pokerTest);
}
