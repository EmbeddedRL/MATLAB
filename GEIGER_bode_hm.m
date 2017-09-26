%   HTL HOLLABRUNN 2015
%   KLAUS GEIGER
%   5AHEL
% 
%   Bodediagramm des Filters
function[]=bode_hm()

B = [1 2 1];
A = [1 -1.81534 0.831004];
[x,y] = meshgrid(-1:0.01:1,-1:0.01:1);
z = x + 1i*y;
omega = 0:0.01:pi;


Zmag = abs(polyval(B,z))./(abs(polyval(A,z)+eps));
Hmag = (polyval(B,1i*omega))./((polyval(A,1i*omega)+eps));


subplot(3,1,1);
mesh(x,y,Zmag);
title('Betrag [H(z)]');

subplot(3,1,2);
plot(omega,abs(Hmag));
title('Amplitudengang [H(z)]');

subplot(3,1,3);
plot(omega,rad2deg(angle(Hmag)));
title('Phasengang [H(z)]');

end
