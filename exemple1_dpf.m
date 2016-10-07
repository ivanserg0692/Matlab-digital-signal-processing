%пример использования функции dpf
n = 1:2000;
dt = 1/4000;
t=n*dt;
x= sin(2*pi*500*t) + sin(2*pi*1500*t);
y=dpf(x);
fd = 1/dt;
df = fd/2000;
plot(0:df:1999*df,abs(y));
