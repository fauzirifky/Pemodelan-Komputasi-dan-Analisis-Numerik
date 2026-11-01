function [DR,Dh,Dhr] = richardson_extrap(approx,h,p,r)
%RICHARDSON_EXTRAP Ekstrapolasi Richardson generik.
% approx(h) mengembalikan hasil metode dasar pada ukuran langkah h.
if nargin < 4 || isempty(r)
    r = 2;
end
if p <= 0 || r <= 1
    error('Gunakan p > 0 dan r > 1.');
end
Dh  = approx(h);
Dhr = approx(h/r);
DR  = (r^p*Dhr-Dh)/(r^p-1);
end
