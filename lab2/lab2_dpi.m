clearvars;
close all;
clc;

%% Read file
I512 = imread('lena.bmp');
I256 = imresize(I512, 0.5);
I128 = imresize(I512, 0.25);
I64  = imresize(I512, 0.125);

%% Display on screen
subplot(2,2,1);
imshow(I512, 'InitialMagnification', 'fit');
subplot(2,2,2);
imshow(I256, 'InitialMagnification', 200);
subplot(2,2,3);
imshow(I128, 'InitialMagnification', 400);
subplot(2,2,4);
imshow(I64, 'InitialMagnification', 800);
