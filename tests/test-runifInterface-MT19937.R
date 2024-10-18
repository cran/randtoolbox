require(randtoolbox)

out <- "file"
out <- "console"

set.generator("MersenneTwister", initialization="init2002", 
              resolution=53, seed=1)
s0 <- get.description()


if(out == "file")
{
  capture.output(print(R.version), file = "MT19937-init2022.txt")
  capture.output(print(Sys.info()), file = "MT19937-init2022.txt", append = TRUE)
  capture.output(print(s0), file = "MT19937-init2022.txt", append = TRUE)
  capture.output(RNGkind(), file = "MT19937-init2022.txt", append = TRUE)
}else
{
  print(R.version)
  print(Sys.info())
  print(s0)
  print(RNGkind())
}
x <- runif(10)
print(x, digits=12)

trueoutput_seed1 <- c(
  0.417022004702574,
  0.720324493442158,
  0.000114374817345,
  0.302332572631840,
  0.146755890817113,
  0.092338594768798,
  0.186260211377671,
  0.345560727043048,
  0.396767474230670,
  0.538816734003357)

if(out == "file")
  write.csv(cbind(x, trueoutput_seed1), file="MT19937-init2022.csv")

abs(x - trueoutput_seed1) < 1e-6

if(FALSE)
{
  
  macos.out <- read.table("share/macos-outputs/MT19937-init2022.txt", skip = 39, header=FALSE, nrows = 89)
  macos.out2 <- read.table("share/macos-outputs/MT19937-init2022.txt", skip = 128, header=FALSE, nrows = 1)
  macos.state <- as.integer(macos.out[1, -1])
  for(i in 2:NROW(macos.out))
    macos.state <- c(macos.state, as.integer(macos.out[i, -1]))
  macos.state <- c(macos.state, as.integer(unlist(macos.out2[,-1])))
  
  
  win.out <- read.table("share/windows7-outputs/MT19937-init2022.txt", skip = 32, header=FALSE, nrows = 104)
  win.out2 <- read.table("share/windows7-outputs/MT19937-init2022.txt", skip = 136, header=FALSE, nrows = 1)
  win.state <- as.integer(c(unlist(win.out[, -1]), unlist(win.out2[,-1])))
  win.state <- as.integer(win.out[1, -1])
  for(i in 2:NROW(win.out))
    win.state <- c(win.state, as.integer(win.out[i, -1]))
  win.state <- c(win.state, as.integer(unlist(win.out2[,-1])))
  
  
  cbind(win.state, macos.state)
  
  macos.state == win.state
}