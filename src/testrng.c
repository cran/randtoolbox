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
 *		C functions	
 *  
 *	Many ideas are taken from <Rsource>/src/main/RNG.c
 *
 */

#include "testrng.h"



/**************/
/* constants */



/*********************************/
/* quasi random generation */

//main function used .Call()
SEXP doTest(SEXP hands, SEXP n, SEXP d)
{
        if (!isNumeric(hands) || !isNumeric(d))
                error(_("invalid argument"));
                        
            
        //temporary working variables
        int dim  = asInteger( d ); //dimension of vector
        int nbh = asInteger( n ); //number of observed hands
        /*
    if(hands == NULL) Rprintf("blii\n");
    else Rprintf("toooo\n"); */
        
        int *rHands = INTEGER( hands ); // 'n'x'd' matrix of obs. hands 
    
    SEXP dims = getAttrib(hands, R_DimSymbol); //extract dimensions
/*
    if(INTEGER(dims) == NULL  ) Rprintf("blii2\n");
    else Rprintf("toooo1\n"); */

    
    if (nbh != INTEGER(dims)[0] || dim != INTEGER(dims)[1])
        error(_("invalid argument hands"));
    
	
        //result
        int *valuePresent = (int *) R_alloc(dim, sizeof(int));
        SEXP resultinR; //result in R
        PROTECT(resultinR = allocVector(INTSXP, dim)); //allocate a d vector
/*
        if(resultinR == NULL) Rprintf("zog\n");
    else Rprintf("toooo2\n");*/
    
    valuePresent = INTEGER( resultinR ); //plug the C pointer on the R type
	
        R_CheckStack();
	
        //computation step        
        pokerTest(rHands, nbh, dim, valuePresent);
	
        UNPROTECT(1);
	
        return resultinR;
}

//compute the observed hands
// r[i] is the number of hands with i+1 (different) value(s)
void pokerTest(int *hands, int nbh, int d, int *res)
{
        int i, j, k; //loop indexes
        int nbzero; //zero counter
        
        int * temp = (int *) R_alloc(d, sizeof(int) );
	
        if (!R_FINITE(nbh) || !R_FINITE(d))
                error(_("non finite argument"));
            
        //init
        for(j = 0; j < d; j++)
                res[j] = 0;
                   
        for(i = 0; i < nbh; i++) 
        {
                //erase previous line
                for(j = 0; j < d; j++)
                        temp[j] = 0;
            
                //browse the i+1th hand
                for(j = 0; j < d; j++)
                { 
                        //if(hands[i + j * nb] > -1 && hands[i + j * nb] <d)
                            temp[ hands[i + j * nbh] ] ++;
                        //else
                            //error(_("internal error in pokertest"));
                }
            /*
            Rprintf("temp : ");
            for(j = 0; j < d; j++)
                Rprintf(" %d\t", temp[j]);
            Rprintf("\n");
            */
                
                nbzero = 0;
            
                //find the i+1 th hand
                for(j = 0; j < d; j++)
                {
                        if(temp[j] == 0)
                                nbzero++;
                }
            //nb of different value is d-nbzero
            res[d - nbzero - 1] ++;
                    
        }
      
}
