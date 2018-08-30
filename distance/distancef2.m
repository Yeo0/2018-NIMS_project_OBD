function D=distancef2(A, B)

A1 = linspace(A(1),A(length(A)),length(A));
B1 = interp1(A,B,A1,'spline');

D1 = trapz(A1,B1);


A2 = linspace(A(1),A(length(A)),2*length(A)-1);
B2 = interp1(A,B,A2,'spline');

D2 = trapz(A2,B2);

D  = (4/3)*D2 - (1/3)*D1;


