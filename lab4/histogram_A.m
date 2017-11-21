%% initation
clearvars;
close all;
clc;

%% read images
I_1 = imread('lena1.bmp');
I_2 = imread('lena2.bmp');
I_3 = imread('lena3.bmp');
I_4 = imread('lena4.bmp');
I_h1 = imread('hist1.bmp');
I_h2 = imread('hist2.bmp');
I_h3 = imread('hist3.bmp');
I_h4 = imread('hist4.jpg');

%% processing
n = 256;
count = 1;
figure(count);
subplot(2,2,1);
imshow(I_h1);
subplot(2,2,2);
imhist(I_h1,n);
subplot(2,2,3);
I_adjust = imadjust(I_h1);
imshow(I_adjust);
subplot(2,2,4);
imhist(I_adjust);

count = count + 1;
figure(count);
%first image
subplot(4, 2, 1);
imshow(I_1);
subplot(4, 2, 2);
imhist(I_1, n);
%second image
subplot(4, 2, 3);
imshow(I_2);
subplot(4, 2, 4);
imhist(I_2, n);
%third image
subplot(4, 2, 5);
imshow(I_3);
subplot(4, 2, 6);
imhist(I_3, n);
%fourth image
subplot(4, 2, 7);
imshow(I_4);
subplot(4, 2, 8);
imhist(I_4, n);

%% histogram skumulowany
[H,x] = imhist(I_h1);
C = cumsum(H);
k = max(C)/max(H);
C2 = C/k;

count = count + 1;
figure(count);
subplot(1,3,1);
imshow(I_h1);
subplot(1,3,2);
plot(x,H);
subplot(1,3,3);
plot(x,C2);

%% HE
LUT = C/max(C)*255;
LUT = uint8(LUT);
I_LUT = intlut(I_h1, LUT);
count = count + 1;
figure(count);
subplot(3, 2, 1);
imshow(I_h1);
subplot(3, 2, 2);
imhist(I_h1);
subplot(3, 2, 3);
imshow(I_LUT);
title('I_LUT');
subplot(3,2,4);
imhist(I_LUT);

subplot(3, 2, 5);
J = histeq(I_h1, 256);
imshow(J);
title('histeq');
subplot(3, 2, 6);
imhist(J);

%% A_14
I_r2 = imadjust(I_h2);
I_he2 = histeq(I_h2);
I_clahe2 = adapthisteq(I_h2);

I_r3 = imadjust(I_h3);
I_he3 = histeq(I_h3);
I_clahe3 = adapthisteq(I_h3);

I_r4 = imadjust(I_h4);
I_he4 = histeq(I_h4);
I_clahe4 = adapthisteq(I_h4);

count = count + 1;
figure(count);
subplot(2,2,1);
imshow(I_h2);
title('original');
subplot(2,2,2);
imshow(I_r2);
title('rozciaganie');
subplot(2,2,3);
imshow(I_he2);
title('he');
subplot(2,2,4);
imshow(I_clahe2);
title('CLAHE');

count = count + 1;
figure(count);
subplot(2,2,1);
imshow(I_h3);
title('original');
subplot(2,2,2);
imshow(I_r3);
title('rozciaganie');
subplot(2,2,3);
imshow(I_he3);
title('he');
subplot(2,2,4);
imshow(I_clahe3);
title('CLAHE');

count = count + 1;
figure(count);
subplot(2,2,1);
imshow(I_h4);
title('original');
subplot(2,2,2);
imshow(I_r4);
title('rozciaganie');
subplot(2,2,3);
imshow(I_he4);
title('he');
subplot(2,2,4);
imshow(I_clahe4);
title('CLAHE');