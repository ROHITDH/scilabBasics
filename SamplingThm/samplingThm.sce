//nequest theorem
clc
clear
close
/////////////////////////////////////////  
/////////////////////////////////////////  
a1 = input("amplitude of signal 1: ")
a2 = input("amplitude of signal 2: ")
a3 = input("amplitude of signal 3: ")

f1 = input("freq. of signal 1: ")
f2 = input("freq. of signal 2: ")
f3 = input("freq. of signal 3: ")

t = 0:0.001:1

x_t = a1*cos(2*%pi*f1*t) + a2*cos(2*%pi*f2*t) + a3*cos(2*%pi*f3*t) 
/////////////////////////////////////////     
/////////////////////////////////////////     
fs1 = input("sampling freq < 2fmax: ")
T1 = 1/fs1
n1 = 0:fs1
nT1 = n1*T1;
x_n1 = a1*cos(2*%pi*f1*nT1) + a2*cos(2*%pi*f2*nT1) + a3*cos(2*%pi*f3*nT1)
/////////////////////////////////////////   
fs2 = input("sampling freq = 2fmax: ")
T2 = 1/fs2
n2 = 0:fs2
nT2 = n2*T2;
x_n2 = a1*cos(2*%pi*f1*nT2) + a2*cos(2*%pi*f2*nT2) + a3*cos(2*%pi*f3*nT2)
/////////////////////////////////////////  
fs3 = input("sampling freq > 2fmax: ")
T3 = 1/fs3
n3 = 0:fs3
nT3 = n3*T3;
x_n3 = a1*cos(2*%pi*f1*nT3) + a2*cos(2*%pi*f2*nT3) + a3*cos(2*%pi*f3*nT3)
/////////////////////////////////////////  
/////////////////////////////////////////  

figure(1)
subplot(311)
plot(t,x_t)
title("signal to be sampled")
xlabel("--> time (t)")
ylabel("Amplitude")
a11 = gca()
a11.x_location = 'origin'
a11.y_location = 'origin'

subplot(312)
plot2d3(n1,x_n1)
plot(n1,x_n1,'red.')
title("undersampled signal")
xlabel("--> samples (n)")
ylabel("Amplitude")
a12 = gca()
a12.x_location = 'origin'
a12.y_location = 'origin'

subplot(313)
xm = splin(nT1,x_n1)
xr = interp(nT1,nT1,x_n1,xm)
plot(n1,x_n1)
title("reconstructed signal")
xlabel("--> samples (n)")
ylabel("Amplitude")
a13 = gca()
a13.x_location = 'origin'
a13.y_location = 'origin'
/////////////////////////////////////////  
figure(2)
subplot(311)
plot(t,x_t)
title("signal to be sampled")
xlabel("--> time (t)")
ylabel("Amplitude")
a21 = gca()
a21.x_location = 'origin'
a21.y_location = 'origin'

subplot(312)
plot2d3(n2,x_n2)
plot(n2,x_n2,'red.')
title("sampled at fs = 2fmax  of signal")
xlabel("--> samples (n)")
ylabel("Amplitude")
a22 = gca()
a22.x_location = 'origin'
a22.y_location = 'origin'

subplot(313)
xm = splin(nT2,x_n2)
xr = interp(nT2,nT2,x_n2,xm)
plot(n2,x_n2)
title("reconstructed signal")
xlabel("--> samples (n)")
ylabel("Amplitude")
a23 = gca()
a23.x_location = 'origin'
a23.y_location = 'origin'
/////////////////////////////////////////  
figure(3)
subplot(311)
plot(t,x_t)
title("signal to be sampled")
xlabel("--> time (t)")
ylabel("Amplitude")
a31 = gca()
a31.x_location = 'origin'
a31.y_location = 'origin'

subplot(312)
plot2d3(n3,x_n3)
plot(n3,x_n3,'red.')
title("sampled at fs>2fmax of signal")
xlabel("--> samples (n)")
ylabel("Amplitude")
a32 = gca()
a32.x_location = 'origin'
a32.y_location = 'origin'

subplot(313)
xm = splin(nT3,x_n3)
xr = interp(nT3,nT3,x_n3,xm)
plot(n3,x_n3)
title("reconstructed signal")
xlabel("--> samples (n)")
ylabel("Amplitude")
a33 = gca()
a33.x_location = 'origin'
a33.y_location = 'origin'
/////////////////////////////////////////  
/////////////////////////////////////////  
