#Count the number of factors for a given argument 
#d(N)
#p36
#http://stackoverflow.com/questions/6424856/r-function-for-returning-all-factors
#install.packages("numbers")
library(numbers)
opar <- par(no.readonly=TRUE)
par(mfrow=c(2,1))

f <- function(x) {
  x <- as.integer(x)
  div <- seq_len(abs(x))
  factors <- div[x %% div == 0L]
  return (length(factors))
}
x <- c(1:100)

y <- sapply(x,f)
plot(x,y,type="l")
title("Factor Counting Function")

f <- function(x){
  y <- primeFactors(x) 
  return (length(y))
}

y <- sapply(x,f)
plot(x,y,type="l")
title("Prime Factor Counting Function")

par(opar)