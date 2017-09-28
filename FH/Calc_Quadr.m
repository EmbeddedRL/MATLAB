function[x] = Calc_Quadr(a,b,c)

% Description: Calculates the values of a quadratic equation in the format
%              a*x^2+b*x+c=0 based on the coefficient input
% Input: a: coefficient of x^2
%        b: coefficient of x
%        c: additive coefficient
%        
% Output: x: Result(s) of the equation
xrange=-10:0.01:10;

if a==0
    if b==0
        if c==0
            disp('a&b&c=0 --> Keine Lösung')
        else
            disp('a&b=0 --> Keine Lösung')
        end
    else
        disp('a=0 --> Lineare Gleichung')
        x(1)=-c/b;
        graph=b*xrange+c;
        plot(xrange,graph);
        title(['Lineare Funktion: ',num2str(b),'*x+',num2str(c),]);
        grid on;
    end
else
    disp('Quadratische Gleichung')
    x(1)=(-b+sqrt(b*b-4*a*c))/(2*a);
    x(2)=(-b-sqrt(b*b-4*a*c))/(2*a);
    graph=a*xrange.^2+b*xrange+c;
    plot(xrange,graph);
    title(['Quadratische Funktion: ',num2str(a),'*x^2+',num2str(b),'*x+',num2str(c),]);
    grid on;
end
