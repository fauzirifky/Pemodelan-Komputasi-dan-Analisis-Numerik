%% DRIVER SPL: data, pemanggilan function, tabel, grafik
clear; clc; close all; format long g
A=[10 -1 2;-1 11 -1;2 -1 10]; b=[6;25;-11];
x0=zeros(3,1); tol=1e-8; maxit=100;
xexact=A\b;
[xj,hj]=jacobi(A,b,x0,tol,maxit);
[xg,hg]=gauss_seidel(A,b,x0,tol,maxit);
disp('Solusi eksak, Jacobi, Gauss-Seidel:');disp([xexact,xj,xg]);
disp(hj);disp(hg);
figure
semilogy(hj.iter,max(hj.err,eps),'o-',...
         hg.iter,max(hg.err,eps),'s-'); grid on
xlabel('Iterasi');ylabel('Galat iterasi berskala')
legend('Jacobi','Gauss-Seidel','Location','best')
title('Konvergensi SPL')
figure
semilogy(hj.iter,max(hj.residual,eps),'o-',...
         hg.iter,max(hg.residual,eps),'s-'); grid on
xlabel('Iterasi');ylabel('Norma residual infinity')
legend('Jacobi','Gauss-Seidel','Location','best')
