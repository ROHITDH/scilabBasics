//multiplication property of DFT
clc
clear
close

x1 = input("sequence x1(n): ")
x2 = input("sequence x2(n): ")

lx1 = length(x1)
lx2 = length(x2)
N = max(lx1,lx2)

x1 = [x1 zeros(1,N-lx1)]
x2 = [x2 zeros(1,N-lx2)]

//lhs = x1 . x2
lhs = x1.*x2
disp("LHS: ",lhs)

//rhs = (X1 * X2)/N
exec("C:\Users\_\Desktop\scilabB\MultiplicationPropertyDFT\cconvCustomFunction.sce");
rhs = cconv(fft(x1),fft(x2))/N
rhs = ifft(rhs)
disp("RHS: ",rhs')


//plot
n_lhs = 0:length(lhs)-1;
n_rhs = 0:length(rhs)-1;
figure(0)
subplot(211)
plot2d3(n_lhs,lhs)
plot(n_lhs,lhs,'red.')
title("lhs = x1 . x2")
xlabel("---> Samples n")
ylabel("Amplitude")
a1 = gca()
a1.x_location = 'origin'
a1.y_location = 'origin'


subplot(212)
plot2d3(n_rhs,rhs')
plot(n_rhs,rhs','red.')
title("rhs = idft((X1 * X2)/N)")
xlabel("---> Samples n")
ylabel("Amplitude")
a2 = gca()
a2.x_location = 'origin'
a2.y_location = 'origin'
