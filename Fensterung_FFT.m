function[]=Fensterung_FFT();

load('Signal6.mat');

fs=Fs;  %Holen der Abtastfrequenz
signal=signal6; %Holen des Signals !Signal aus Workspace ausw�hlen!

N=length(signal);  %Anzahl der Datenpunkte vom Signal
t=0:1/fs:(N/fs)-1/fs;   %Erstellen der Zeitbasis in Abh�ngigkeit der 
                        %Abtastfrequenz und der Anzahl der Datenpunkte
                        
signal=signal(1:1024); %K�rzen des Signals auf ein 2^x f�r FFT notwendig; zB 512, 1024, 2048 ... Punkte
t=t(1:1024);   %t k�rzen zur gr��e des Signals
signal=signal';    %Aus Zeilenvektor Spaltenvektor machen, notwendig f�r FFT und Plot

subplot(2,1,1);
plot(t,signal); %Zeitsignal Ploten
axis([min(t) max(t) min(signal) max(signal)])
title('Zeitsignal')
xlabel('t/s');
ylabel('Amplitude');

[S,f] = spectrum_calculation(signal, fs, 'Hamming'); %FFT Durchf�hren um Spektrum zu bekommen, 
                                                      %mit Hamingfensterung

subplot(2,1,2);
plot(f,S);  %Spektrum Ploten
title('Hammingfensterung')
xlabel('f/Hz');
ylabel('Betrag in dBm');

end