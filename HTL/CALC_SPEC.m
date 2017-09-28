function[S,f] = CALC_SPEC(s, fs, window)
%GEIGER KLAUS


N = length(s);         % Anzahl der Samples bestimmen

t=0:1/fs:(N/fs)-1/fs;  % Zeitvektor erstellen
NFFT = length(t);      % Anzahl Datenpunkte anhand des Zeitvektors 


%Fenster auswählen, je nach übergebener Variable:
switch(window)
    case 'Rect'                        % Rect Window - No change needed
        windowed = s;
    case 'Hamming'                     % Hamming Window 
        windowed = s(:) .* hamming(N);
    case 'Hanning'                     % Hanning Window
        windowed = s(:) .* hann(N);
    case 'Kaiser'                       % Kaiser Window
        windowed = s(:) .* kaiser(N);
    otherwise                           % Rechteck
        windowed = s;
end  

S = fft(windowed);      % fft durchführen
S = abs(S);             % Betrag bilden (Imaginären Teil entfernen)

cutoff = ceil(NFFT/2);  % nur bis zur halben Frequenz die Werte nutzen
S = S(1:cutoff);
S = S/cutoff;           % normalisieren

S = log(S);             % Für Logaritmische Darstellung

f=(0:cutoff-1)*fs/NFFT; % Frequenzvektor erstellen


end