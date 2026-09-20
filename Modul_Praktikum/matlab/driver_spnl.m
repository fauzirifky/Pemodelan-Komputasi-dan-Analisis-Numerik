%% DRIVER SPNL: model, Jacobian, tebakan, hasil, visualisasi
clear; clc; close all; format long g
F=@(z)[z(1)^2+z(2)^2-5;z(1)-z(2)-1];
Jac=@(z)[2*z(1),2*z(2);1,-1];
x0=[1.5;0.5];tol=1e-10;maxit=50;
[x,h]=newton_spnl(F,Jac,x0,tol,maxit);
fprintf('x=%.12f, y=%.12f, residual=%.3e\n',x(1),x(2),norm(F(x),inf));
disp(h)
figure
semilogy(h.iter,max(h.err,eps),'o-',...
         h.iter,max(h.residual,eps),'s-');grid on
xlabel('Iterasi');ylabel('Galat / residual')
legend('errs','residual','Location','best')
title('Konvergensi Newton SPNL')
