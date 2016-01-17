#Count the number of zeros up to the height T (imaginary part of complex number)
#N(T)
#p258
x <- c(100,1000,10000,100000,1000000)
y <- x/(2*pi) * log(x/(2*pi)) - x/(2*pi)
plot(x,y,type="l")
title("Number of zeros up to the height T")