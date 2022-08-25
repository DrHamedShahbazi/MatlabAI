


function Y = systemBBox(X)

a = X(1);
b = X(2);
c = X(3);

d = (a -b)^2 +(a -c)^2 +(b -c)^2;

Y = d + a+ b+c;