function [b, yq, tableDD] = newton_dd(x, y, xq)
%NEWTON_DD Newton divided-difference interpolation.
%   b berisi koefisien Newton dan tableDD tabel selisih terbagi.

x = x(:);
y = y(:);
n = numel(x);

if numel(y) ~= n
    error('x dan y harus memiliki panjang yang sama.');
end
if numel(unique(x)) ~= n
    error('Semua nilai x harus berbeda.');
end

tableDD = zeros(n,n);
tableDD(:,1) = y;

for j = 2:n
    for i = 1:n-j+1
        tableDD(i,j) = (tableDD(i+1,j-1)-tableDD(i,j-1)) / ...
                       (x(i+j-1)-x(i));
    end
end

b = tableDD(1,:).';

yq = zeros(size(xq));
for q = 1:numel(xq)
    val = b(1);
    term = 1;
    for k = 2:n
        term = term*(xq(q)-x(k-1));
        val = val + b(k)*term;
    end
    yq(q) = val;
end
end
