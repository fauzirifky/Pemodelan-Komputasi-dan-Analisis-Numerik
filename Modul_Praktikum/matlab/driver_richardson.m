%% Praktikum 6: Richardson umum, multi-titik, dan beberapa orde
clear; clc; close all; format long g

f  = @(x) -0.1*x.^4 - 0.15*x.^3 - 0.5*x.^2 - 0.25*x + 1.25;
df = @(x) -0.4*x.^3 - 0.45*x.^2 - x - 0.25;

xq = [0 0.25 0.5 0.75 1.0];
h  = 0.25;
r  = 2;

methods = {'forward','central','central4'};
porder  = [1 2 4];

Dexact = df(xq);
rows = [];

figure;
tiledlayout(2,1);

nexttile;
plot(xq,Dexact,'k-','LineWidth',1.8,'DisplayName','Eksak'); hold on

for m = 1:numel(methods)
    method = methods{m};
    p = porder(m);
    approx = @(hh) numdiff(f,xq,method,hh);
    [DR,Dh,Dhr] = richardson_extrap(approx,h,p,r);

    err_h  = abs(Dh-Dexact);
    err_R  = abs(DR-Dexact);

    for i = 1:numel(xq)
        rows = [rows; m xq(i) p Dh(i) Dhr(i) DR(i) Dexact(i) err_h(i) err_R(i)]; %#ok<AGROW>
    end

    plot(xq,DR,'o-','LineWidth',1.2,'DisplayName',['Richardson ' method]);
end

grid on
xlabel('x'); ylabel('f''(x)')
title('Turunan pada banyak titik')
legend('Location','best')

T = array2table(rows,'VariableNames', ...
    {'methodID','x','p','Dh','Dhr','DR','exact','errDh','errDR'});
disp(T)

% Studi orde di x = 0.5.
x0 = 0.5;
hs = 0.4./2.^(0:8);
E = zeros(numel(hs),3);
ER = zeros(numel(hs),3);

for m = 1:numel(methods)
    p = porder(m);
    for k = 1:numel(hs)
        hh = hs(k);
        approx = @(step) numdiff(f,x0,methods{m},step);
        [DR,Dh] = richardson_extrap(approx,hh,p,r);
        E(k,m)  = abs(Dh-df(x0));
        ER(k,m) = abs(DR-df(x0));
    end
end

nexttile;
loglog(hs,E(:,1),'o-',hs,ER(:,1),'o--', ...
       hs,E(:,2),'s-',hs,ER(:,2),'s--', ...
       hs,E(:,3),'^-',hs,ER(:,3),'^--','LineWidth',1.1);
grid on
xlabel('h'); ylabel('galat absolut')
title('Beda hingga biasa versus Richardson')
legend('Forward','R forward','Central','R central','Central-4','R central-4', ...
       'Location','best')
