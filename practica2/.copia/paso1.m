 % script paso1.m


% parametros generales
fs = 8192; % frecuencia de muestreo
fp = 1000; % frecuencia de paso [32,2048] Hz
delta = .5; % tamano de banda transicion en octavas [0,log2(2048/fp)]
fr = fp*2^delta; % frecuencia de rechazo [fp,2048] Hz
A = 45; % [20,60] dB
dltr = 10^(-A/20); % deltar (rechazo)
dltp = dlts; % deltap (paso)

% calculo de la beta
if (A >= 50) 
    beta = .1102*(A-8.7);
elseif(A>21 && A <50)
    beta = .5842*(A-12)^.4 + .07886*(A-12); 
else
    beta = 0;
end

% frecuencias en discreta
ffr = fr/fs; % se divide por la frecuencia de muestreo
ffp = fp/fs;
ffc = (ffr+ffp)/2; % frecuencia central

% calculo de la M 
M = (A-8)/(14.35*(ffr-ffp));
M = 2*ceil(M/2); % calculamos el primer M par mas cercano al valor calculado

% vector de eje de tiempo
n = [0:M]; 

% obtencion de la ventana de kaiser
w = besseli(0,beta*sqrt(1-(1-2*n/M).^2))/besseli(0,beta);
% filtro con ventana de kaiser y la senal sinc(cuadrada en el dom del tiempo)
a = w.*sinc(2*ffc*(n-M/2));

% representacion del FPB
figure(1);
stem (n,a,'r');
title("Filtro Paso Bajo");
ylabel("a[n]");
xlabel("n");
grid on;
