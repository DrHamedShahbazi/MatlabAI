
clear;
clc;
%Mackey Glass(MG)

load mgdata.dat

time = mgdata(:,1);
x = mgdata(:,2);
figure(1);
plot(time,x);

for t = 118:1117
    Data(t -117,:) =[x(t-18) x(t-12) x(t-6) x(t) x(t+6)];
end

tainData =Data(1:500,:);
testData = Data(501:end,:);

%Anfis model------------neuro fuzzy----------
input =tainData(:,1:4);
target = tainData(:,5);
fismat =genfis(input,target);

opt = anfisOptions('InitialFIS',fismat,'ValidationData',testData);
opt.DisplayANFISInformation =0;
opt.DisplayErrorValues =0;

[fismat1,er1,ss,fismat2,er2]=anfis(tainData,opt);

inputTest =testData(:,1:4);
targetTest = testData(:,5);

outputANFIS = evalfis([input;inputTest],fismat2);

figure(2);
index = 125:1124;
subplot(2,1,1);
plot(time(index),[x(index) outputANFIS]);
subplot(2,1,2);
plot(time(index),x(index)-outputANFIS);














