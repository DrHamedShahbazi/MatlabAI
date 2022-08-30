%deep neural networks

clc
clear
digitDatasetPath = fullfile(matlabroot,'toolbox','nnet','nndemos',...
    'nndatasets','DigitDataset');
digitData = imageDatastore(digitDatasetPath,...
    'IncludeSubfolders',true,'LabelSource','foldernames');


labelnum = countEachLabel(digitData);

img = readimage(digitData,1);
size(img);
trainfiles =750;
[trainData, valData] = splitEachLabel(digitData,trainfiles,'randomize');
%define a deep nn

layers = [
    imageInputLayer([28 28 1]);
    convolution2dLayer(3,16,'Padding',1);
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(2,'Stride',2);
    
    convolution2dLayer(3,32,'Padding',1);
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(2,'Stride',2);
    
    convolution2dLayer(3,64,'Padding',1);
    batchNormalizationLayer
    reluLayer
    
    fullyConnectedLayer(10);
    softmaxLayer
    classificationLayer 
    ];

options = trainingOptions('sgdm','MaxEpochs',4,'ValidationData',valData,'ValidationFrequency',30);
net = trainNetwork(trainData,layers,options);
 pL= classify(net,valData);
 
 realLabel = valData.Labels;
 acc = sum(pL ==realLabel)/numel(realLabel)
 
 
 
 
