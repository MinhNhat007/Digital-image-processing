%% initialization
close all;
clearvars;
clc;

%% reading
I_ferrari = imread('ferrari.bmp');

%% processing
SE = strel('square', 3);
I_ferrariEro = imerode(I_ferrari, SE);
I_ferrariDys = imdilate(I_ferrari, SE);
I_roznice = imabsdiff(I_ferrariEro, I_ferrariDys);

I_open = imopen(I_ferrari, SE);
I_close = imclose(I_ferrari, SE);
I_tophat = imtophat(I_ferrari, SE);
I_bothat = imbothat(I_ferrari, SE);

%% showing
figure;
x = 2; y = 2;
subplot(x, y, 1); imshow(I_ferrari); title('original ferrari');
subplot(x, y, 2); imshow(I_ferrariEro); title('ferrari ernode');
subplot(x, y, 3); imshow(I_ferrariDys); title('ferrari dilate');
subplot(x, y, 4); imshow(I_roznice); title('difference');

figure;
x = 2; y = 3;
subplot(x, y, 1); imshow(I_ferrari); title('original ferrari');
subplot(x, y, 2); imshow(I_open); title('ferrari open');
subplot(x, y, 3); imshow(I_close); title('ferrari close');
subplot(x, y, 4); imshow(I_tophat); title('ferrari tophat');
subplot(x, y, 5); imshow(I_bothat); title('ferrari bothat');


%% rice
I_rice = imread('rice.png');
SE = strel('disk', 10);
I_riceTophat = imtophat(I_rice, SE);

figure;
x = 1; y = 2;
subplot(x, y, 1); imshow(I_rice); title('original rice');
subplot(x, y, 2); imshow(I_riceTophat); title('rice tophat disk 10');
