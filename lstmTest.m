%Lstm test



Data = load('JapaneseVowelsTest.mat');
xtest = Data.XTest(1:30)
ytest = Data.YTest(1:30)
figure(1)
for i=1:12
    subplot(12,1,13-i);
    plot(xtest{1}(i,:));
    ylabel(i);
end

miniBach =27;
yResult = classify(net,xtest,'MiniBatchSize',miniBach);

acc = sum(ytest == yResult)./numel(ytest);

disp(acc);