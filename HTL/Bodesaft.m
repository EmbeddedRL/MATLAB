fs=48000;
B=[1 2 1];
A=[1 -1.81534 0.831006];H=tf(B,A,1/fs,'variable','z');bd=bodeplot(H*0.003916);grid;