%% Praktikum 1: perbandingan metode pencarian akar
clear; clc; format long g
f  = @(x) exp(x) + x;
df = @(x) exp(x) + 1;
g  = @(x) -exp(x);   % bentuk fixed-point x = g(x)
tol = 1e-8; maxit = 100;

[xb,hb] = bisection_fun(f,-1,0,tol,maxit);
[xf,hf] = regula_falsi_fun(f,-1,0,tol,maxit);
[xn,hn] = newton_fun(f,df,0,tol,maxit);
[xs,hs] = secant_fun(f,-1,0,tol,maxit);
[xg,hg] = fixedpoint_fun(g,-0.5,tol,maxit);

fprintf('Bisection    : %.12f (%d iterasi)\n',xb,height(hb));
fprintf('Regula falsi: %.12f (%d iterasi)\n',xf,height(hf));
fprintf('Newton       : %.12f (%d iterasi)\n',xn,height(hn));
fprintf('Secant       : %.12f (%d iterasi)\n',xs,height(hs));
fprintf('Fixed point  : %.12f (%d iterasi)\n',xg,height(hg));

figure; semilogy(hb.iter,hb.err,'o-'); hold on
semilogy(hf.iter,hf.err,'s-'); semilogy(hn.iter,hn.err,'^-');
semilogy(hs.iter,hs.err,'d-'); semilogy(hg.iter,hg.err,'x-');
grid on; xlabel('Iterasi'); ylabel('Error aproksimasi');
legend('Biseksi','Regula Falsi','Newton','Sekan','Titik Tetap','Location','best');
