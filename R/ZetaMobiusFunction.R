#1/Z(s) = sum over n of moebius(n)/n^s
#p250
library(numbers)
options(digits=20)

zeta <- function(s,terms) {
  x <- c(1:terms)
  sum(1/x^s)
}

zetaMobius <- function(s,terms) {
  x <- c(1:terms)
  sum(sapply(x,moebius)/x^s)
}

s <- seq(1,10,by=0.1)
Z <- sapply(s,zeta,terms=100)
zetaMobius <- sapply(s,zetaMobius,terms=100)

plot(s,Z,type="l",ann=FALSE)
lines(s,1/zetaMobius,col="blue")
abline(h=1,v=1,col="green")
title("Zeta using Mobius function",xlab="s",ylab="zeta = black, zeta using Mobius = blue")