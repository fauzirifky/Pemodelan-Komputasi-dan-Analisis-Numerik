clear; close all; clc; format long g
f=@(x) exp(-x.^2); a=0; b=1;
fprintf('Trap       = %.12g\n',trap_comp(f,a,b,4))
fprintf('Simpson1/3 = %.12g\n',simpson_comp(f,a,b,4))
fprintf('Simpson3/8 = %.12g\n',trap_simpson38(f,a,b,6))
fprintf('Boole      = %.12g\n',boole_comp(f,a,b,4))
