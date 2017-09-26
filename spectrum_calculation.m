function[S,f]=spectrum_calculation(s,fs,window)

    N = length(s);  %Anzahl der Datenpunkte vom Signal

    switch(window)
        case 'Hanning' %Hanning-Fenster
            s_new = s .* hann(N);   %Punktweises Multiplizieren
        case 'Hamming' %Hamming-Fenster
            s_new = s .* hamming(N);
        case 'Kaiser' %Kaiser-Fenster
            s_new = s .* kaiser(N);
        otherwise % Rechteckfenster
            s_new = s;
    end 


    S=fft(s_new); % FFT durchführen
    S=abs(S/N); % Imaginären Teil wegschneiden und Amplitude normieren (/N) 

    cutoff=ceil(N/2);    % nur bis zur halben Frequenz die Werte nutzen 
                            %(gerundete Mitte der Anzahl der Datenpunkte)
    S = S(1:cutoff); % die Hälfte der Werte "wegschmeißen"

    S = 20*log10(S);    %Umrechnung der Amplitude in dBm
    f=(0:cutoff-1)*fs/N; % Frequenzvektor erstellen und normieren (*fs/N)

end