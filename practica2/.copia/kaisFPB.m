function h = kaisFPB(fs,fp,delta,A)
% h = kaisFPB(fs,fp,delta,A)
%
% La funcion kaiser entrega los coeficientes de un filtro paso
% bajo con las especificaciones de la frecuencia de muestreo, 
% la frecuencia de paso, el ancho de la banda de transicion y
% la atenuacion en la banda de rechazo.
%
% * h: vector con los coeficientes del filtro paso bajo
% * fs: frecuencia de muestreo
% * fp: frecuencia de paso
% * delta: ancho de la banda de transicion
% * A: atenuacion en la banda de rechazo 

fr = fp*2^delta;
% Calculo de la beta
if (A>=50)
    beta = .1102*(A-8.7);
elseif(A >21 && A <50)
    beta = .5842*(A-12)^.4 + .07886*(A-12);
else
    beta = 0;
end

% frecuencias en discreta
ffr=fr/fs;
ffp=fp/fs;
ffc=(ffr+ffp)/2;

% Calculo de M
M = (A-8)/(14.35*(ffr-ffp));
M = 2*ceil(M/2);

% vector de tiempo en discreta
n = [0:M];

% obtencion de la ventana de kaiser
w = besseli(0,beta*sqrt(1-(1-2*n/M).^2))/besseli(0,beta);
% filtro paso bajo
h = w.*sinc(2*ffc*(n-M/2));
end
