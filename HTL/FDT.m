fs=1000;
t=0:1/fs:1000-1000/fs;
w1=2*pi*10;
w2=2*pi*100;
w3=2*pi*50;

x=3*sin(w1*t) + 1.5*cos(w2*t) + 4*sin(w3*t+3);

subplot(3,1,1);
plot(t,x);

Nsamps=length(x);
NFFT=Nsamps;
X=fft(x);
X_mag=abs(X); 
X_phase=radtodeg(angle(X));

cutoff=ceil(NFFT/2);
k=(0:NFFT-1)*fs/NFFT;

subplot(3,1,2);
plot(k,X_mag/cutoff);

subplot(3,1,3);

plot(k,X_phase/cutoff);


