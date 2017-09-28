function[]= Audio(file,Offset,samples)
%file: (Pfad+)Filename des Soundfiles
%Offset: Offset vom Beginn des Signals (10^4 s)
%samples: Anzahl der verwendeten Samples (2^n)

[s,Fs]=audioread(file); %Liest Samplerate und Zeitsignal aus dem File

%W�hlt x Samples mit eingestelltem Offset aus
y=s(Fs+Offset:Fs+Offset++samples-1);
%Generiert Hann-Fenster f�r x Samples
window=hann(samples);
%Fenstert die Funktion
y_w=y.*window;

%Bildet Realteil der FFT des Original- und gefensterten Signals
Y=abs(fft(y));
Y_w=abs(fft(y_w));
%Bestimmt Nummer der Punkte=Sample-Anzahl und cutoff
NFFT=length(Y);
cutoff=ceil(NFFT/2);
%Berechnet diskrete Punkte f�r FFT-Plot
k=(0:NFFT-1)*Fs/NFFT;

%W�hlt Subplot 1 aus, plotet die ungefensterte FFT
subplot(2,1,1);
plot(k,Y/cutoff);
%Beschriftet und Skaliert die Achsen, aktiviert Grid
xlabel('f');
title('Frequenzspektrum');
axis([0 2000 0 0.1]);
grid on;

%W�hlt Subplot 2 aus, plotet die gefensterte FFT
subplot(2,1,2);
plot(k,Y_w/cutoff);
%Beschriftet und Skaliert die Achsen, aktiviert Grid
xlabel('f');
title('Frequenzspektrum (Hann)');
axis([0 2000 0 0.1]);
grid on;

end
