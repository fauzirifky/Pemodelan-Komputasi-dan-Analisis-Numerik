function [R,I]=romberg_fun(f,a,b,m)
R=nan(m,m);
for j=1:m
    n=2^(j-1); R(j,1)=trap_comp(f,a,b,n);
    for k=2:j
        R(j,k)=R(j,k-1)+(R(j,k-1)-R(j-1,k-1))/(4^(k-1)-1);
    end
end
I=R(m,m);
end
