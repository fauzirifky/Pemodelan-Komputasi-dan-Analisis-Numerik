clear; close all; clc; format long g
f = @(x) 0.2 + 25*x - 200*x.^2 + 675*x.^3 - 900*x.^4 + 400*x.^5;
I_exact = 1.640533333333333; a=0; b=0.8;
I_trap=trap_comp(f,a,b,4);
I_simp=simpson_comp(f,a,b,4);
I_simp38=trap_simpson38(f,a,b,6);
I_boole=boole_comp(f,a,b,4);
disp(table(I_exact,I_trap,I_simp,I_simp38,I_boole))
