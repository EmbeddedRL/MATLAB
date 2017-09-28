B=[1 2 1];
A=[1 -1.81534 0.831006];

[x,y]=meshgrid(-1:0.01:1,-1:0.01:1);
z=x+1i*y;
onega=0:0.01:pi;

Zmag=abs(polyval(B,z))./(abs(polyval(A,z))+eps);
Hmag=(polyval(B,1i*onega))./((polyval(A,1i*onega))+eps);

subplot(3,1,1);
mesh(x,y,Zmag);

subplot(3,1,2);
plot(onega,abs(Hmag));

subplot(3,1,3);
plot(onega,rad2deg(angle(Hmag)));
