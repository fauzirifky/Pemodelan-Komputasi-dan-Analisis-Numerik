%% Regresi linear dan nonlinear pada data yang sama
clear; clc; close all

x = (1:5)';
y = [0.5;2.5;2.0;4.0;3.5];

%% Model linear: y = a + b x
X = [ones(size(x)) x];
beta = X\y;
ylin = X*beta;

%% Model nonlinear: y = a exp(b x), Gauss-Newton
p = [0.5;0.3];
tol = 1e-10;
maxit = 100;
errs = [];

for k = 1:maxit
    a = p(1);
    b = p(2);

    ynon = a*exp(b*x);
    r = y-ynon;

    J = [exp(b*x), a*x.*exp(b*x)];
    dp = J\r;

    pnew = p + dp;
    err = norm(pnew-p,inf)/max(1,norm(pnew,inf));
    errs(end+1,1) = err; %#ok<SAGROW>

    p = pnew;

    if err < tol
        break
    end
end

ynon = p(1)*exp(p(2)*x);

%% Metrik
metriclin = metrics(y,ylin);
metricnon = metrics(y,ynon);

fprintf('Linear    a = %.6f, b = %.6f\n',beta(1),beta(2))
fprintf('Nonlinear a = %.6f, b = %.6f\n',p(1),p(2))
disp(array2table([metriclin;metricnon], ...
    'VariableNames',{'MSE','RMSE','MAPE','R2'}, ...
    'RowNames',{'Linear','Nonlinear'}))

%% Grafik data dan dua model
xx = linspace(min(x),max(x),200)';
figure
scatter(x,y,50,'filled'); hold on
plot(xx,[ones(size(xx)) xx]*beta,'LineWidth',1.5)
plot(xx,p(1)*exp(p(2)*xx),'--','LineWidth',1.5)
grid on
xlabel('x')
ylabel('y')
legend('Data','Linear','Nonlinear','Location','best')
title('Pencocokan kurva')

%% Grafik residual
figure
plot(x,y-ylin,'o-',x,y-ynon,'s-')
yline(0,'--')
grid on
xlabel('x')
ylabel('Residual')
legend('Linear','Nonlinear','Location','best')
title('Residual model')

%% Grafik errs Gauss-Newton
figure
semilogy(1:numel(errs),errs,'o-')
grid on
xlabel('Iterasi')
ylabel('errs')
title('Konvergensi parameter model nonlinear')

function m = metrics(y,yhat)
    r = y-yhat;
    mse = mean(r.^2);
    rmse = sqrt(mse);
    mape = 100*mean(abs(r./y));
    r2 = 1-sum(r.^2)/sum((y-mean(y)).^2);
    m = [mse rmse mape r2];
end
