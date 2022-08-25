

sumError = 0;
for i =1 :10

x1 =randi([50 100]);
x2 =randi([50 100]);
x3 =randi([50 100]);
X = [x1 x2 x3];
disp(X);
a =input('X is');

yEstimation=systemModelEstimation(X);
yMain = systemBBox(X);

disp(yEstimation);
disp(yMain);

y = (yMain - yEstimation)^2;
sumError = sumError + y;

end

disp(sumError);

