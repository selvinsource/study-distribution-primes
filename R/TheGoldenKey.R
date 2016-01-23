#The Golden Key (the Euler product formula):
#1 + 1/2^s + 1/3^s+ 1/4^s + 1/5^s + 1/6^s + ... = (1-2^-s)^-1 * (1-3^-s)^-1 * (1-5^-s)^-1 * (1-7^-s)^-1 * (1-11^-s)^-1
#Z of s equals the product over all primes of one minus p to minus s, to  minus one
#p105
library(numbers)
options(digits=20)

zeta <- function(s,terms) {
  x <- c(1:terms)
  sum(1/x^s)
}

tt <- function(s,terms) {
  x <- Primes(terms)
  prod((1-x^-s)^-1)
}

s <- seq(1,10,by=0.1)
Z <- sapply(s,zeta,terms=10000)
TT <- sapply(s,tt,terms=10000)

plot(s,Z,type="l",ann=FALSE)
lines(s,TT,col="blue")
abline(h=1,v=1,col="green")
title("The Euler Product Formula",xlab="s",ylab="Zeta = black, Product = blue")