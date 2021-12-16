% fichero FPDS_P1_TEST1.m

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

% Parte 1: Graficar la señal x

f = figure(1); % muestra de la señal recien calculada
stem(n,x);
