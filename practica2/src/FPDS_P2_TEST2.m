% test2.m
% script para testear el buffer circular

clear all;
try 
    clf(1);
catch
    close all;
end

x = [1 3 1 -1 -3 -1 0 1 2 3];


M = 6;
buffer = zeros(1,10);

% implementacion 
for iter = 1:length(x) 
    buffer = [buffer(2:end) x(iter)];
    stem([1:M],buffer,'r');
    pause(.2);
end  
