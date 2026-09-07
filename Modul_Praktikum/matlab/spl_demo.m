%% Jacobi dan Gauss-Seidel
clear; clc; close all

A = [10 -1 2; -1 11 -1; 2 -1 10];
b = [6;25;-11];
xexact = A\b;

tol = 1e-8;
maxit = 100;
x0 = zeros(size(b));

labels = {'Jacobi','Gauss-Seidel'};
figure; hold on

for method = 1:2
    xold = x0;
    errs = [];

    for k = 1:maxit
        xnew = xold;

        if method == 1
            % Jacobi: semua memakai nilai iterasi lama
            for i = 1:length(b)
                idx = [1:i-1 i+1:length(b)];
                xnew(i) = (b(i)-A(i,idx)*xold(idx))/A(i,i);
            end
        else
            % Gauss-Seidel: nilai baru langsung dipakai
            for i = 1:length(b)
                left = A(i,1:i-1)*xnew(1:i-1);
                right = A(i,i+1:end)*xold(i+1:end);
                xnew(i) = (b(i)-left-right)/A(i,i);
            end
        end

        errvec = abs(xnew-xold)./max(1,abs(xnew));
        err = max(errvec);
        res = norm(b-A*xnew,inf);
        errs(end+1,1) = err; %#ok<SAGROW>

        if err < tol && res < tol
            break
        end

        xold = xnew;
    end

    fprintf('\n%s\n',labels{method})
    disp([xnew xexact abs(xnew-xexact)])

    semilogy(1:k,errs,'o-','DisplayName',labels{method})
end

grid on
xlabel('Iterasi')
ylabel('e_a')
title('Konvergensi Jacobi dan Gauss-Seidel')
legend('Location','best')
