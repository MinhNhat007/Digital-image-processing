clearvars;
close all;
clc;

%% Read file
I512 = imread('lena.bmp');
I128 = imresize(I512, 0.25);

%% Processing
Is31 = imadjust(I128, [0 1], [0 31/255]);
Is15 = imadjust(I128, [0 1], [0 15/255]);
Is7  = imadjust(I128, [0 1], [0 7/255]);
Is3  = imadjust(I128, [0 1], [0 3/255]);
Is1  = imadjust(I128, [0 1], [0 1/255]);

%% Display
subplot(2, 3, 1);
imshow(I128, []);
subplot(2, 3, 2);
imshow(Is31, []);
subplot(2, 3, 3);
imshow(Is15, []);
subplot(2, 3, 4);
imshow(Is7, []);
subplot(2, 3, 5);
imshow(Is3, []);
subplot(2, 3, 6);
imshow(Is1, []);
