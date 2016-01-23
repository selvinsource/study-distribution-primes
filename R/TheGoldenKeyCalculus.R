#The Golden Key (calculus version):
#1/2*log(Z(s)) = integral J(x) * x^(-s-1)
#p309
#p311
library(numbers)
options(digits=20)
opar <- par(no.readonly=TRUE)
par(mfrow=c(2,1))

zeta <- function(s,terms) {
  x <- c(1:terms)
  sum(1/x^s)
}

π <- function(x){
  if(!x%%1==0){
    return (length(Primes(floor(x))))
  }
  else{
    if(length(Primes(floor(x))) == length(Primes(floor(x-1))))
      return (length(Primes(floor(x))))       
    else
      return (length(Primes(floor(x))) - 1/2)
  }
}

J <- function(x) {
  t <- 1
  y <- 0
  while(x^(1/t) >= 2){
    y <- y + 1/t*π(x^(1/t))
    t <- t+1
  }
  return (y)
}

integrateJFun <- function(s){
  integrandJFun <- function(x){
    sapply(x,J) * x^(-s-1)
  }
  integrateJ <- integrate(integrandJFun, lower = 0, upper = 500, subdivisions=2000)
  integrateJ[1]
}

s <- seq(1,10,by=0.1)
Z <- sapply(s,zeta,terms=10000)
logZ <- 1/s*log(Z)
integrateJ <- sapply(s,integrateJFun)

plot(s,logZ,type="l",ann=FALSE)
lines(s,integrateJ,col="blue")
abline(h=1,v=1,col="green")
title("Riemann's Calculus version",xlab="s",ylab="1/s*log(Z(s)) = black, integral(J(x)*x^(-s-1)) = blue")

s <- 1.2
x <- seq(1,20,by=0.1)
integrandJ <- sapply(x,J) * x^(-s-1)
plot(x,integrandJ,type="l",ann=FALSE)
title("Integrand Function: J(x)*x^(-s-1) for s=1.2",xlab="x")

par(opar)
