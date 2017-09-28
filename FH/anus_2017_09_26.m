A=rand(2,3);
A(3,:)= 2*A(1,:)-3*A(2,:);
det(A);

C=rand(3,3);
b=rand(3,1);
x=C\b;

x_1=pinv(A)*b;
x_2=A\b;

x_1-x_2

%expm bildet summe von Matrixmultiplikation: 1/k! * A!^k
%max: Summe Spaltenweise

%%
%Findet größten Wert in einer Matrix
A==max(max(A))
%%
%sortiert Spaltenweise
sort(A)
%sortiert Zeilenweise
sort(A.').'
%%
%Boolean
LI=logical([0 0 1 1 0 1 0 1])
%%
%Vergleich liefert logical Matrix
A>0
%Einschränkung auf einen Wertebereich
A(A>10)=10


