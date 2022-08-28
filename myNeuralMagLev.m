function [y1,xf1,xf2] = myNeuralMagLev(x1,x2,xi1,xi2)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Generated by Neural Network Toolbox function genFunction, 28-Aug-2022 12:00:51.
%
% [y1,xf1,xf2] = myNeuralNetworkFunction(x1,x2,xi1,xi2) takes these arguments:
%   x1 = 1xTS matrix, input #1
%   x2 = 1xTS matrix, input #2
%   xi1 = 1x5 matrix, initial 5 delay states for input #1.
%   xi2 = 1x5 matrix, initial 5 delay states for input #2.
% and returns:
%   y1 = 1xTS matrix, output #1
%   xf1 = 1x5 matrix, final 5 delay states for input #1.
%   xf2 = 1x5 matrix, final 5 delay states for input #2.
% where TS is the number of timesteps.

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = -0.923630364854819;
x1_step1.gain = 0.410336934951591;
x1_step1.ymin = -1;

% Input 2
x2_step1.xoffset = 0.000275602421621117;
x2_step1.gain = 0.323123950520061;
x2_step1.ymin = -1;

% Layer 1
b1 = [1.6994261744907148692;1.6243473761838256308;0.66709610045281630963;0.29733587806911448981;0.29405421716022089873;0.015434570962007293157;0.95702043300957151395;-0.1746266831012846521;1.4024981211578888551;1.5660883564419401104];
IW1_1 = [-0.87203226388532129043 -0.6257194819010745146 0.0029965433812497014633 0.11869820531901820182 0.8740702691808941438;-0.71655927613066072723 0.41016006511017361058 0.34637153204183618316 0.20419751135749861226 -0.26411268982400987193;0.0040039063295597681486 -0.61131422630480947156 -0.4479702156345591324 0.48796792206868583319 -0.60691534412466474624;-0.12658556691434846853 0.23795820158478422912 -0.021624971929582199187 0.056005359004229426922 -0.086666823902884562725;0.22703643412118784672 -0.3352390887755355986 0.018060396126791486426 -0.036600764958343065536 0.10528475182609964289;0.95625082776618075542 -0.73337250654010355255 0.47524615160414501736 -0.62772272297089648507 -0.83085982542487191171;0.36414282665826763763 0.0038306622966800584276 -0.031922449799495704326 -0.11344015805248806872 -0.075280953241077017135;-0.025877380510509147282 -0.03518515463552723127 0.017168891681418923384 -0.06062199261058640043 0.034772564562871866034;0.39339183449348830157 -0.48006275397317216269 0.23880171853848064512 -0.67913197527610003057 0.35100746781326169765;0.10563973177983228269 0.092413282516920755572 -0.39680384287027170576 0.15420011627202626081 0.017025099431259911598];
IW1_2 = [-0.44899304915901350199 0.04686336996348673678 0.48728253990841008392 -0.82121131038073347241 -0.1749437683544881883;-0.80028285700155432636 -0.54117181494137056585 0.5238076352342622144 0.26490800796516500437 -0.38203934465077821203;-0.30780146723843854195 0.5418866712800796126 -0.018560929751037517216 -0.22860059012535988154 0.12618330293396815001;0.6513424655213539971 -0.3715500632419561633 -0.53986301241907397319 0.36849318600815667013 0.36406556986804322618;0.47988870662308097392 -0.26814265807876336289 0.27896829529574901363 0.247234405658937062 -0.19912719776478779443;0.10129575531959798818 0.095065742688632604018 0.78113752194926844297 0.88819042722797136857 0.68687136028720963132;0.25057121443824931228 0.84938447962589902485 -0.30904129908629618395 0.78222783073644275298 0.59732358407762842223;0.86663435906292463073 0.61306570392301174 -0.97158944785111489573 0.31691761336767132473 -0.70066689391195924319;0.4295924715275531991 -0.18325142991540638304 -1.2071832006204319399 0.27739718309186223166 -0.29311951275335990097;0.0089465890489255888579 -0.63994782418569196025 -0.72838160273153895741 0.22626931422522453263 -0.50581563385157168877];

% Layer 2
b2 = -0.063965125152057572544;
LW2_1 = [-0.0024243042072938036056 -0.1340442137489290253 -0.001621804482868765716 1.1526265901720724738 0.72907681326340811889 0.00075655361315893224303 -0.024013923573635936881 0.76736529080830906402 -0.10893204593550127879 -0.11293760828027396559];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = 0.323123950520061;
y1_step1.xoffset = 0.000275602421621117;

% ===== SIMULATION ========

% Dimensions
TS = size(x1,2); % timesteps

% Input 1 Delay States
xd1 = mapminmax_apply(xi1,x1_step1);
xd1 = [xd1 zeros(1,1)];

% Input 2 Delay States
xd2 = mapminmax_apply(xi2,x2_step1);
xd2 = [xd2 zeros(1,1)];

% Allocate Outputs
y1 = zeros(1,TS);

% Time loop
for ts=1:TS
    
    % Rotating delay state position
    xdts = mod(ts+4,6)+1;
    
    % Input 1
    xd1(:,xdts) = mapminmax_apply(x1(:,ts),x1_step1);
    
    % Input 2
    xd2(:,xdts) = mapminmax_apply(x2(:,ts),x2_step1);
    
    % Layer 1
    tapdelay1 = reshape(xd1(:,mod(xdts-[1 2 3 4 5]-1,6)+1),5,1);
    tapdelay2 = reshape(xd2(:,mod(xdts-[1 2 3 4 5]-1,6)+1),5,1);
    a1 = tansig_apply(b1 + IW1_1*tapdelay1 + IW1_2*tapdelay2);
    
    % Layer 2
    a2 = b2 + LW2_1*a1;
    
    % Output 1
    y1(:,ts) = mapminmax_reverse(a2,y1_step1);
end

% Final delay states
finalxts = TS+(1: 5);
xits = finalxts(finalxts<=5);
xts = finalxts(finalxts>5)-5;
xf1 = [xi1(:,xits) x1(:,xts)];
xf2 = [xi2(:,xits) x2(:,xts)];
end

% ===== MODULE FUNCTIONS ========

% Map Minimum and Maximum Input Processing Function
function y = mapminmax_apply(x,settings)
y = bsxfun(@minus,x,settings.xoffset);
y = bsxfun(@times,y,settings.gain);
y = bsxfun(@plus,y,settings.ymin);
end

% Sigmoid Symmetric Transfer Function
function a = tansig_apply(n,~)
a = 2 ./ (1 + exp(-2*n)) - 1;
end

% Map Minimum and Maximum Output Reverse-Processing Function
function x = mapminmax_reverse(y,settings)
x = bsxfun(@minus,y,settings.ymin);
x = bsxfun(@rdivide,x,settings.gain);
x = bsxfun(@plus,x,settings.xoffset);
end
