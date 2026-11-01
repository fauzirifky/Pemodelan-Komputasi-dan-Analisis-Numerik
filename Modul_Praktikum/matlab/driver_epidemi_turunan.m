%% Mini-project: data kumulatif penyakit menular -> fitting -> turunan
% Data bersifat sintetik untuk latihan numerik, bukan data surveilans.
clear; clc; close all; format long g

here = fileparts(mfilename('fullpath'));
datafile = fullfile(here,'..','data','data_kasus_kumulatif_sintetik.csv');
T = readtable(datafile);

t = T.hari;
C = T.kasus_kumulatif;

% Fitting logistik tanpa toolbox khusus.
% Parameter diparameterkan sebagai K=exp(a), r=exp(b) agar K,r positif.
theta0 = [log(1.10*max(C)); log(0.30); median(t)];
obj = @(th) sum((exp(th(1))./(1+exp(-exp(th(2))*(t-th(3)))) - C).^2);
opts = optimset('Display','off','TolX',1e-10,'TolFun',1e-10);
theta = fminsearch(obj,theta0,opts);

K  = exp(theta(1));
rr = exp(theta(2));
t0 = theta(3);

Cfit = @(tt) K./(1+exp(-rr*(tt-t0)));
dCfit = @(tt) K*rr.*exp(-rr*(tt-t0))./(1+exp(-rr*(tt-t0))).^2;

% Estimasi laju kasus pada banyak titik.
tq = (2:2:18)';
h = 2;
p = 2;
refine = 2;

approx = @(hh) numdiff(Cfit,tq,'central',hh);
[IR,Ih,Ih2] = richardson_extrap(approx,h,p,refine);
Iref = dCfit(tq);

Tout = table(tq,Ih,Ih2,IR,Iref,abs(IR-Iref), ...
    'VariableNames',{'hari','D_h','D_h2','Richardson','turunan_fit','galat_R'});
disp(Tout)

% Titik pertumbuhan tercepat menurut Richardson.
[peakRate,idx] = max(IR);
fprintf('K = %.4f, r = %.4f, t0 = %.4f\n',K,rr,t0);
fprintf('Laju maksimum Richardson = %.4f kasus/hari pada hari %.1f\n', ...
    peakRate,tq(idx));

% Visualisasi data dan fitting.
tfine = linspace(min(t),max(t),400)';
figure;
plot(t,C,'ko','MarkerFaceColor','k','DisplayName','Data sintetik'); hold on
plot(tfine,Cfit(tfine),'LineWidth',1.8,'DisplayName','Fit logistik');
grid on
xlabel('Hari'); ylabel('Kasus kumulatif')
title('Data kumulatif dan model hasil fitting')
legend('Location','southeast')

% Visualisasi turunan / laju kasus.
figure;
plot(tq,Iref,'k-','LineWidth',1.8,'DisplayName','Turunan analitik fit'); hold on
plot(tq,Ih,'o-','DisplayName','Beda pusat D(h)');
plot(tq,Ih2,'s-','DisplayName','Beda pusat D(h/2)');
plot(tq,IR,'d-','LineWidth',1.3,'DisplayName','Richardson');
grid on
xlabel('Hari'); ylabel('Estimasi kasus baru per hari')
title('Laju perubahan kasus kumulatif pada banyak titik')
legend('Location','best')
