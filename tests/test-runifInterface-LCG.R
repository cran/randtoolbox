library(randtoolbox)

#see e.g. https://en.wikipedia.org/wiki/Linear_congruential_generator

  RNGkind()
  
  #Park Miller congruential generator : 2147483647= 2^31-1
  set.generator(name="congruRand", mod="2147483647", mult="16807", incr="0", seed=12345)
  LCG <- get.description()
  x1 <- runif(5)
  setSeed(12345)
  x2 <- congruRand(5, dim=1, mod=2^31-1, mult=16807, incr=0)
  print(cbind(x1, x2))
  
  RNGkind()
  
  # the Knuth Lewis RNG : 4294967296 == 2^32
  set.generator(name="congruRand", mod="4294967296", mult="1664525", incr="1013904223", seed=1)
  LCG <- get.description()
  x1 <- runif(5)
  setSeed(1)
  x2 <- congruRand(5, dim=1, mod=4294967296, mult=1664525, incr=1013904223)
  print(cbind(x1, x2))
  
  
  # the POSIX rand48 : 281474976710656 == 2^48
  set.generator(name="congruRand", mod="281474976710656", mult="25214903917", incr="11", seed=1)
  LCG <- get.description()
  x1 <- runif(5)
  setSeed(1)
  x2 <- congruRand(5, dim=1, mod=281474976710656, mult=25214903917, incr=11)
  print(cbind(x1, x2))
  
  
if(FALSE) #to be updated once congruRand back to runifInterface
{
    
  # the NMIX RNG by Donald Knuth => produce two different result after the second term
  # 18446744073709551616 == 2^64
  set.generator(name="congruRand", mod="18446744073709551616", mult="1442695040888963407", incr="1013904223", seed=1)
  LCG <- get.description()
  x1 <- runif(5)
  setSeed(1)
  x2 <- congruRand(5, dim=1, mod=18446744073709551616, mult=1442695040888963407, incr=1013904223)
  print(cbind(x1, x2))
  #only first value is correct
  (1442695040888963407 * 1 + 1013904223) / 2^64
  
  
  #Haynes RNG
  set.generator(name="congruRand", mod="18446744073709551616", mult="636412233846793005", incr="1", seed=1)
  LCG <- get.description()
  x1 <- runif(5)
  setSeed(1)
  x2 <- congruRand(5, dim=1, mod=18446744073709551616, mult=636412233846793005, incr=1, echo = TRUE)
  print(cbind(x1, x2))
  
  #only first value is correct
  (636412233846793005 * 1 + 1) / 2^64
}
