//commutative property of convolution
clc
clear
close

x = input("Sequence x(n): ")
h = input("Sequence h(n): ")

lhs = conv(x,h)
rhs = conv(h,x)

disp("LHS : x(n) * h(n) : ",lhs)
disp("RHS : h(n) * x(n) : ",rhs)

//plots
lhs_n = 0:length(lhs)-1
rhs_n = lhs_n;
figure(1)
subplot(211)
plot2d3(lhs_n,lhs)
plot(lhs_n,lhs,'red.')
title("LHS: x(n)*h(n)")
xlabel("---> samples n")
ylabel("Amplitude")
a1 = gca()
a1.x_location = 'origin'
a1.y_location = 'origin'

subplot(212)
plot2d3(rhs_n,rhs)
plot(rhs_n,rhs,'red.')
title("RHS: h(n)*x(n)")
xlabel("---> samples n")
ylabel("Amplitude")
a2 = gca()
a2.x_location = 'origin'
a2.y_location = 'origin'
