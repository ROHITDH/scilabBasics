//fir filter design
//[h Hw w] = wfir(ftype,forder,cfreq,wtype,fpar)

clc
clear
close

//1.initializing given parameters
fs = 44100
N = 31
ftype = 'lp'
wtype = 'hm'
cfreq = [2000/fs 0]
fpar = [0 0]

//2.getting Filter coefficients and h(n) Plot
[h Hw w] = wfir(ftype,N,cfreq,wtype,fpar)
disp("Filter coefficients (impulse res.): ",h)
n1 = 1:N

figure(0)
plot2d3(n1,h)
plot(n1,h,'red.')
title("Filter coefficients (impulse res.) h(n)")
xlabel("---> Order n")
ylabel("Amplitude")
a1 = gca()
a1.x_location = 'origin'
a1.y_location = 'origin'

//3.1.Magnitude freq. response (power-ratio) Plot
figure(1)
subplot(211)
plot(w*fs,Hw)
title("Magnitude freq. response (power-ratio)")
xlabel("---> Frequency w")
ylabel("H(w)")
a2 = gca()
a2.x_location = 'origin'
a2.y_location = 'origin'

//3.2.Magnitude freq. response (dB values) Plot
Hw_dB = 20*log(Hw)
subplot(212)
plot(w*fs,Hw_dB)
title("Magnitude freq. response (dB)")
xlabel("---> Frequency w")
ylabel("H(w) (dB)")
a3 = gca()
a3.x_location = 'origin'
a3.y_location = 'origin'

//4.Read and play audio file
[x fs bits] = wavread("C:\Users\_\Desktop\scilabB\firFilter\sound.wav")
disp("Sampling Freq of audio file: ",fs)
playsnd(x,fs)
sleep(length(x)/fs,'s')

//5.1.Plotting audio signal in time domain
figure(2)
subplot(311)
plot(x)
title("audio signal in time domain")
xlabel("---> time")
ylabel("Amplitude")
a4 = gca()
a4.x_location = 'origin'
a4.y_location = 'origin'

//5.2.Plotting audio in freq domain bef. sampling
X = fft(x)
X_mag = abs(X)
k = 0:length(X)-1
subplot(312)
plot(k*fs/length(x),X_mag/(fs/2))
title("audio in freq domain bef. sampling")
xlabel("---> freq.")
ylabel("Amplitude")
a5 = gca()
a5.x_location = 'origin'
a5.y_location = 'origin'

//6.Filtering and plotting
y = conv(x,h)
playsnd(y,fs)
Y = fft(y)
Y_mag = abs(Y)
k = 0:length(Y)-1
subplot(313)
plot(k*fs/length(y),Y_mag/(fs/2))
title("audio in freq domain after. sampling")
xlabel("---> freq.")
ylabel("Amplitude")
a6 = gca()
a6.x_location = 'origin'
a6.y_location = 'origin'
