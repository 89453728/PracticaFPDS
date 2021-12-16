function [espectro,f] = FPDS_P1_ANAESP (N,L,beta,f1,fs,graph)
    % [espectro, f] = FPDS_P1_ANAESP (N,L,beta,f1,fs)
    %
    % Esta funcion devuelve el espectro positivo de la senal
    % x con su lobulo central centrado en la frecuencia f1
    % aplicando para ello una ventana de tipo Kaiser que se 
    % encarga de arreglar el efecto de los lobulos secundarios
    % eliminandolos mas o menos segun el parametro de forma beta
    % y del numero de muestras M que depende de L
    %
    % * espectro: El espectro de la senal en un vector de N 
    %   elementos
    % * f: localizador de la figura donde se grafica el espectro
    % * N: numero de muestras del espectro
    % * beta: coeficiente de forma de la ventana kaiser
    % * f1: tono de la senal cosenoide
    % * fs: frecuencia de muestreo
    % * graph: 1 -> grafica la senal, 0 -> no la grafica
    %
    %

    n = 0:(L-1);
    w1 = 2*pi*f1;
    wn = [0:(N-1)]/N - .5;
    M = L-1;

    x = cos(w1*n);
    w = besseli(0,sqrt(1-(1-2*n/M).^2))/besseli(0,beta);

    v = x.*w;

    espectro = (1/sqrt(2)) * fftshift(abs(fft([v zeros(1,N-L)])));
    
    if (graph==1)
        f = figure(1);
        plot(wn*fs, espectro, 'b');
        title(["Espectro de la senal con tono " num2str(f1)]);
        axis([0 fs/2 -40 0]);
        xlabel("eje de frecuencia Hz");
        ylabel("modulo del espectro");
        grid on;
    else
        f = -1;
    end

end
