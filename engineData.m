
clc;
clear;
[X,T]= engine_dataset;

[m n] = size(X);
disp([m n]);
 

p =0.7;

tainingInput = X(:,1:n*p);
tainingTarget = T(:,1:n*p);

valInput = X(:,n*p:n*p+100);
valTarget = T(:,n*p : n*p+100);


testInput = X(:,n*p+100:end);
testTarget = T(:,n*p+100:end);

x1 =[128;652];
[y1] = predictEngineTorqueAndEmision(x1);
disp(y1);




