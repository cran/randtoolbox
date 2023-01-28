library(randtoolbox)

#see e.g. https://en.wikipedia.org/wiki/Linear_congruential_generator

  RNGkind()
  
  #Park Miller congruential generator : mod = 2147483647= 2^31-1, mult=16807, incr=0
  LCG.par <- c("2147483647", "16807", "0")
  set.generator(name="congruRand", mod=LCG.par[1], mult=LCG.par[2], incr=LCG.par[3], seed=12345)
  LCG <- get.description()
  LCG$parameters == LCG.par
  x1 <- runif(5)
  setSeed(12345)
  x2 <- congruRand(5, dim=1, mod=2^31-1, mult=16807, incr=0)
  print(cbind(x1, x2))
  print(sum(abs(x1 - x2)))
  
  RNGkind()
  
  # the Knuth Lewis RNG : mod=4294967296 == 2^32, mult=1664525, incr=1013904223
  LCG.par <- c("4294967296", "1664525", "1013904223")
  set.generator(name="congruRand", mod=LCG.par[1], mult=LCG.par[2], incr=LCG.par[3], seed=1)
  LCG <- get.description()
  LCG$parameters == LCG.par
  x1 <- runif(5)
  setSeed(1)
  x2 <- congruRand(5, dim=1, mod=4294967296, mult=1664525, incr=1013904223)
  print(cbind(x1, x2))
  print(sum(abs(x1 - x2)))
  
if(.Platform$OS.type != "windows")
{
  # the POSIX rand48 : 281474976710656 == 2^48
  LCG.par <- c("281474976710656", "25214903917", "11")
  set.generator(name="congruRand", mod=LCG.par[1], mult=LCG.par[2], incr=LCG.par[3], seed=1)
  LCG <- get.description()
  LCG$parameters == LCG.par
  x1 <- runif(5)
  setSeed(1)
  x2 <- congruRand(5, dim=1, mod=281474976710656, mult=25214903917, incr=11)
  print(cbind(x1, x2))
  print(sum(abs(x1 - x2)))
}
  
if(FALSE) #congruRand() does not handle 2^64 correctly but set.generator() does 
{
  
  # the MMIX RNG by Donald Knuth => produce two different result after the second term
  # 18446744073709551616 == 2^64
  LCG.par <- c("18446744073709551616", "1442695040888963407", "1013904223")
  set.generator(name="congruRand", mod=LCG.par[1], mult=LCG.par[2], incr=LCG.par[3], seed=1)
  LCG <- get.description()
  LCG$parameters == LCG.par
  x1 <- runif(5)
  setSeed(1)
  x2 <- congruRand(5, dim=1, mod=18446744073709551616, mult=1442695040888963407, incr=1013904223)
  print(cbind(x1, x2))
  #only first value is correct
  (1442695040888963407 * 1 + 1013904223) / 2^64
  
  #Haynes RNG
  LCG.par <- c("18446744073709551616", "636412233846793005", "1")
  set.generator(name="congruRand", mod=LCG.par[1], mult=LCG.par[2], incr=LCG.par[3], seed=1)
  LCG <- get.description()
  LCG$parameters == LCG.par
  x1 <- runif(5)
  setSeed(1)
  x2 <- congruRand(5, dim=1, mod=18446744073709551616, mult=636412233846793005, incr=1, echo = TRUE)
  print(cbind(x1, x2))
  
  #only first value is correct
  (636412233846793005 * 1 + 1) / 2^64
}
