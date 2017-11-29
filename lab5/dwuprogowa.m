%% initation
clc;
close all;
clearvars;

numberImage = 0;

%% reading
I_O = imread('bart.bmp');

%% processing
progDolny = 190;
progGorny = 210;
I_BW = I_O > progDolny & I_O < progGorny;
I_BW = uint8(I_BW);

%% showing
numberImage = numberImage + 1;
figure(numberImage);
x = 2; y = 2;
subplot(x,y,1); imshow(I_O); title('Original');
subplot(x,y,2); imhist(I_O);
subplot(x,y,3); imshow(I_BW,[]); title('From 190 - 210');
subplot(x,y,4); imhist(I_BW); 