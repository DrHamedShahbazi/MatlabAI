%in the name of the most high


l1 =10;
l2 =8;
theta1 =0:0.1:pi/2;
theta2 =0:0.1:pi;


[T1,T2] = meshgrid(theta1,theta2);


X = l1*cos(T1) + l2*cos(T1+T2);
Y = l1*sin(T1) + l2*sin(T1+T2);

data1 = [X(:) Y(:) T1(:)];
data2 = [X(:) Y(:) T2(:)];

opt = anfisOptions;
opt.InitialFIS = 7;
opt.EpochNumber =100;


network1 = anfis(data1,opt);

opt.InitialFIS = 3;

network2 = anfis(data2,opt);


x = 2: 0.1 :4;
y = 8 : 0.1 :10;
[X,Y] = meshgrid(x,y);

c2 = (X.^2 + Y.^2 - l1^2 - l2^2)/(2*l1*l2);
s2 = sqrt(1-c2.^2);
TH2 = atan2(s2,c2);

k1 = l1+l2.*c2;
k2 = l2*s2;
TH1 = atan2(Y,X) - atan2(k2,k1);


XY = [X(:) Y(:)];

theta1p = evalfis(XY,network1);
theta2p = evalfis(XY,network2);


err1 = TH1(:) - theta1p;
err2 = TH2(:) - theta2p;

subplot(2,1,1);
plot(err1);


subplot(2,1,2);
plot(err2);






