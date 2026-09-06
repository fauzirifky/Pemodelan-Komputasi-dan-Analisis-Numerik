function d=numdiff(f,x0,method,h)
if nargin<4 || isempty(h), h=eps^(1/3)*max(1,abs(x0)); end
switch lower(method)
    case 'forward',  d=(f(x0+h)-f(x0))/h;
    case 'backward', d=(f(x0)-f(x0-h))/h;
    case 'central',  d=(f(x0+h)-f(x0-h))/(2*h);
    otherwise, error('Metode tidak dikenal.');
end
end
