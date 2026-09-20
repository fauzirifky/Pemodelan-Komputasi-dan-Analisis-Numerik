%% Praktikum 7: Romberg
clear; clc; format long g
f=@(x) exp(x).*sin(x)./(1+x.^2); a=0; b=2;
[R,I]=romberg_fun(f,a,b,6);
Iref=integral(f,a,b,'AbsTol',1e-13,'RelTol',1e-13);
disp(R); fprintf('Romberg=%.12f, referensi=%.12f, error=%.3e\n',I,Iref,abs(I-Iref));
