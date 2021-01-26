//find dft of a rectangular pulse --> sinc function
clear
clc
close

n = -10:0.1:10
a = 1

for i = 1:length(n)
    if(n(i)>=-a & n(i)<=a)
        x(i) = 1
    else
        x(i) = 0
    end
end

figure(0)
subplot(211)
plot2d3(n,x)
title("Rectangular pulse")
xlabel("---->n")
ylabel("x(n)")
a1 = gca()
a1.x_location = 'origin'
a1.y_location = 'origin'


k = n
X = fft(x)
X_mag = abs(X)


subplot(212)
plot2d3(k,fftshift(X_mag))
title("DFT of rectangular pulse")
xlabel("----> k")
ylabel("|X(k)|")
a2 = gca()
a2.x_location = 'origin'
a2.y_location = 'origin'
