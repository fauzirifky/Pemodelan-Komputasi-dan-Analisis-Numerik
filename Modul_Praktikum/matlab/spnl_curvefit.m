%% Praktikum 3: SPNL dan nonlinear least-squares
clear; clc; format long g
F=@(z)[z(1)^2+z(2)^2-4; exp(z(1))+z(2)-1];
J=@(z)[2*z(1),2*z(2); exp(z(1)),1];
[z,h]=newton_system(F,J,[1;-1],1e-10,50);
fprintf('Solusi SPNL = [%.10f %.10f], residual=%.3e\n',z(1),z(2),norm(F(z)));

x=[0.25;0.75;1.25;1.75;2.25];
y=[0.28;0.57;0.68;0.74;0.79];
model=@(p,x) p(1).*x./(p(2)+x);
Jm=@(p,x)[x./(p(2)+x), -p(1).*x./(p(2)+x).^2];
[p,hp]=gauss_newton_damped(model,Jm,x,y,[1;0.5],1e-10,100);
fprintf('Parameter fit a=%.8f, b=%.8f, SSE=%.3e\n',p(1),p(2),sum((y-model(p,x)).^2));
xx=linspace(min(x),max(x),200)';
figure; plot(x,y,'o',xx,model(p,xx),'-'); grid on
xlabel('x'); ylabel('y'); legend('Data','Model','Location','best');
