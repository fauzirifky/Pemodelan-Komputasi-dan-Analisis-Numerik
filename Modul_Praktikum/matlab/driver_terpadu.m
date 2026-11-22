%% Praktikum 10 - Mock-Up Project Pendulum Teredam
% Data: EnzeXu/Damped_Pendulum_Dataset, len3_cond2_1.csv
% Integrasi: fitting, SPL, akar, turunan, integral, dan ODE.

clear; clc; close all; format long g

%% 1. Raw data
thisDir=fileparts(mfilename('fullpath'));
dataFile=fullfile(thisDir,'..','data','data_pendulum_teredam_open.csv');
D=readtable(dataFile);
disp(D(1:min(10,height(D)),:))
fprintf('Jumlah observasi raw = %d\n',height(D))

%% 2. Plot data
figure
plot(D.time,D.angle,'LineWidth',1.1)
grid on; xlabel('time (s)'); ylabel('angle (rad)')
title('Pendulum teredam: angle vs time')

figure
plot(D.time,D.angular_velocity,'LineWidth',1.1)
grid on; xlabel('time (s)'); ylabel('angular velocity (rad/s)')
title('Pendulum teredam: angular velocity vs time')

idxPeak=D.is_peak==1;
figure
plot(D.time,D.angle,'LineWidth',1.0); hold on
plot(D.time(idxPeak),D.angle(idxPeak),'o')
grid on; xlabel('time (s)'); ylabel('angle (rad)')
legend('Data','Peak','Location','best')

%% 3. Interval analisis dan downsampling
g=9.799; Ltrue=0.426;
idx=D.time<=20; D0=D(idx,:);
pick=1:5:height(D0); Df=D0(pick,:);
t=Df.time(:); theta=Df.angle(:);
fprintf('n fitting = %d\n',numel(t))

%% 4. Model dan Jacobian
% p = [C; A; beta; omega_d; phi]
model=@(p,tq) p(1)+p(2).*exp(-p(3).*tq).*cos(p(4).*tq+p(5));
Jfun=@(p,tq) [ ...
    ones(size(tq)), ...
    exp(-p(3).*tq).*cos(p(4).*tq+p(5)), ...
    -p(2).*tq.*exp(-p(3).*tq).*cos(p(4).*tq+p(5)), ...
    -p(2).*tq.*exp(-p(3).*tq).*sin(p(4).*tq+p(5)), ...
    -p(2).*exp(-p(3).*tq).*sin(p(4).*tq+p(5)) ];

p0=[0;0.44;0.05;4.8;pi];

J0=Jfun(p0,t);
r0=theta-model(p0,t);
A0=J0'*J0;
g0=J0'*r0;
delta0=A0\g0;

fprintf('size(J0)      = %d x %d\n',size(J0,1),size(J0,2))
fprintf('size(J0''*J0) = %d x %d\n',size(A0,1),size(A0,2))
fprintf('size(J0''*r0) = %d x %d\n',size(g0,1),size(g0,2))
fprintf('cond(J0''*J0) = %.6e\n',cond(A0))
disp('delta0 ='); disp(delta0)

%% 5. Estimasi parameter
[p,hGN]=gauss_newton_damped(model,Jfun,t,theta,p0,1e-9,100);
thetaHat=model(p,t); residual=theta-thetaHat;
SSE=sum(residual.^2);
RMSE=sqrt(mean(residual.^2));
R2=1-SSE/sum((theta-mean(theta)).^2);

fprintf('\nParameter Gauss-Newton\n')
fprintf('C       = %.10g\n',p(1))
fprintf('A       = %.10g\n',p(2))
fprintf('beta    = %.10g\n',p(3))
fprintf('omega_d = %.10g\n',p(4))
fprintf('phi     = %.10g\n',p(5))
fprintf('SSE = %.10g, RMSE = %.10g, R^2 = %.10g\n',SSE,RMSE,R2)

obj=@(pp) sum((theta-model(pp(:),t)).^2);
pBench=fminsearch(obj,p0);
fprintf('SSE fminsearch = %.10g\n',obj(pBench))

figure
plot(t,theta,'o','MarkerSize',3); hold on
tt=linspace(t(1),t(end),2000)';
plot(tt,model(p,tt),'LineWidth',1.5)
grid on; xlabel('time (s)'); ylabel('angle (rad)')
legend('Data','Fitted model','Location','best')

figure
plot(t,residual,'o-','MarkerSize',3); yline(0)
grid on; xlabel('time (s)'); ylabel('residual (rad)')

figure
semilogy(hGN.iter,max(hGN.sse,eps),'o-')
grid on; xlabel('iteration'); ylabel('SSE')

%% 6. Parameter fisik
C=p(1); A=p(2); beta=p(3); omega_d=p(4); phi=p(5);
omega0=sqrt(omega_d^2+beta^2);
Leff=g/omega0^2;
fprintf('omega0 = %.10g rad/s\n',omega0)
fprintf('L_eff = %.10g m; L_true = %.10g m\n',Leff,Ltrue)
fprintf('relative difference L = %.6f %%\n',100*abs(Leff-Ltrue)/Ltrue)

