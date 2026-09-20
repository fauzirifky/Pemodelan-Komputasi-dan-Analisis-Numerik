%% DRIVER TUGAS B4.5: 12 titik sintetik, model saturasi + opsi rasional
clear;clc;close all
x=(0.25:0.5:5.75)';
y=[0.165;0.440;0.612;0.771;0.859;0.945;...
   0.988;1.044;1.065;1.097;1.102;1.118];

model=@(x,p) p(1)*(1-exp(-p(2)*x));
Jac=@(x,p)[1-exp(-p(2)*x),p(1)*x.*exp(-p(2)*x)];
[p,h]=regresi_nonlinear(x,y,[1;1],model,Jac,1e-10,200);
yhat=model(x,p);M=metrik_regresi(y,yhat);
fprintf('Saturasi: a0=%.6f a1=%.6f | MSE=%.5g RMSE=%.5g MAPE=%.3f%% R2=%.6f\n',...
    p(1),p(2),M.MSE,M.RMSE,M.MAPE,M.R2);
figure;plot(x,y,'ko',x,yhat,'b-');grid on
xlabel('x');ylabel('y');legend('Data','Saturasi')
figure;semilogy(h.iter,max(h.errs,eps),'o-');grid on
xlabel('Iterasi');ylabel('errs');title('Konvergensi parameter')
% Tantangan: definisikan f(x,p)=p(1)*x/(p(2)+x),
% turunkan Z lalu panggil regresi_nonlinear untuk data sama.
