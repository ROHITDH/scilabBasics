//find dft of sinc function

clc
clear
close

//our x axis varying from -10 to 10 in the steps of 0.1
n = -10:0.1:10 

//width of sinc function
s = 1

///////generate sinc function/////
for i = 1:length(n)
    if n(i) == 0
        x(i) = 1
    else
        x(i) = sin(%pi*s*n(i)) ./ (%pi*s*n(i))
    end    
end
/////////////////////////////////

figure(0)
subplot(211)
plot2d3(n,x)
title("Sinc function")
xlabel("----n")
ylabel("x(n)")
a1 = gca()
a1.x_location = 'origin'
a1.y_location = 'origin'

//////////take dft///////

X = fft(x)
X_mag = abs(X)


k = n
subplot(212)
plot2d3(k,fftshift(X_mag))
title("DFT of sinc function")
xlabel("----> k")
ylabel("|X(k)|")
a2 = gca()
a2.x_location = 'origin'
a2.y_location = 'origin'
//if width of sinc function in time domain increases,
//the width of the rectangular pulse in freq domain decrease
