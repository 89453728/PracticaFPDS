% test3.m
% script para simular estructura plegada

f1 = 100; % Hz
fs = 2^13; % Hz 
fp = 2048; % Hz 
delta = .5; % oct
A = 42; % dB
w1 = 2*pi*f1; % rad/s

% obtengo los coef kaiser
h = kaisFPB(fs,fp,delta,A);
M = length(h);

L = 500;
n = [0:L-1]/fs;
x = sin(w1*n);

xtemp = [x zeros(1,M)]; % expando en ceros para completar el filtrado
buffer = zeros(1,M); % buffer para ir desplazando la senal x

y = [];
% esto es literalmente la convolucion
for iter = 1:length(x) 
    %buffer = [buffer(2:end) xtemp(iter)]; % buffer hacia la izquierda
    buffer = [xtemp(iter) buffer(1:end-1)]; % "" la derecha
    y = [y sum(buffer.*h)];
end

stem([1:length(y)]/fs,y,'r');


% visualizarlo en el dominio de la frecuencia
% si acaso lo piden

