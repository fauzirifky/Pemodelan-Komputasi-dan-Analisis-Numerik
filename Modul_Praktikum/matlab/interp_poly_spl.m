function [a, yq, A, residual] = interp_poly_spl(x, y, xq)
%INTERP_POLY_SPL Interpolasi polinomial dalam basis 1,x,...,x^n.
%   Koefisien diperoleh dari SPL Vandermonde A*a = y.

x = x(:);
y = y(:);
n = numel(x) - 1;

if numel(y) ~= n+1
    error('x dan y harus memiliki panjang yang sama.');
end
if numel(unique(x)) ~= numel(x)
    error('Semua nilai x harus berbeda.');
end

A = zeros(n+1,n+1);
for j = 0:n
    A(:,j+1) = x.^j;
end

a = A\y;
residual = norm(A*a-y,inf);

xq = xq(:);
Vq = zeros(numel(xq),n+1);
for j = 0:n
    Vq(:,j+1) = xq.^j;
end
yq = Vq*a;
end
