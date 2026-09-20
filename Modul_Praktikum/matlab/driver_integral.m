%% Praktikum 6: Trapezoid, Midpoint, Simpson
clear; clc; format long g
f=@(x) sin(x); a=0; b=pi; Iexact=2;
ns=[4 8 16 32 64];
for k=1:numel(ns)
    n=ns(k);
    It=trap_comp(f,a,b,n); Im=midpoint_comp(f,a,b,n); Is=simpson_comp(f,a,b,n);
    T(k,:)=[n,It,abs(It-Iexact),Im,abs(Im-Iexact),Is,abs(Is-Iexact)];
end
disp(array2table(T,'VariableNames',{'n','Trap','errT','Mid','errM','Simp','errS'}));
