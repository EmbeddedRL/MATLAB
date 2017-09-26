function[]=GEIGER_FFT_uebung()
    %GEIGER KLAUS
    
    load('Signal20.mat');


    signal_t = signal20'; % Zeilen / Spalten Umwandlung
    N = length(signal_t); % Anzahl Samples
    t=0.05:1/Fs:0.1; % Zeitvektor
    
    %% Zeitsignal
    subplot(5,1,1);
    sig = signal_t(550:1100); % Signalvektor von 50 - 100 ms
    plot(t, sig);
    % Formatierung des Plots
    axis([min(t) max(t) min(sig) max(sig)])
    title('Signal')
    xlabel('t/s');
    ylabel('Amplitude');
    
    %% Spektrum mit Hanning-Fenster
    subplot(5,1,2);
    [S_hann,f_hann] = CALC_SPEC(signal_t, Fs, 'Hanning');
    plot(f_hann,S_hann);
    title('Hanning-Window')
    xlabel('f / Hz');
    ylabel('log., Betragspektrum');
    
    %% Spektrum mit Hamming-Fenster
    subplot(5,1,3);
    [S_hamming,f_hamming] = CALC_SPEC(signal_t, Fs, 'Hamming');
    plot(f_hamming,S_hamming);
    title('Hamming-Window')
    xlabel('f / Hz');
    ylabel('log., Betragspektrum');

    %% Spektrum mit Kaiserfenster
    subplot(5,1,4);
    [S_kaiser,f_kaiser] = CALC_SPEC(signal_t, Fs, 'Kaiser');
    plot(f_kaiser,S_kaiser);
    title('Kaiser-Window')
    xlabel('f / Hz');
    ylabel('log., Betragspektrum');
    
    %% Spektrum mit Rechteckfenster
    subplot(5,1,5);
    [S,f] = NLOG_FFT(signal_t, Fs, 'Rect');
    plot(f,S);
    title('Rechteckfenster')
    xlabel('f / Hz');
    ylabel('log., Betragspektrum');
    
end