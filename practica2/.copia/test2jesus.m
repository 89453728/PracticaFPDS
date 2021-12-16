clear all;
close all;

y = [1 3 1 -1 -3 -1 0 1 2 3 0 0 0 0 0];
x = rand(1,200);

L = length(x);
M=6;
buffer=zeros(1,M);
p=M-1;
for n=1:L
    
    buffer(1+p) = x(n); 
    p = mod(p-1,M); % if (p>0) -> p=p-1; else p=M-1
    
    hold off;
    
    stem(0:(M-1),buffer,'r');
    hold on; grid on;
    plot(1+p,0,'rx');
    
    pause(0.3);
end
