//auto and cross correlation properties
clc
clear
close

///////////////////////////////
//auto correlation properties//
///////////////////////////////
x = input("sequence x(n): ")
y = input("sequence y(n): ")

disp("Auto correlation properties: ")
//1. rxx(l) = rxx(-l)
disp("1. rxx(l) = rxx(-l)")
[lhs lag1] = xcorr(x,x)
[rhs lag2] = xcorr(x,x)
rhs = flipdim(rhs,2)
disp("rxx(l) : ",lhs)
disp("rxx(-l): ",rhs)

//2. |rxx(l)| <= sqrt(rxx(0).rxx(0))
disp("2. |rxx(l)| <= sqrt(rxx(0).rxx(0))")
[lhs1 lag3] = xcorr(x,x)
rhs1        = sqrt(max(xcorr(x,x))*max(xcorr(x,x)))
disp("lhs: ",lhs1)
disp("no samples in lhs in greater than : ",rhs1) 

//plots
figure(0)
subplot(211)
plot2d3(lag1,lhs)
plot(lag1,lhs,'red.')
title("rxx(l)")
xlabel("---> samples n")
ylabel("Amplitude")
a1 = gca()
a1.x_location = 'origin'
a1.y_location = 'origin'

subplot(212)
plot2d3(lag2,rhs)
plot(lag2,rhs,'red.')
title("rxx(-l)")
xlabel("---> samples n")
ylabel("Amplitude")
a2 = gca()
a2.x_location = 'origin'
a2.y_location = 'origin'



disp("--------------------------------------")
///////////////////////////////
//cross correlation properties//
///////////////////////////////
disp("Cross correlation properties: ")
//1. rxy(l) = rxy(-l)
disp("1. rxy(l) = rxy(-l)")
[lhs lag1] = xcorr(x,y)
[rhs lag2] = xcorr(x,y)
rhs = flipdim(rhs,2)
disp("rxy(l) : ",lhs)
disp("rxy(-l): ",rhs)

//2. |rxy(l)| <= sqrt(rxx(0).ryy(0))
disp("2. |rxy(l)| <= sqrt(rxx(0).ryy(0))")
[lhs1 lag3] = xcorr(x,y)
rhs1        = sqrt(max(xcorr(x,x))*max(xcorr(y,y)))
disp("lhs: ",lhs1)
disp("no samples in lhs in greater than : ",rhs1) 

//plots
figure(1)
subplot(211)
plot2d3(lag1,lhs)
plot(lag1,lhs,'red.')
title("rxy(l)")
xlabel("---> samples n")
ylabel("Amplitude")
a1 = gca()
a1.x_location = 'origin'
a1.y_location = 'origin'

subplot(212)
plot2d3(lag2,rhs)
plot(lag2,rhs,'red.')
title("rxy(-l)")
xlabel("---> samples n")
ylabel("Amplitude")
a2 = gca()
a2.x_location = 'origin'
a2.y_location = 'origin'
