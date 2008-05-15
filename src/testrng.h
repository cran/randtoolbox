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
 *			header file
 *
 */

#include <R.h>
#include <Rinternals.h>
#include <Rdefines.h>
#include <Rmath.h>
#include <R_ext/Error.h>

#include "locale.h"




/* Functions accessed from .Call() */
SEXP doTest(SEXP hands, SEXP n, SEXP d);

/* utility functions */
void pokerTest(int *hands, int nbh, int d, int *res);

