function[e] = Calc_Exp()

format long;
e=1;
i=1;
while abs(exp(1)-e)>eps
    e=e+1/factorial(i);
    i=i+1;
end
disp(['Number of Summands: ',num2str(i)])
