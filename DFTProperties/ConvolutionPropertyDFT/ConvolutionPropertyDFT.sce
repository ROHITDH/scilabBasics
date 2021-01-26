//Circular Convolution Property of DFT
clc
clear
close

x1 = input("sequence x1(n): ")
x2 = input("sequence x2(n): ")

//zero padding
lx1 = length(x1)
lx2 = length(x2)
mx = max(lx1,lx2)

x1 = [x1 zeros(1,mx-lx1)]
x2 = [x2 zeros(1,mx-lx2)]

exec("C:\Users\_\Desktop\scilabB\ConvolutionPropertyDFT\cconvCustomFunction.sce");
//lhs = x1(n)*x2(n)
lhs = cconv(x1,x2)
disp("LHS: ",lhs')

//rhs = X1(K).X2(K)
rhs = fft(x1).*fft(x2)
rhs = ifft(rhs)
disp("RHS: ",rhs)


//plot
n_lhs = 0:length(lhs)-1
n_rhs = 0:length(rhs)-1
figure(1)
subplot(211)
plot2d3(n_lhs,lhs')
plot(n_lhs,lhs','red.')
title("lhs = x1(n)*x2(n)")
xlabel("---> Samples n")
ylabel("Amplitude")

subplot(212)
plot2d3(n_rhs,rhs)
plot(n_rhs,rhs,'red.')
title("rhs = idft(X1(K).X2(K))")
xlabel("--->  n")
ylabel("Amplitude")
