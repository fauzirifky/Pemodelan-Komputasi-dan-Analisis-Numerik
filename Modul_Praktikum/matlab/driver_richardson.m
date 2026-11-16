%% Praktikum 6: Richardson pada satu titik
clear; clc; close all; format long g

f  = @(x) -0.1*x.^4 - 0.15*x.^3 - 0.5*x.^2 - 0.25*x + 1.25;
df = @(x) -0.4*x.^3 - 0.45*x.^2 - x - 0.25;

x0 = 0.5;
h  = 0.5;
p  = 2;   % beda pusat berorde O(h^2)
r  = 2;

approx = @(hh) numdiff(f,x0,'central',hh);
[DR,Dh,Dhr] = richardson_extrap(approx,h,p,r);
Dexact = df(x0);

T = table(Dh,Dhr,DR,Dexact, ...
    abs(Dh-Dexact),abs(Dhr-Dexact),abs(DR-Dexact), ...
    'VariableNames',{'D_h','D_h2','Richardson','Exact', ...
                     'err_Dh','err_Dh2','err_R'});
disp(T)

fprintf('D(h)   = %.6f\n',Dh);
fprintf('D(h/2) = %.6f\n',Dhr);
fprintf('DR      = %.6f\n',DR);
fprintf('Exact   = %.6f\n',Dexact);
