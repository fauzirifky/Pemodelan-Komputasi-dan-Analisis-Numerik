clear; close all; clc; format long g
f=@(x) -0.1*x.^4-0.15*x.^3-0.5*x.^2-0.25*x+1.25;
df=@(x) -0.4*x.^3-0.45*x.^2-x-0.25; x0=0.5;
hs=0.1./2.^(0:6); p=2; r=2; tab=zeros(numel(hs),5);
for k=1:numel(hs)
    h=hs(k); approx=@(hh) numdiff(f,x0,'central',hh);
    [DR,Dh,Dhr]=richardson_extrap(approx,h,p,r);
    tab(k,:)=[h,Dh,Dhr,DR,abs(DR-df(x0))];
end
disp(array2table(tab,'VariableNames',{'h','Dh','Dhr','Richardson','error'}))
