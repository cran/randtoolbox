/* ***************************************************************************** */
/* Copyright:      Francois Panneton and Pierre L'Ecuyer, University of Montreal */
/*                 Makoto Matsumoto, Hiroshima University                        */
/* Notice:         This code can be used freely for personal, academic,          */
/*                 or non-commercial purposes. For commercial purposes,          */
/*                 please contact P. L'Ecuyer at: lecuyer@iro.UMontreal.ca       */
/* ***************************************************************************** */
/*
 * WELL1024b is __entirely__ based on the code of WELL1024a by P. L'Ecuyer.
 * we just change constants, parameters to get WELL1024b, add some
 * code to interface with R and add some comments on #define's.
 */

#define W 32
#define R 32
#define M1 22
#define M2 25
#define M3 26

//Mi matrices defined in table 1 of Panneton et al (2006)
//matrix M3(t)
#define MAT0POS(t,v) (v^(v>>t))
#define MAT0NEG(t,v) (v^(v<<(-(t))))
//matrix M1
#define MAT1(v) v
//matrix M4(a)
#define MAT2(a,v) ((v & 1U)?((v>>1)^a):(v>>1))
//matrix M2(t)
#define MAT3POS(t,v) (v>>t)
#define MAT3NEG(t,v) (v<<(-(t)))
//matrix M5(t,b)
#define MAT4POS(t,b,v) (v ^ ((v>>  t ) & b))
#define MAT4NEG(t,b,v) (v ^ ((v<<(-(t))) & b))
//matrix M6(q,s,t,a)
#define MAT5(r,a,ds,dt,v) ((v & dt)?((((v<<r)^(v>>(W-r)))&ds)^a):(((v<<r)^(v>>(W-r)))&ds))
//matrix M0
#define MAT7(v) 0

#define V0            STATE[state_i                   ]
#define VM1           STATE[(state_i+M1) & 0x0000001fU]
#define VM2           STATE[(state_i+M2) & 0x0000001fU]
#define VM3           STATE[(state_i+M3) & 0x0000001fU]
#define VRm1          STATE[(state_i+31) & 0x0000001fU]
#define newV0         STATE[(state_i+31) & 0x0000001fU]
#define newV1         STATE[state_i                   ]

#define FACT 2.32830643653869628906e-10

static unsigned int state_i = 0;
static unsigned int STATE[R];
static unsigned int z0, z1, z2;

void InitWELLRNG1024b (unsigned int *init){
   int j;
   state_i = 0;
   for (j = 0; j < R; j++)
     STATE[j] = init[j];
}

double WELLRNG1024b (void){
  z0    = VRm1;
  z1    = MAT0NEG(-21,V0)       ^ MAT0POS (17, VM1);
  z2    = MAT2(0x8bdcb91e, VM2) ^ MAT0POS(15,VM3);
  newV1 = z1                 ^ z2; 
  newV0 = MAT0NEG (-14,z0)   ^ MAT0NEG(-21,z1)    ^ MAT1(z2) ;
  state_i = (state_i + 31) & 0x0000001fU;
  return ((double) STATE[state_i]  * FACT);
}
