function [y1] = predictEngineTorqueAndEmision(x1)

x1_step1.xoffset = [0.6;576.2];
x1_step1.gain = [0.00638162093171666;0.00163185378590078];
x1_step1.ymin = -1;

% Layer 1
b1 = [-8.9432858485032866724;14.355345639394894164;1.5694285830720766661;10.862564127049457952;0.081052581006947274633;-0.66220820646949973831;-3.4859766268134162459;-0.47344212805019825208;-0.30084139216887695323;-0.53252520509757717004;-1.8482952122182298993;-0.094875561930449867076;-5.2000999914531984558;-1.8136785906868624352;1.1626104143506126309;-0.133207101541538947;4.5624281029188740177;1.8078214201930784544;-7.0416611658119601103;7.4651903267744215142];
IW1_1 = [8.1545194616699614443 8.1636501483491663578;-6.0883443790680731311 -17.931176565942731571;-1.4234206794443362565 0.083337165924163389419;-11.45808739789650943 2.5309768544135078372;1.666278910244453737 -2.2456900989392782897;2.494720578118915455 -0.97839825638769650773;11.670233662210165448 -8.1701755008052376894;1.5544282178759576407 -2.7781221772155642036;0.82019917159519195593 -4.8408017142724322213;5.9430563906293984999 -4.0926800035388097854;2.0497518433265571325 -4.1941142312929615699;1.1646771582592183591 -5.0850453397922441567;0.5905218560777919512 7.9463794695075851138;-3.0640513638272106611 6.1862161622224318691;3.0774985411364141896 0.71302520586849704731;-0.53461890215762242207 -0.027392938285108425073;3.1790754766936721865 -3.6186061203196691061;1.8813754054206375255 -0.73814102930029101834;-10.676277926892471015 -0.28306448128961292365;3.3261765007282124706 6.4365611033878451508];

% Layer 2
b2 = [-0.17787035337775602972;-1.3280384616788125651];
LW2_1 = [-0.013428001349907674189 0.014522545203356541227 -0.1980108655522355432 0.0047425633324580203018 0.073697040594120993839 -0.068272407128713713531 0.0077958709839293927057 -0.068054952629269693798 -0.19257647815253989276 0.014998853490635517816 0.013770985123446878931 0.15558376567385723277 0.023244426578355535662 0.0029689155208940777933 -0.056109174469873228375 -1.7938215691378698313 -0.0083926221054037471181 0.20328343139646407045 0.013550836046592535516 -0.0036217742521939622416;-0.10967458520633648067 0.021295941744016663039 0.17488932584585667462 0.11176254568053427263 1.1808610568480495395 -0.22482583172313849729 -0.0089448063100218376531 -1.4823528635909508644 -2.5431408948993956542 -0.11922332415531951277 1.0000658766744272565 2.3614127338035175718 -0.0085800565970510916936 0.095832680121897717562 0.34115048636371514412 0.58609637514436940808 -0.30585261565635513126 1.3687319460364892887 0.13192160652294884771 0.39706873806436404628];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = [0.00101988781234064;0.00112739571589628];
y1_step1.xoffset = [-176.7;0];

% ===== SIMULATION ========

% Dimensions
Q = size(x1,2); % samples

% Input 1
xp1 = mapminmax_apply(x1,x1_step1);

% Layer 1
a1 = tansig_apply(repmat(b1,1,Q) + IW1_1*xp1);

% Layer 2
a2 = repmat(b2,1,Q) + LW2_1*a1;

% Output 1
y1 = mapminmax_reverse(a2,y1_step1);
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