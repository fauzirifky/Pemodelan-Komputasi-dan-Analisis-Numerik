%% Praktikum Interpolasi Polinomial
% Contoh pemakaian function interp_poly_spl.m dan newton_dd.m
clear; clc; close all

%% DATASET A: ln(x), 8 titik
T = readtable(fullfile('data','data_ln_chapra.csv'));
x = T.x; y = T.y;
xq = 2;
yref = log(xq);

fprintf('DATASET A: ln(x), xq = %.2f\n',xq)
fprintf('Nilai referensi = %.8f\n\n',yref)

% Urutan titik sengaja dapat diubah untuk mengamati pengaruh pemilihan titik.
orders = 1:7;
yest = nan(size(orders));
err = nan(size(orders));

for p = orders
    m = p+1;
    xm = x(1:m);
    ym = y(1:m);
    [~,yest(p),~,~] = interp_poly_spl(xm,ym,xq);
    err(p) = abs(yest(p)-yref);
    fprintf('orde %d : %.8f |error| = %.3e\n',p,yest(p),err(p))
end

figure
semilogy(orders,err,'o-','LineWidth',1.4)
grid on
xlabel('Orde polinom')
ylabel('|error|')
title('Perubahan error terhadap orde polinom')

% Bandingkan beberapa kurva tanpa membuat gambar terlalu padat.
xx = linspace(min(x),max(x),400).';
figure; hold on
scatter(x,y,55,'filled','DisplayName','Data')
for p = [1 2 3 5 7]
    m = p+1;
    [~,yy] = interp_poly_spl(x(1:m),y(1:m),xx);
    plot(xx,yy,'LineWidth',1.2,'DisplayName',sprintf('orde %d',p))
end
plot(xx,log(xx),'k--','LineWidth',1.4,'DisplayName','ln(x)')
grid on
xlabel('x'); ylabel('y')
title('Interpolasi beberapa orde')
legend('Location','best')

%% DATASET B: data yang berasal dari suatu polinom
T = readtable(fullfile('data','data_poly_chapra.csv'));
x = T.x; y = T.y; xq = 4;

fprintf('\nDATASET B: estimasi pada xq = %.2f\n',xq)
for p = 1:4
    % pilih p+1 titik yang dekat dengan xq
    [~,idx] = sort(abs(x-xq));
    idx = sort(idx(1:p+1));
    [~,yq] = newton_dd(x(idx),y(idx),xq);
    fprintf('orde %d : %.8f\n',p,yq)
end

%% DATASET C: bentuk data naik lalu turun
T = readtable(fullfile('data','data_shape_chapra.csv'));
x = T.x; y = T.y; xq = 8;

figure
scatter(x,y,55,'filled'); hold on
xx = linspace(min(x),max(x),500).';
for p = [1 2 3 5]
    [~,idx] = sort(abs(x-xq));
    idx = sort(idx(1:p+1));
    [~,yy] = newton_dd(x(idx),y(idx),xx);
    plot(xx,yy,'LineWidth',1.2,'DisplayName',sprintf('orde %d',p))
end
grid on
xlabel('x'); ylabel('y')
title('Pengaruh orde dan pemilihan titik')
legend('Data','orde 1','orde 2','orde 3','orde 5','Location','best')
