%plot();

subplot(2,2,1);

x=linspace(-2*pi,2*pi,10000);
y=sin(x);
plot(x,y);

axis([min(x) max(x) -1.5 1.5]);
title('f(x)=sin(x)');
grid on;

subplot(2,2,2);

y=cos(x);
plot(x,y);

axis([min(x) max(x) -1.5 1.5]);
title('f(x)=cos(x)');
grid on;

subplot(2,2,3);

y=tan(x);
plot(x,y);

axis([min(x) max(x) -10 10]);
title('f(x)=tan(x)');
grid on;


subplot(2,2,4);

y=x.^3;
plot(x,y);

axis([min(x) max(x) -100 100]);
title('f(x)=x^3');
grid on;



