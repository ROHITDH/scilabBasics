//Parsvals theorem of DFT
clc
clear
close

x1 = input("sequence x1(n): ")
x2 = input("sequence x2(n): ")

//zero padding
lx1 = length(x1)
lx2 = length(x2)
N = max(lx1,lx2)

x1 = [x1 zeros(1,N-lx1)]
x2 = [x2 zeros(1,N-lx2)]

X1 = fft(x1)
X2 = fft(x2)

lhs = sum(x1.*x2)
rhs = sum(X1.*conj(X2))/N

disp("LHS: ",lhs)
disp("RHS: ",rhs)
