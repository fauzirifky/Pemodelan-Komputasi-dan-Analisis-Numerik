function d = numdiff(f,x0,method,h)
%NUMDIFF Turunan pertama dengan beberapa skema beda hingga.
% x0 boleh skalar atau vektor jika f mendukung operasi elementwise.
if nargin < 4 || isempty(h)
    h = eps^(1/3)*max(1,max(abs(x0(:))));
end

switch lower(method)
    case 'forward'
        d = (f(x0+h)-f(x0))/h;
    case 'backward'
        d = (f(x0)-f(x0-h))/h;
    case 'central'
        d = (f(x0+h)-f(x0-h))/(2*h);
    case {'central4','central-4','fourth'}
        d = (f(x0-2*h)-8*f(x0-h)+8*f(x0+h)-f(x0+2*h))/(12*h);
    otherwise
        error('Metode: forward, backward, central, atau central4.');
end
end
