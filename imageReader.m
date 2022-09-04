%in the name of the most High
clc
clear
image1 = imread('image1.jpg');
subplot(2,2,1);
imshow(image1);
image2 = image1;


image2(:,:,1) = image1(:,:,1);
image2(:,:,2) = 0;
image2(:,:,3) = 0;

subplot(2,2,2);
imshow(image2);

image3 = image1;
image3(:,:,2) = image1(:,:,2);
image3(:,:,1) = 0;
image3(:,:,3) = 0;
subplot(2,2,3);
imshow(image3);

image4 = image1;
image4(:,:,3) = image1(:,:,3);
image4(:,:,1) = 0;
image4(:,:,2) = 0;
subplot(2,2,4);
imshow(image4);

