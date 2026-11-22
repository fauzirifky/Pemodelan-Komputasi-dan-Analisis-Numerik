clear; close all; clc; format long g
f=@(x) -0.1*x.^4-0.15*x.^3-0.5*x.^2-0.25*x+1.25;
df=@(x) -0.4*x.^3-0.45*x.^2-x-0.25;
xs=0:0.05:1; h=0.1; p=2; r=2; tab=zeros(numel(xs),4);
for k=1:numel(xs)
    x=xs(k); approx=@(hh) numdiff(f,x,'central',hh);
    [DR,~,~]=richardson_extrap(approx,h,p,r);
    tab(k,:)=[x,DR,df(x),abs(DR-df(x))];
end
disp(array2table(tab,'VariableNames',{'x','Richardson','Exact','error'}))
