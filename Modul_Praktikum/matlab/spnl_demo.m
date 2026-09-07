%% Newton untuk SPNL
clear; clc; close all

F = @(z) [z(1)^2 + z(2)^2 - 5;
          z(1) - z(2) - 1];

J = @(z) [2*z(1) 2*z(2);
          1       -1];

x = [1.5;0.5];
tol = 1e-10;
maxit = 50;
errs = [];
residuals = [];

for k = 1:maxit
    dx = -J(x)\F(x);
    xnew = x + dx;

    err = max(abs(xnew-x)./max(1,abs(xnew)));
    res = norm(F(xnew),inf);

    errs(end+1,1) = err; %#ok<SAGROW>
    residuals(end+1,1) = res; %#ok<SAGROW>

    x = xnew;

    if err < tol && res < tol
        break
    end
end

fprintf('Solusi: x = %.12f, y = %.12f\n',x(1),x(2))

figure
semilogy(1:k,errs,'o-',1:k,residuals,'s-')
grid on
xlabel('Iterasi')
ylabel('Nilai')
legend('errs','residual','Location','best')
title('Konvergensi Newton SPNL')
