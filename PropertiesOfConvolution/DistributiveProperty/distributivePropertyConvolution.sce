//Distributive Property
clc
clear
close

x  = input("Sequence x(n): ")
h1 = input("Sequence h1(n): ")
h2 = input("Sequence h2(n): ")

//zero padding
l_h1 = length(h1)
l_h2 = length(h2)
N = max(l_h1,l_h2)

h1 = [h1 zeros(1,N-l_h1)]
h2 = [h2 zeros(1,N-l_h2)]

//lhs = x(n)*[h1(n)+h2(n)]
lhs = conv(x,(h1+h2))
//rhs = x(n)*h1(n) + x(n)*h2(n)
rhs = conv(x,h1)+conv(x,h2)

disp("LHS: ",lhs)
disp("RHS: ",rhs)

//plot
n_lhs = 0:length(lhs)-1
n_rhs = 0:length(rhs)-1

figure(0)
subplot(211)
plot2d3(n_lhs,lhs)
title('LHS')
xlabel('---> samples n')
ylabel('Amplitude')
a1 = gca()
a1.x_location = 'origin'
a1.y_location = 'origin'

subplot(212)
plot2d3(n_rhs,rhs)
title('RHS')
xlabel('---> samples n')
ylabel('Amplitude')
a2 = gca()
a2.x_location = 'origin'
a2.y_location = 'origin'
