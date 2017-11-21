%% initation
clearvars;
close all;
clc;

%% read image
I_phobos = imread('phobos.bmp');
load histogramZadany;

%% processing
I_phobosHE = histeq(I_phobos);
I_phobosHE2 = histeq(I_phobos, histogramZadany);
I_r = imadjust(I_phobos);
I_clahe = adapthisteq(I_phobos);
count = 1;
figure(count);
subplot(1,5,1);
imshow(I_phobos);
title('original');
subplot(1,5,2);
imshow(I_phobosHE);
title('lut');
subplot(1,5,3);
imshow(I_phobosHE2);
title('lut with histogram');
subplot(1,5,4);
imshow(I_r);
title('rozciaganie');
subplot(1,5,5)
imshow(I_clahe);
title('clahe');