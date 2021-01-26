//associative property of convolution
clc
clear
close

x = input("sequence x(n): ")
h1 = input("sequence h1(n): ")
h2 = input("sequence h2(n): ")

//lhs = [x(n)*h1(n)]*h2(n) 
lhs = conv(conv(x,h1),h2)
//rhs = x(n)*[h1(n)*h2(n)]
rhs = conv(x,conv(h1,h2))

disp("LHS: ",lhs)
disp("RHS: ",rhs)

//plotting
n_lhs = 0:length(lhs)-1
n_rhs = 0:length(rhs)-1

figure(0)
subplot(211)
plot2d3(n_lhs,lhs)
plot(n_lhs,lhs,'red.')
title("LHS : [x(n)*h1(n)]*h2(n)") 
xlabel("---> Samples n")
ylabel("Amplitude")
a1 = gca();
a1.x_location = 'origin'
a1.y_location = 'origin'

subplot(212)
plot2d3(n_rhs,rhs)
plot(n_rhs,rhs,'red.')
title("RHS : x(n)*[h1(n)*h2(n)]") 
xlabel("---> Samples n")
ylabel("Amplitude")
a2 = gca();
a2.x_location = 'origin'
a2.y_location = 'origin'
