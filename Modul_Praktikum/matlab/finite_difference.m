%% Praktikum 4: beda hingga dan orde akurasi
clear; clc; format long g
f=@(x) exp(x)./sin(sqrt(x)); x0=1.2;
s=sqrt(x0);
dexact=f(x0).*(1-cot(s)./(2*s));
hs=0.2./2.^(0:7);
for k=1:numel(hs)
    h=hs(k);
    df= numdiff(f,x0,'forward',h);
    db= numdiff(f,x0,'backward',h);
    dc= numdiff(f,x0,'central',h);
    tab(k,:)=[h,df,abs(df-dexact),db,abs(db-dexact),dc,abs(dc-dexact)];
end
disp(array2table(tab,'VariableNames',{'h','forward','errF','backward','errB','central','errC'}));
figure; loglog(hs,tab(:,3),'o-',hs,tab(:,5),'s-',hs,tab(:,7),'^-'); grid on
xlabel('h'); ylabel('error absolut'); legend('Forward','Backward','Central');
