%% Biseksi dan Regula Falsi
clear; clc; close all

f = @(x) x.^3 - x - 1;
a0 = 1; b0 = 1.5;
tol = 1e-6;
maxit = 100;

labels = {'Biseksi','Regula Falsi'};
figure; hold on

for method = 1:2
    a = a0;
    b = b0;
    xold = NaN;
    errs = [];

    fprintf('\n%s\n',labels{method})
    fprintf('k\t a\t\t b\t\t xr\t\t f(xr)\t\t err\n')

    for k = 1:maxit
        fa = f(a);
        fb = f(b);

        if fa*fb >= 0
            error('Interval tidak mengurung akar.')
        end

        if method == 1
            xr = (a+b)/2;
        else
            xr = b - fb*(b-a)/(fb-fa);
        end

        fxr = f(xr);

        if k == 1
            err = NaN;
        else
            err = abs(xr-xold)/max(1,abs(xr));
            errs(end+1,1) = err; %#ok<SAGROW>
        end

        fprintf('%d\t %.6f\t %.6f\t %.8f\t %+.3e\t %.3e\n', ...
            k,a,b,xr,fxr,err)

        if abs(fxr) < tol || (k > 1 && err < tol)
            break
        end

        % Bagian ini identik untuk Biseksi dan Regula Falsi
        if fa*fxr < 0
            b = xr;
        else
            a = xr;
        end

        xold = xr;
    end

    if ~isempty(errs)
        semilogy(2:k,errs,'o-','DisplayName',labels{method})
    end
end

grid on
xlabel('Iterasi')
ylabel('e_a')
title('Konvergensi Biseksi dan Regula Falsi')
legend('Location','best')
