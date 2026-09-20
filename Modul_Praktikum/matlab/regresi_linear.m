function [beta, info] = regresi_linear(xdata, ydata)
%REGRESI_LINEAR OLS y=a+b*x via QR-backed backslash X\y (not inverse).
x=xdata(:); y=ydata(:);
if numel(x)~=numel(y) || numel(x)<3 || ~all(isfinite([x;y]))
    error('Data x,y harus berpasangan, terhingga, dan minimal 3 titik.');
end
X=[ones(numel(x),1),x];
if rank(X)<2, error('Variasi x tidak cukup; matriks desain rank-deficient.');end
beta=X\y;
info.X=X; info.normalA=X'*X; info.normalB=X'*y;
info.yhat=X*beta; info.residual=y-info.yhat;
end
