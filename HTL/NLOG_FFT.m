function[S,f]=NLOG_FFT(s,fs, window)
% S ... Amplitudenspektrum, normalisiert, logratithmiert
% f ... Frequenzvektor
% s ... Zeitsignal
% fs ... Abtastfrequenz       

N = length(s); % Anzahl Samples

switch(window)
    case 'Hanning'
        s_win = s .* hann(length(s));
    case 'Hamming'
        s_win = s .* hamming(N);
    case 'Blackman'
        s_win = s .* blackman(N);
    otherwise % Rechteck
        s_win = s;
end  

t=0:1/fs:(N/fs)-1/fs; % Zeitvektor
NFFT = length(t); % Anzahl Datenpunkte im Zeitvektor
S=fft(s_win); % fft durchführen
S=abs(S); % imaginären Teil wegschneiden
cutoff=ceil(NFFT/2); % nur bis zur halben Frequenz die Werte nutzen
S = S(1:cutoff); % die Hälfte der Werte "wegschmeißen"
S = S/cutoff; % normalisieren
S = log(S);
f=(0:cutoff-1)*fs/NFFT; % Frequenzvektor erstellen
end
