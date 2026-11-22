function d = numdiff(f,x0,method,h)
%NUMDIFF Forward, backward, or central finite difference.
if nargin<4 || isempty(h), h=eps^(1/3)*max(1,abs(x0)); end
if h<=0, error('h harus positif.'); end
switch lower(method)
    case 'forward'
        d=(f(x0+h)-f(x0))/h;
    case 'backward'
        d=(f(x0)-f(x0-h))/h;
    case 'central'
        d=(f(x0+h)-f(x0-h))/(2*h);
    otherwise
        error('method harus forward, backward, atau central.');
end
end
