function[] = FFT_signal();
%%
%L�dt Signal aus File
load('signal20.mat');

%%
%Extrahiert Samplefrequenz und Signal
fs=Fs;
signal=signal20;

%%
%Erstellt diskrete Zeitbasis
N=length(signal);
t=0:1/fs:N/fs-(1/fs);

%%
%Beschr�nkt Signal und Zeitbasis auf 1024 Samples (notwendig f�r FFT)
signal=signal(1:1024);
t=t(1:1024);

%%
%Bestimmt L�nge des Signals und berechnet neue Zeitbasis
N = length(signal);
t=0:1/fs:(N/fs)-1/fs;
NFFT=length(t);

%%
%Fensterung des Signals
signal_w=signal(:) .* hann(N);

%%
%FFT wird durchgef�hrt und Imagin�rteil entfernt
S=fft(signal_w);
S=abs(S);

%%
%Entfernt die gespiegelte H�lfte des Spektrums
cutoff=ceil(NFFT/2);
S=S(1:cutoff);

%%
%Normierung des Betragsspektrums
S=S/cutoff;
S=log(S);

%%
%Erstellt diskrete Frequenzbasis
f=(0:cutoff-1)*fs/NFFT;

%%
%Ausgabe Zeitsignal
subplot(2,1,1);
plot(t,signal);
axis([min(t) max(t) min(signal) max(signal)]);
xlabel('t/s');
ylabel('Amplitude');

%%
%Ausgabe gefenstertes Betragsspektrum
subplot(2,1,2);
plot(f,S);
axis([min(f) max(f) min(S) max(S)]);
xlabel('f/Hz');
ylabel('Amplitude/dB');

end