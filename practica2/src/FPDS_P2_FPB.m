function y = FPDS_P2_FPB(x,fs,fp,delta,A) 
% y = FPDS_P2_FPB(x,fs,fp,delta,A)
% 
% FPB hace pasar la senal x por un filtro paso bajo digital
% obtenido mediante enventanado de ksiser 
% ver "help FPDS_P2_DIS" para mas informacion.
% la senal se pasa mediante un buffer circular del tamano del
% filtro y finalmente se obtiene y como una convolucion.
%
% * y: es la senal resultante de pasar x por el filtro
% * x: la senal a filtrar
% * fs,fp,delta,A: parametros para FPDS_P2_DIS
%
%

h = FPDS_P2_DIS(fs,fp,delta,A); % filtro obtenido con kaiser
M = length(h); % tamano del buffer

L = length(x); % tamano de la senal x
xtemp = [x zeros(1,M)]; % x expandida con 0's
buffer = zeros(1,M); % buffer del tamano del sistema FIR

y = []; % senal y

for iter = 1:L
    buffer = [xtemp(iter) buffer(1:end-1)];
    y = [y buffer*h'];
end
end
