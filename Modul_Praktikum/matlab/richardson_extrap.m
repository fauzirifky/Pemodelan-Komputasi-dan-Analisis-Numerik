function [DR,Dh,Dhr] = richardson_extrap(approx,h,p,r)
%RICHARDSON_EXTRAP Ekstrapolasi Richardson generik.
% approx(h) harus mengembalikan hasil metode dasar pada ukuran langkah h.
% p adalah orde galat utama; r adalah faktor perhalusan (default 2).
if nargin < 4 || isempty(r)
    r = 2;
end
if p <= 0 || r <= 1
    error('Gunakan p > 0 dan r > 1.');
end

Dh  = approx(h);
Dhr = approx(h/r);
rp  = r^p;
DR  = (rp*Dhr-Dh)/(rp-1);
end
