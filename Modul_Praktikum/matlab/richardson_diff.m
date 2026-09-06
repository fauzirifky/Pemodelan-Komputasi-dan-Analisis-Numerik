%% Praktikum 5: Richardson dan studi step size
clear; clc; format long g
f=@(x) exp(x)./sin(sqrt(x)); x0=1.2;
s=sqrt(x0); dexact=f(x0).*(1-cot(s)./(2*s));
hs=0.4./2.^(0:8);
for k=1:numel(hs)
    h=hs(k); D1=numdiff(f,x0,'central',h); D2=numdiff(f,x0,'central',h/2);
    DR=D2+(D2-D1)/(2^2-1); % central difference berorde p=2
    T(k,:)=[h,D1,D2,DR,abs(DR-dexact)];
end
disp(array2table(T,'VariableNames',{'h','Dh','Dh2','Richardson','error'}));
figure; loglog(hs,T(:,5),'o-'); grid on; xlabel('h'); ylabel('error Richardson');
