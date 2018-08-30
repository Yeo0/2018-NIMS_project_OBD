function D=distancef3(A, B)

A1 = linspace(A(1),A(length(A)),length(A));
B1 = interp1(A,B,A1,'spline');

D1 = trapz(A1,B1);


A2 = linspace(A(1),A(length(A)),2*length(A)-1);
B2 = interp1(A,B,A2,'spline');

D2 = trapz(A2,B2);

A3 = linspace(A(1),A(length(A)),4*length(A)-3);
B3 = interp1(A,B,A3,'spline');

D3 = trapz(A3,B3);

D3 = (4/3)*D3 - (1/3)*D2;
D2 = (4/3)*D2 - (1/3)*D1;

D  = (16/15)*D3 - (1/15)*D2; 

