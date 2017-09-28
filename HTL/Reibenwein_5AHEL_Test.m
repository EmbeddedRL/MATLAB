function[]= Reibenwein_5AHEL_Test(s,fs)

%% Bestimmt die Länge des Signals und legt die Datenpunkte fest
N=length(s);
S=s(1/fs:1/fs++N-1);

%% Fenstert die Zeitfunktionen mit den jeweiligen Fensterfunktionen
S_Hann=S*hann(N);
S_Hamm=S*hamming(N);
S_Kaiser=S*kaiser(N);

%% Bildet Realteil der FFT des Original- und gefensterten Signals
Y=abs(fft(S));
Y_Hann=Y*hann(N);
Y_Hamm=abs(fft(S_Hamm));
Y_Kaiser=abs(fft(S_Kaiser));

%%% Bestimmt cutoff und Skalierung für die FFT-Plots
cutoff=ceil(N/2);
%Berechnet diskrete Punkte für FFT-Plot
k=(0:N-1)*fs/N;

%% Plotet Zeitsignal
subplot(3,1,1);
plot(k,S);
axis([0 fs -2 2]);

%% Plotet DFT mit Rechteckfenster
subplot(3,1,2);
semilogy(k,20*log10(Y_Hamm/cutoff));

xlabel('f');
ylabel('Amplitude');
title('Frequenzspektrum');
% axis([0 fs 0 10]);
