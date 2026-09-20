%% DRIVER REGRESI: data kelas, OLS dan Gauss-Newton, metrik serta plot
clear;clc;close all;format long g
x=[.25;.75;1.25;1.75;2.25];
y=[.28;.57;.68;.74;.79];

[beta,ols]=regresi_linear(x,y);
ylin=ols.yhat;

% Model saturasi dan Jacobian model dari contoh kelas:
model=@(x,p) p(1)*(1-exp(-p(2)*x));
Jac=@(x,p) [1-exp(-p(2)*x),p(1)*x.*exp(-p(2)*x)];
p0=[1;1];tol=1e-10;maxit=100;
Z0=Jac(x,p0);D0=y-model(x,p0);
disp('Jacobian awal Z0:');disp(Z0)
disp('Residual awal D0:');disp(D0)

[p,h]=regresi_nonlinear(x,y,p0,model,Jac,tol,maxit);
ynon=model(x,p);
ML=metrik_regresi(y,ylin);
MN=metrik_regresi(y,ynon);
fprintf('OLS a=%.8f b=%.8f\n',beta(1),beta(2));
fprintf('Nonlinear a0=%.8f a1=%.8f\n',p(1),p(2));
metrics=[ML.MSE ML.RMSE ML.MAPE ML.R2;MN.MSE MN.RMSE MN.MAPE MN.R2];
disp(array2table(metrics,'VariableNames',{'MSE','RMSE','MAPE','R2'},...
    'RowNames',{'Linear','Nonlinear'}));
disp(h)

xx=linspace(min(x),max(x),250)';
figure;plot(x,y,'ko','MarkerFaceColor','k');hold on
plot(xx,beta(1)+beta(2)*xx,'-','LineWidth',1.5)
plot(xx,model(xx,p),'--','LineWidth',1.5);grid on
xlabel('x');ylabel('y')
legend('Data','OLS linear','Gauss-Newton saturasi','Location','best')
title('Dua model pada data yang sama')
figure;plot(x,y-ylin,'o-',x,y-ynon,'s-');hold on
plot([min(x) max(x)],[0 0],'k:');grid on
xlabel('x');ylabel('Residual y-yhat')
legend('Linear','Nonlinear','Nol','Location','best')
figure;semilogy(h.iter,max(h.errs,eps),'o-');grid on
xlabel('Iterasi');ylabel('errs: perubahan relatif parameter')
title('Konvergensi Gauss-Newton')
