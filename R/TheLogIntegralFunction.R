#Li(x) is the log integral function (integral of 1/logx)
#p115
options(digits=20)
integrand <- function(x) {1/log(x)}

Li <- function(x) {
  if(x < 1){
    negativearea <- integrate(integrand, lower = 0, upper = x)
    return (as.numeric(negativearea[1]))
  }
  else if (x > 1){
    negativearea <- integrate(integrand, lower = 0, upper = 0.9)
    positivearea <- integrate(integrand, lower = 1.1, upper = x)
    return (as.numeric(positivearea[1])+as.numeric(negativearea[1]))
  }
  else
    return (-10);
}

x <- seq(0,10,by=0.01)
y <- sapply(x,Li)
plot(x,y,type="l",col="blue",ann=FALSE)
abline(h=0,v=1,col="green")
title("The Log Integral Function",xlab="x values",ylab="Li(x) = blue")