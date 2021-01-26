//DFT properties
//Linearity property
clc
clear
close

a = input("Constant a: ")
b = input("Constant b: ")

x1 = input("sequence x1(n): ")
x2 = input("sequence x2(n): ")

lx1 = length(x1)
lx2 = length(x2)
mx = max(lx1,lx2)

//padding zeroes
x1 = [x1 zeros(1,mx-lx1)]
x2 = [x2 zeros(1,mx-lx2)]

//lhs = ax1(n)+bx2(n)
lhs = a*x1 + b*x2
disp("LHS: ",lhs)

//rhs = aX1(K)+bX2(K)
X1 = fft(x1)
X2 = fft(x2)
rhs = a*X1 + b*X2
rhs = ifft(rhs)
disp("RHS ",rhs)


//plot
n_lhs = 0:length(lhs)-1
figure(0)
subplot(211)
plot2d3(n_lhs,lhs)
title("LHS ax1(n)+bx2(n)")
xlabel("---> samples n")
ylabel("Amplitude")
a1 = gca()
a1.x_location = 'origin'
a1.y_location = 'origin'

k_rhs = 0:length(rhs)-1
subplot(212)
plot2d3(k_rhs,rhs)
title("RHS idft(aX1(K)+bX2(K))")
xlabel("---> n")
ylabel("Amplitude")
a2 = gca()
a2.x_location = 'origin'
a2.y_location = 'origin'
