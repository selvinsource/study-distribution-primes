#The Riemann Zeta Function: Z(s) = 1 + 1/2^s + 1/3^s+ 1/4^s + 1/5^s + 1/6^s + ... = 
#p80 -> The zeta series diverges for s=0 or negative numbers
#p142 -> An infinite series may define a function over only part of its domain
#p146 -> Formula to calculate the zeta function for argument between zero and one 
#p147 -> Formula to calculate the zeta function for argument less than zero
options(digits = 20)
opar <- par(no.readonly=TRUE)
par(mfrow=c(3,2))

zeta <- function(s,terms) {
  x <- c(1:terms)
  sum(1/x^s)
}

eta <- function(s,terms) {
  sum <- 1
  for (x in 2:terms) {
    if(x %% 2 == 0L) term <- -1/x^s else term <- 1/x^s
    sum <- sum + term
  }
  sum
}

zetaUsingEta <- function(s,terms) {
  eta(s,terms) / (1 - 1/2^(s-1))
}

zetaMinusOne <- function(s,terms) {
  x = 1 - s
  zetaX <- zeta(x,terms)
  2^(1-x) * pi^(-x) * sin((1-x)/2 * pi) * factorial(x-1) * zetaX
}

sPos <- seq(1,10,by=0.1)
zPositiveArg <- sapply(sPos,zeta,terms=10000)
plot(sPos,zPositiveArg,type="l",ann=FALSE)
abline(h=1,v=1,col="green")
title("The zeta function for argument greater than 1")

sPosLess1 <- seq(0.1,0.9,by=0.1)
zPositiveArgLess1 <- sapply(sPosLess1,zetaUsingEta,terms=10000)
plot(sPosLess1,zPositiveArgLess1,type="l",ann=FALSE)
abline(h=0,v=0,col="green")
title("The zeta function for argument between 0 and 1")

sNeg <- seq(-0.1,-20.1,by=-0.1)
zNegativeArg <- sapply(sNeg,zetaMinusOne,terms=10000)
plot(sNeg,zNegativeArg,type="l",ann=FALSE)
abline(h=0,v=0,col="green")
title("The zeta function for argument between 0 and -20")

sNeg <- seq(-0.1,-26.1,by=-0.1)
zNegativeArg <- sapply(sNeg,zetaMinusOne,terms=10000)
plot(sNeg,zNegativeArg,type="l",ann=FALSE)
abline(h=0,v=0,col="green")
title("The zeta function for argument between 0 and -26")

sNeg <- seq(-0.1,-32.1,by=-0.1)
zNegativeArg <- sapply(sNeg,zetaMinusOne,terms=10000)
plot(sNeg,zNegativeArg,type="l",ann=FALSE)
abline(h=0,v=0,col="green")
title("The zeta function for argument between 0 and -32")

par(opar)
