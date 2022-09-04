%in the name of the most High

figure(1);
imageX = imread('pillsetc.png');
imshow(imageX);

figure(2);
I = rgb2gray(imageX);
imshow(I);
bw = imbinarize(I);
figure(3);
imshow(bw);

bw = bwareaopen(bw,30);
figure(4);
imshow(bw);


se = strel('disk',2);
bw = imclose(bw,se);

figure(5);
imshow(bw);


bw =imfill(bw,'holes'); 

figure(6);
imshow(bw);


[B,L] =   bwboundaries(bw,'noholes');


figure(7);
imshow(label2rgb(L,@jet,[0.5 0.5 0.5]));


hold on;

for k = 1:length(B)
    bound = B{k};
    plot(bound(:,2),bound(:,1),'w','LineWidth',2);
end

st = regionprops(L,'Area','Centroid');

thersh = 0.94;

for k = 1: length(B)
    
    bound = B{k};
    deltaSQ = diff(bound).^2;
    prem = sum(sqrt(sum(deltaSQ,2)));
    area = st(k).Area;
    
    metric = 4*pi*area/prem^2;
    
    strMertic = sprintf('%2.2f',metric);
    disp(strMertic);
    if metric>thersh
        cent = st(k).Centroid;
        plot(cent(1),cent(2),'ko');
    end
    
end
    

    



