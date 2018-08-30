function D=distancef(A, B)

A1 = linspace(A(1),A(length(A)),length(A));
B1 = interp1(A,B,A1,'spline');

D  = trapz(A1,B1);