load('JapaneseVowelsTrain.mat');

X(1:5)

figure(2)

for i=1:12
    subplot(12,1,13-i);
    plot(X{1}(i,:));
    ylabel(i);
    xticklabels('');
    yticklabels('');
    box off
end

numO = numel(X);
for i=1:numO
    seq = X{i};
    seqLen(i) = size(seq,2);
end;

[seqLen , idx] = sort(seqLen);
X =X(idx);
Y =Y(idx);

figure(3)
bar(seqLen);


miniBatch =27;

miniBatchLocation =miniBatch+1: miniBatch:numO;
Xloc = repmat(miniBatchLocation,[2 1]);
Yloc = repmat([0;30],[1 9]);


inputSize = 12;
outPutsize =100;
numClass = 9;
outMode = 'last';

layers = [
    sequenceInputLayer(inputSize)
    lstmLayer(outPutsize,'OutputMode',outMode)
    fullyConnectedLayer(numClass)
    softmaxLayer
    classificationLayer]

maxEpoch =150;
miniBatch =27;
shuffle ='never';


option = trainingOptions('sgdm','MaxEpochs',maxEpoch,'MiniBatchSize',miniBatch,'Shuffle',shuffle);


net   =  trainNetwork(X,Y,layers,option);
















