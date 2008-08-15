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
 *  Torus algorithm to generate random numbers
 *  
 *			header file
 *
 */

#include <R.h>
#include <Rinternals.h>
#include <Rdefines.h>
#include <Rmath.h>
#include <R_ext/Error.h>

#include "locale.h"
#include "SFMT.h"
#include "WELL512a.h"
#include "WELL521a.h"
#include "WELL1024a.h"
#include "WELL19937a.h"
#include "WELL44497a.h"
#include "knuthTAOCP2002.h"


#include "config.h"
#if HAVE_TIME_H
# include <time.h>
#endif

#if HAVE_SYS_TIME_H
# include <sys/time.h>
#endif

#if HAVE_WINDOWS_H
# include <windows.h>
#endif


/* Functions accessed from .Call() */
SEXP doTorus(SEXP n, SEXP d, SEXP p, SEXP ismixed, SEXP timedseed);
SEXP doSetSeed(SEXP s);
SEXP doCongruRand(SEXP n, SEXP d, SEXP modulus, SEXP multiplier, SEXP increment, SEXP echo);
SEXP doSFMersenneTwister(SEXP n, SEXP d, SEXP mersexpo, SEXP paramset);
SEXP doWELL(SEXP n, SEXP d, SEXP order, SEXP tempering);
SEXP doKnuthTAOCP(SEXP n, SEXP d);

/* utility functions */
void torus(double *u, int nb, int dim, int *prime, int ismixed, int usetime);
void congruRand(double *u, int nb, int dim, unsigned long long mod, unsigned long long mult, unsigned long long incr, int show);
void SFmersennetwister(double *u, int nb, int dim, int mexp, int usepset);
void WELLrng(double *u, int nb, int dim, int order, int temper);
void knuthTAOCP(double *u, int nb, int dim);

void setSeed(long s);
void randSeedByArray(int length);
void randSeed();

