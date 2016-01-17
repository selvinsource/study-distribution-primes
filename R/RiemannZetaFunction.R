#The Riemann Zeta Function: Z(s) = 1 + 1/2^s + 1/3^s+ 1/4^s + 1/5^s + 1/6^s + ...
#p77
options(digits = 20)

zeta <- function(s,terms) {
  x <- c(1:terms)
  sum(1/x^s)
}

s <- seq(1,10,by=0.1)
Z <- sapply(s,zeta,terms=10000)

plot(s,Z,type="l")
abline(h=1,v=1,col="green")
title("The zeta function for argument greater than 1")