%% Praktikum 7: Integrasi Numerik dengan Formula Newton-Cotes
clear; clc; close all; format long g

f = @(x) 0.2 + 25*x - 200*x.^2 + 675*x.^3 - 900*x.^4 + 400*x.^5;
F = @(x) 0.2*x + 25/2*x.^2 - 200/3*x.^3 + ...
         675/4*x.^4 - 180*x.^5 + 400/6*x.^6;

a = 0;
b = 0.8;
Iexact = F(b)-F(a);

method = ["Trapesium"; ...
          "Trapesium komposit"; ...
          "Simpson 1/3"; ...
          "Simpson 3/8"; ...
          "Simpson 1/3 komposit"; ...
          "Boole"; ...
          "Simpson campuran"];

nval = [1;2;2;3;4;4;5];

Inum = [trap_comp(f,a,b,1); ...
        trap_comp(f,a,b,2); ...
        simpson_comp(f,a,b,2); ...
        simpson38_comp(f,a,b,3); ...
        simpson_comp(f,a,b,4); ...
        boole_comp(f,a,b,4); ...
        simpson_mixed_comp(f,a,b,5)];

errAbs = abs(Inum-Iexact);
errRelPct = 100*errAbs/abs(Iexact);

T = table(method,nval,Inum,errAbs,errRelPct, ...
    'VariableNames', ...
    {'Metode','n','Integral','GalatAbsolut','GalatRelatifPersen'});
disp(T)
fprintf('Integral eksak = %.10f\n',Iexact);

%% Visualisasi titik kuadratur tiap formula
xx = linspace(a,b,500);

% Trapesium
xT = linspace(a,b,2);
pT = polyfit(xT,f(xT),1);
figure(1)
plot(xx,f(xx),'LineWidth',1.5); hold on
plot(xx,polyval(pT,xx),'--','LineWidth',1.2)
plot(xT,f(xT),'o','MarkerSize',6,'LineWidth',1.1)
grid on
xlabel('x'); ylabel('Nilai fungsi')
title('Aturan Trapesium')
legend('f(x)','Interpolan linear','Titik kuadratur','Location','best')

% Simpson 1/3
x13 = linspace(a,b,3);
p13 = polyfit(x13,f(x13),2);
figure(2)
plot(xx,f(xx),'LineWidth',1.5); hold on
plot(xx,polyval(p13,xx),'--','LineWidth',1.2)
plot(x13,f(x13),'o','MarkerSize',6,'LineWidth',1.1)
grid on
xlabel('x'); ylabel('Nilai fungsi')
title('Simpson 1/3')
legend('f(x)','Interpolan kuadratik','Titik kuadratur','Location','best')

% Simpson 3/8
x38 = linspace(a,b,4);
p38 = polyfit(x38,f(x38),3);
figure(3)
plot(xx,f(xx),'LineWidth',1.5); hold on
plot(xx,polyval(p38,xx),'--','LineWidth',1.2)
plot(x38,f(x38),'o','MarkerSize',6,'LineWidth',1.1)
grid on
xlabel('x'); ylabel('Nilai fungsi')
title('Simpson 3/8')
legend('f(x)','Interpolan kubik','Titik kuadratur','Location','best')

% Boole
xB = linspace(a,b,5);
pB = polyfit(xB,f(xB),4);
figure(4)
plot(xx,f(xx),'LineWidth',1.5); hold on
plot(xx,polyval(pB,xx),'--','LineWidth',1.2)
plot(xB,f(xB),'o','MarkerSize',6,'LineWidth',1.1)
grid on
xlabel('x'); ylabel('Nilai fungsi')
title('Aturan Boole')
legend('f(x)','Interpolan kuartik','Titik kuadratur','Location','best')
