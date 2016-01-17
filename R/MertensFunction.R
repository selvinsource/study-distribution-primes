#Mertens's function: M(k) = O(k^1/2)
#M(k) is the cumulative value of the mobius function
#p250
#p322
library(numbers)
options(digits=20)

x <- seq(1,500,by=1)
y1 <- sapply(x,mertens)
plot(x,y1,type="l",col="blue",ann=FALSE)
lines(x,0.2*x^(1/2), col="red")
title("Mertens's function: M(k) = O(k^1/2)",xlab="k",ylab="O(k^1/2)=red, M(k)=blue")