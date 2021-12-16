% fichero FPDS_P1_TEST2.m

close all; 
clear all;

fs = 2^13; % frecuencia de muestreo 
L = 2^6; % numero de muestras
k = 2^9; % valor de k

n = 0:(L-1); % vector de muestras
f1 = 2^10;
N = 2^9;
w1 = 2*pi*f1/fs;

x = cos(w1*n);


wn = ((0:(N-1)))/N - .5;
ww = 2*pi*wn;

ftx = .5*exp (-i*(L-1)/2*(ww-w1)).*(sin((ww-w1)*L/2))./(sin((ww-w1)/2)) ...
        +  .5*exp(-i*(L-1)./2*(ww-(2*pi-w1))).*sin((ww-(2*pi-w1))*L/2)./...
        (sin((ww-(2*pi-w1))/2));

fig = figure(1);
plot(ww,abs(ftx),'r');
hold on; 
grid on;
