//auto and cross correlation
clc
clear
close

x = input("Sequence x(n): ")
y = input("Sequence y(n): ")

//auto correlation
[rxx lag1] = xcorr(x,x)
disp("auto correlation of x: ",rxx)

//cross correlation
[rxy lag2] = xcorr(x,y)
disp("auto correlation of x: ",rxy)

//plots
figure(0)
subplot(211)
plot2d3(lag1,rxx)
plot(lag1,rxx,'red.')
title("Auto correlation")
xlabel("---> samples n")
ylabel("Amplitude")
a1 = gca()
a1.x_location = 'origin'
a1.y_location = 'origin'

subplot(212)
plot2d3(lag2,rxy)
plot(lag2,rxy,'red.')
title("Cross correlation")
xlabel("---> samples n")
ylabel("Amplitude")
a2 = gca()
a2.x_location = 'origin'
a2.y_location = 'origin'
