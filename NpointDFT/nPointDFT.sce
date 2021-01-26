//computation of N point dft
clear
clc
close

x = input("Enter sequence x(n): ")
N = input("Enter no.of points of DFT: ")

//dft by calculation
n = 0:N-1;
k = n;

WN = exp(-%i*(2*%pi)/N)
kn = k'*n
W = WN .^ kn
X = W * x'
disp("DFT (calculation): ",X)   

/*X1 = x * exp(-%i*2*%pi.*k'*n/N)
disp("DFT (calculation): ",X1)*/

Xmag = abs(X)
Xphase = atan(imag(X),real(X))

disp("Magnitude Response of X(K): ",Xmag)
disp("Phase Response of X(K): ",Xphase)

figure(1)
subplot(211)
plot2d3(n,Xmag)
title("Magnitude Response (calculation)")
xlabel("---> samples (k)")
ylabel("Magnitude")
a1 = gca()
a1.x_location = 'origin'
a1.y_location = 'origin'

subplot(212)
plot2d3(n,Xphase)
title("Phase Response (calculation)")
xlabel("---> samples (k)")
ylabel("Phase")
a2 = gca()
a2.x_location = 'origin'
a2.y_location = 'origin'



///DFT by inbuilt command
X_ = fft(x)
disp("DFT (inbuilt command): ",X_')   

X_mag = abs(X_)
X_phase = atan(imag(X_),real(X_))

disp("Magnitude Response of X(K): ",X_mag')
disp("Phase Response of X(K): ",X_phase')

figure(0)
subplot(211)
plot2d3(k,X_mag)
title("Magnitude Response (inbuilt fn)")
xlabel("---> samples (k)")
ylabel("Magnitude")
a3 = gca()
a3.x_location = 'origin'
a3.y_location = 'origin'

subplot(212)
plot2d3(k,X_phase)
title("Phase Response (inbuilt fn)")
xlabel("---> k")
ylabel("Phase")
a4 = gca()
a4.x_location = 'origin'
a4.y_location = 'origin'
