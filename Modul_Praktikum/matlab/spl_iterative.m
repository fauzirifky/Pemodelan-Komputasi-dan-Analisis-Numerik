%% Praktikum 2: Jacobi dan Gauss-Seidel
clear; clc; format long g
A=[3 -0.1 -0.2; 0.1 7 -0.3; 0.3 -0.2 10];
b=[7.85; -19.3; 71.4];
x0=zeros(size(b)); tol=1e-10; maxit=200;
[xj,hj]=jacobi_iter(A,b,x0,tol,maxit);
[xg,hg]=gauss_seidel_iter(A,b,x0,tol,maxit);

fprintf('Jacobi       : '); fprintf('%12.8f ',xj); fprintf('\n');
fprintf('Gauss-Seidel : '); fprintf('%12.8f ',xg); fprintf('\n');
fprintf('Residual Jacobi       = %.3e\n',norm(A*xj-b,inf));
fprintf('Residual Gauss-Seidel = %.3e\n',norm(A*xg-b,inf));

figure; semilogy(hj.iter,hj.residual,'o-'); hold on
semilogy(hg.iter,hg.residual,'s-'); grid on
xlabel('Iterasi'); ylabel('||Ax-b||_\infty'); legend('Jacobi','Gauss-Seidel');
