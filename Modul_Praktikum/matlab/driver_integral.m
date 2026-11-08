%% Praktikum 7: Integrasi Numerik dengan Formula Newton-Cotes
clear; clc; close all; format long g

%% A. Contoh yang sama dengan materi kelas
f = @(x) 0.2 + 25*x - 200*x.^2 + 675*x.^3 - 900*x.^4 + 400*x.^5;
F = @(x) 0.2*x + 25/2*x.^2 - 200/3*x.^3 + ...
         675/4*x.^4 - 180*x.^5 + 400/6*x.^6;

a = 0; b = 0.8;
Iexact = F(b)-F(a);

method = ["Trapesium tunggal"; ...
          "Trapesium komposit"; ...
          "Simpson 1/3 tunggal"; ...
          "Simpson 3/8 tunggal"; ...
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
    'VariableNames',{'Metode','n','Integral','GalatAbsolut','GalatRelatifPersen'});
disp(T)
fprintf('Integral eksak = %.10f\n\n',Iexact);

xx = linspace(a,b,400);
x4 = linspace(a,b,5);
figure;
plot(xx,f(xx),'LineWidth',1.6); hold on
plot(x4,f(x4),'o','MarkerSize',6,'LineWidth',1.1);
grid on
xlabel('x'); ylabel('f(x)');
title('Integran dan titik Newton-Cotes pada n=4');
legend('f(x)','titik grid','Location','best');

%% B. Studi konvergensi
g = @(x) exp(x);
ag = 0; bg = 1;
IgExact = exp(1)-1;
ns = [4 8 16 32 64];

Etrap = zeros(size(ns));
Es13 = zeros(size(ns));
Eboole = zeros(size(ns));

for k = 1:numel(ns)
    n = ns(k);
    Etrap(k) = abs(trap_comp(g,ag,bg,n)-IgExact);
    Es13(k) = abs(simpson_comp(g,ag,bg,n)-IgExact);
    Eboole(k) = abs(boole_comp(g,ag,bg,n)-IgExact);
end

h = (bg-ag)./ns;
figure;
loglog(h,Etrap,'o-',h,Es13,'s-',h,Eboole,'d-','LineWidth',1.1);
grid on
xlabel('h'); ylabel('galat absolut');
title('Konvergensi formula Newton-Cotes');
legend('Trapesium','Simpson 1/3','Boole','Location','best');

pTrap = log(Etrap(1:end-1)./Etrap(2:end))/log(2);
pS13 = log(Es13(1:end-1)./Es13(2:end))/log(2);
pBoole = log(Eboole(1:end-1)./Eboole(2:end))/log(2);

disp(table(ns(2:end)',pTrap',pS13',pBoole', ...
    'VariableNames',{'n','pObsTrap','pObsS13','pObsBoole'}));

%% C. Aplikasi pada PDB y' = g(t)
q = @(t) exp(-t.^2);
Iq = simpson_comp(q,0,1,4);
y1 = 1 + Iq;

fprintf('\nAplikasi PDB:\n');
fprintf('Integral Simpson 1/3, n=4 = %.6f\n',Iq);
fprintf('y(1) = %.6f\n',y1);
