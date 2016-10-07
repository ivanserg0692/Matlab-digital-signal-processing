function y= dft(x)

N = length(x);
y=zeros(1,N);
for(k = 0:1 : N-1)
    for(n = 0:1:N-1)
        y(1,k+1) = y(1,k+1) + x(1,n+1)*exp(-sqrt(-1)*2*pi*k*n/N);
    end
end
