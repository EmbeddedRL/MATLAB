%Reibenwein Lukas 1.DIC-HÜ
function []=fourier(H,Ti,T,N)
%H: Höhe des Signals, Ti: Pulsweite des Signals, T: Periode des Signals
%N: Anzahl der zusammengefügten Sinussignale

t=-1.5*T:Ti/10000:1.5*T; %Zeitbereich definieren          
a0=H*Ti/T;              %Berechnung Gleichanteil               
w=2*pi/T;               %Berechnung Kreisfrequenz           
s1=0;                   %Signal definieren
s1=s1+a0;               %Gleichanteil hinzufügen
%s2(1)=stem(a0);

for i=1:1:N    
    an=2*a0*sin(i*pi*(a0/H))/(i*pi*(a0/H)); %Berechnet aktuellen Sinus
    s1=s1+an*cos(i*w*t);                    %Fügt aktuellen Sinus zum Signal dazu 
    %s2(i+1)=stem(an);
end

%Zeichnet Signal, setzt Titel und Achsenbeschriftung
%subplot(2,1,1);
plot (t,s1);                 
title('Fourier-Analyse Rechteckpuls');      
xlabel('t');                
ylabel('s1(t)');            
grid on;

%t=0:1:N;
%subplot(2,1,2);
%plot(t,s2); 

end