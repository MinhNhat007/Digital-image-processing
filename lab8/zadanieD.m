%% initialization
close all;
clearvars;
clc;

%% reading 
I_cal = imread('calculator.bmp');

%% processing
SE = ones(1, 71);
marker = imerode(I_cal,SE);
I_rekonstrukcja = imreconstruct(marker, I_cal);
I_tophat = imtophat(I_cal, SE);
I_open = imopen(I_cal, SE);
I_roznice = imabsdiff(I_cal, I_tophat);
I_roznice1 = imabsdiff(I_cal, I_rekonstrukcja);




%% showing
figure;
x = 2; y = 3;
subplot(x, y, 1); imshow(I_cal); title('original calcu');
subplot(x, y, 2); imshow(I_rekonstrukcja); title('calculator rekonstrukcja');
subplot(x, y, 3); imshow(I_tophat); title('calculator tophat');
subplot(x, y, 4); imshow(I_open); title('calculator open');
subplot(x, y, 5); imshow(I_roznice); title('difference with tophat');
subplot(x, y, 6); imshow(I_roznice1); title('difference with rekonstrukcja');


%% taks 2
SE = ones(1, 11);
marker = imerode(I_cal,SE);
I_rekonstrukcja = imreconstruct(marker, I_cal);
I_tophat = imtophat(I_cal, SE);
I_open = imopen(I_cal, SE);
I_roznice = imabsdiff(I_cal, I_tophat);
I_roznice1 = imabsdiff(I_cal, I_rekonstrukcja);
figure;
x = 2; y = 3;
subplot(x, y, 1); imshow(I_cal); title('original calcu');
subplot(x, y, 2); imshow(I_rekonstrukcja); title('calculator rekonstrukcja');
subplot(x, y, 3); imshow(I_tophat); title('calculator tophat');
subplot(x, y, 4); imshow(I_open); title('calculator open');
subplot(x, y, 5); imshow(I_roznice); title('difference with tophat');
subplot(x, y, 6); imshow(I_roznice1); title('difference with rekonstrukcja');

%% task 3
SE = ones(1, 21);
