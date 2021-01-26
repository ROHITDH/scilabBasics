//circular convolution
clc
clear
close

x = input("sequence x(n): ")
h = input("sequence h(n): ")

//zero padding
lx = length(x);
lh = length(h);

N = max(lx,lh)

x = [x zeros(1,N-lx)]
h = [h zeros(1,N-lh)]


//to get the first row of matrix
xm = [x(1) flipdim(x(2:N),2)]
disp(xm)
y  = sum(xm .* h)

//to get remaining rows
for n = 2:N
    xm = [xm(N) xm(1:N-1)]
    y(n) = sum(xm.*h)
    disp(xm)
end

disp("Convolved sequence: ",y')


//plots
x_n = 0:length(x)-1
h_n = 0:length(h)-1
y_n = 0:length(y)-1

figure(1)
subplot(311)
plot2d3(x_n,x)
plot(x_n,x,'red.')
title("x(n)")
xlabel("---> samples (n)")
ylabel("Amplitude")
a1 = gca()
a1.x_location = 'origin'
a1.y_location = 'origin'

subplot(312)
plot2d3(h_n,h)
plot(h_n,h,'red.')
title("h(n)")
xlabel("---> samples (n)")
ylabel("Amplitude")
a2 = gca()
a2.x_location = 'origin'
a2.y_location = 'origin'

subplot(313)
plot2d3(y_n,y')
plot(y_n,y','red.')
title("y(n)")
xlabel("---> samples (n)")
ylabel("Amplitude")
a2 = gca()
a2.x_location = 'origin'
a2.y_location = 'origin'
