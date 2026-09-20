%% DRIVER AKAR: siapkan fungsi, panggil dua algoritma, analisis hasil
clear; clc; close all; format long g
f = @(x) x.^3-x-1;
a=1; b=1.5; tol=1e-8; maxit=100;

[xB,hB] = biseksi_fun(f,a,b,tol,maxit);
[xR,hR] = regula_fun(f,a,b,tol,maxit);
fprintf('Biseksi: %.12f; residual %.3e\n',xB,abs(f(xB)));
fprintf('Regula : %.12f; residual %.3e\n',xR,abs(f(xR)));
disp(hB); disp(hR);

figure
semilogy(hB.iter,max(hB.err,eps),'o-',...
         hR.iter,max(hR.err,eps),'s-'); grid on
xlabel('Iterasi'); ylabel('Perubahan relatif berskala')
legend('Biseksi','Regula Falsi','Location','best')
title('Konvergensi akar')