%% 7. Akar: crossing pertama theta = C
q=@(tq) model(p,tq)-C;
tdense=linspace(0,2,4001)';
qdense=q(tdense);
kCross=find(qdense(1:end-1).*qdense(2:end)<=0,1,'first');
if isempty(kCross), error('Crossing pertama tidak ditemukan pada 0-2 s.'); end
a=tdense(kCross); b=tdense(kCross+1);

[teqBis,hBis]=bisection_fun(q,a,b,1e-10,100);
[teqSec,hSec]=secant_fun(q,a,b,1e-10,100);
teqRef=fzero(q,[a b]);

fprintf('\nCrossing pertama posisi geometris setimbang\n')
fprintf('Bisection = %.12g s, residual %.3e, iter %d\n',teqBis,abs(q(teqBis)),height(hBis))
fprintf('Secant = %.12g s, residual %.3e, iter %d\n',teqSec,abs(q(teqSec)),height(hSec))
fprintf('fzero = %.12g s\n',teqRef)

%% 8. Turunan numerik pada crossing
thetaDot=@(tq) A.*exp(-beta.*tq).*( ...
    -beta.*cos(omega_d.*tq+phi)-omega_d.*sin(omega_d.*tq+phi));

hDiff=[0.08 0.04 0.02 0.01]';
dF=zeros(size(hDiff)); dB=dF; dC=dF;
fModel=@(z) model(p,z);
for k=1:numel(hDiff)
    h=hDiff(k);
    dF(k)=numdiff(fModel,teqRef,'forward',h);
    dB(k)=numdiff(fModel,teqRef,'backward',h);
    dC(k)=numdiff(fModel,teqRef,'central',h);
end

dRef=thetaDot(teqRef);
omegaSensorEq=interp1(D0.time,D0.angular_velocity,teqRef,'pchip');
TDiff=table(hDiff,dF,dB,dC,abs(dF-dRef),abs(dB-dRef),abs(dC-dRef), ...
    'VariableNames',{'h','forward','backward','central','errForward','errBackward','errCentral'});
disp(TDiff)
fprintf('Analytical model derivative = %.10g rad/s\n',dRef)
fprintf('Interpolated sensor omega = %.10g rad/s\n',omegaSensorEq)

figure
loglog(hDiff,TDiff.errForward,'o-',hDiff,TDiff.errBackward,'s-', ...
       hDiff,TDiff.errCentral,'^-','LineWidth',1.1)
grid on; xlabel('h (s)'); ylabel('absolute error')
legend('Forward','Backward','Central','Location','best')

%% 9. Integral: normalized dissipated energy
xModel=@(tq) model(p,tq)-C;
vModel=thetaDot;
dissRate=@(tq) 2*beta.*vModel(tq).^2;
Tend=20; nList=[100 200 400 800]';
Dtrap=zeros(size(nList)); Dsimp=Dtrap;
for k=1:numel(nList)
    n=nList(k);
    Dtrap(k)=trap_comp(dissRate,0,Tend,n);
    Dsimp(k)=simpson_comp(dissRate,0,Tend,n);
end

energy=@(tq) 0.5*vModel(tq).^2+0.5*omega0^2.*xModel(tq).^2;
Dref=energy(0)-energy(Tend);
TInt=table(nList,Dtrap,Dsimp,abs(Dtrap-Dref),abs(Dsimp-Dref), ...
    'VariableNames',{'n','trapezoid','simpson','errTrapezoid','errSimpson'});
disp(TInt)

figure
loglog(nList,TInt.errTrapezoid,'o-',nList,TInt.errSimpson,'s-','LineWidth',1.1)
grid on; xlabel('number of subintervals n'); ylabel('absolute error')
legend('Trapezoid','Simpson 1/3','Location','best')

%% 10. ODE: Euler, Heun, RK4
fode=@(tq,y) [y(2);-2*beta*y(2)-omega0^2*y(1)];
y0=[xModel(0);vModel(0)];
hODE=[0.10 0.05 0.025]';
errEuler=zeros(size(hODE)); errHeun=errEuler; errRK4=errEuler;

for k=1:numel(hODE)
    h=hODE(k);
    [tE,yE]=euler_ivp(fode,[0 Tend],y0,h);
    [tH,yH]=heun_ivp(fode,[0 Tend],y0,h);
    [tR,yR]=rk4_ivp(fode,[0 Tend],y0,h);

    errEuler(k)=max(abs(yE(:,1)-xModel(tE)));
    errHeun(k)=max(abs(yH(:,1)-xModel(tH)));
    errRK4(k)=max(abs(yR(:,1)-xModel(tR)));
end

TODE=table(hODE,errEuler,errHeun,errRK4);
disp(TODE)

[t45,y45]=ode45(fode,[0 Tend],y0);
err45=max(abs(y45(:,1)-xModel(t45)));
fprintf('ode45 max error vs fitted closed form = %.3e\n',err45)

figure
loglog(hODE,errEuler,'o-',hODE,errHeun,'s-',hODE,errRK4,'^-','LineWidth',1.1)
grid on; xlabel('h (s)'); ylabel('maximum absolute error')
legend('Euler','Heun','RK4','Location','best')

%% 11. Interpretasi
fprintf('\nBedakan numerical error, model discrepancy, dan experimental noise.\n')
