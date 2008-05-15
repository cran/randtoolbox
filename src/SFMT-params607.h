/** 
 * @file SFMT-params607.h 
 *
 * @brief SIMD oriented Fast Mersenne Twister(SFMT) pseudorandom
 * number generator
 *
 * @author Mutsuo Saito (Hiroshima University)
 * @author Makoto Matsumoto (Hiroshima University)
 *
 * Copyright (C) 2006, 2007 Mutsuo Saito, Makoto Matsumoto and Hiroshima
 * University. All rights reserved.
 *
 * The new BSD License is applied to this software.
 * Copyright (c) 2006,2007 Mutsuo Saito, Makoto Matsumoto and Hiroshima
 *  University. All rights reserved.
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
 *          - Neither the name of the Hiroshima University nor the names of
 *          its contributors may be used to endorse or promote products
 *          derived from this software without specific prior written
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
 *
 */


#ifndef SFMT_PARAMS607_H
#define SFMT_PARAMS607_H

#define POS1	2
#define SL1	15
#define SL2	3
#define SR1	13
#define SR2	3
#define MSK1	0xfdff37ffU
#define MSK2	0xef7f3f7dU
#define MSK3	0xff777b7dU
#define MSK4	0x7ff7fb2fU
#define PARITY1	0x00000001U
#define PARITY2	0x00000000U
#define PARITY3	0x00000000U
#define PARITY4	0x5986f054U


/* PARAMETERS FOR ALTIVEC */
#if defined(__APPLE__)	/* For OSX */
    #define ALTI_SL1	(vector unsigned int)(SL1, SL1, SL1, SL1)
    #define ALTI_SR1	(vector unsigned int)(SR1, SR1, SR1, SR1)
    #define ALTI_MSK	(vector unsigned int)(MSK1, MSK2, MSK3, MSK4)
    #define ALTI_MSK64 \
	(vector unsigned int)(MSK2, MSK1, MSK4, MSK3)
    #define ALTI_SL2_PERM \
	(vector unsigned char)(3,21,21,21,7,0,1,2,11,4,5,6,15,8,9,10)
    #define ALTI_SL2_PERM64 \
	(vector unsigned char)(3,4,5,6,7,29,29,29,11,12,13,14,15,0,1,2)
    #define ALTI_SR2_PERM \
	(vector unsigned char)(5,6,7,0,9,10,11,4,13,14,15,8,19,19,19,12)
    #define ALTI_SR2_PERM64 \
	(vector unsigned char)(13,14,15,0,1,2,3,4,19,19,19,8,9,10,11,12)
#else	/* For OTHER OSs(Linux?) */
    #define ALTI_SL1	{SL1, SL1, SL1, SL1}
    #define ALTI_SR1	{SR1, SR1, SR1, SR1}
    #define ALTI_MSK	{MSK1, MSK2, MSK3, MSK4}
    #define ALTI_MSK64	{MSK2, MSK1, MSK4, MSK3}
    #define ALTI_SL2_PERM	{3,21,21,21,7,0,1,2,11,4,5,6,15,8,9,10}
    #define ALTI_SL2_PERM64	{3,4,5,6,7,29,29,29,11,12,13,14,15,0,1,2}
    #define ALTI_SR2_PERM	{5,6,7,0,9,10,11,4,13,14,15,8,19,19,19,12}
    #define ALTI_SR2_PERM64	{13,14,15,0,1,2,3,4,19,19,19,8,9,10,11,12}
#endif	/* For OSX */
#define IDSTR	"SFMT-607:2-15-3-13-3:fdff37ff-ef7f3f7d-ff777b7d-7ff7fb2f"

#endif /* SFMT_PARAMS607_H */
