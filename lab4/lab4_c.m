%% initation
clearvars;
close all;
clc;

%% read file
I_RGB = imread('lenaRGB.bmp');

%% processing
I_R = I_RGB(:, :, 1);
I_G = I_RGB(:, :, 2);
I_B = I_RGB(:, :, 3);
%I_lena = rgb2gray(I_lena);

Re = histeq(I_R, 256);
Ge = histeq(I_G, 256);
Be = histeq(I_B, 256);
Tmp_RGB = I_RGB;
Tmp_RGB(:, :, 1) = Re;
Tmp_RGB(:, :, 2) = Ge;
Tmp_RGB(:, :, 3) = Be;

I_HSV = rgb2hsv(I_RGB);
I_H = I_HSV(:, :, 1);
I_S = I_HSV(:, :, 2);
I_V = I_HSV(:, :, 3);

Ve = histeq(I_V, 256);

Tmp_HSV = I_HSV;
Tmp_HSV(:, :, 3) = Ve;
I_RGB2 = hsv2rgb(Tmp_HSV);


%% HSV showing
figure(3);
subplot(1,2,1);
imshow(I_RGB);
title('Original');
subplot(1,2,2);
imshow(I_RGB2);
title('HSV -> RGB after histeq V field');

figure(4);
subplot(3,2,1);
imshow(I_H);
title('H field');
subplot(3,2,2);
imhist(I_H);

subplot(3,2,3);
imshow(I_S);
title('S field');
subplot(3,2,4);
imhist(I_S);

subplot(3,2,5);
imshow(I_V);
title('V flield');
subplot(3,2,6);
imhist(I_V);

figure(5);
subplot(1,2,1);
imshow(Ve);
title('histeq for V field');
subplot(1,2,2);
imhist(Ve);


%% RGB showing
figure(1);
subplot(1,2,1);
imshow(I_RGB);
title('Original');
subplot(1,2,2);
imshow(Tmp_RGB);
title('histeq each parts R, G, B');

figure(2);
subplot(3,2,1);
imshow(I_R);
title('R field');
subplot(3,2,2);
imhist(I_R);

subplot(3,2,3);
imshow(I_G);
title('G field');
subplot(3,2,4);
imhist(I_G);

subplot(3,2,5);
imshow(I_B);
title('B flield');
subplot(3,2,6);
imhist(I_B);

