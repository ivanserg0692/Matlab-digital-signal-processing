N = 2048;
Fd = 1024; %частота дисретизации
%Моделируем спектр
Y = zeros(N);
Y(201) = N*exp(-sqrt(-1)*pi/4);
Y(N-200+1) = Y(200+1);
%получаем обратное преобразование фурье и выделяем вещественную часть
X = real(myIFFT(Y));
%строим графики
df = Fd/N;
dt = 1/Fd;
f = 0:df:(N-1)*df;
t = 0:dt:(N-1)*dt;
subplot(2,1,1)
plot(t(1:100),X(1:100));
title('обратное преобразование фурье');
subplot(2,1,2);
plot(f,abs(Y));
title('спектр');
