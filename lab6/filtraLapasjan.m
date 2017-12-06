%% initialization
close all;
clearvars;
clc;

%% reading
I_Moon = imread('moon.bmp');

%% processing
M = [0 1 0; 1 -4 1; 0 1 0];
M = M/9;
I_MoonM = conv2(double(I_Moon), M, 'same');
I_MoonM1 =  I_MoonM + 128;
I_MoonM2 = abs(I_MoonM);

I_Diff = imabsdiff(double(I_Moon), I_MoonM);
MaskaLap = fspecial('laplacian');
I_MoonLap = uint8(conv2(double(I_Moon), MaskaLap, 'same'));

%% showing
figure;
x = 2; y = 2;
subplot(x,y,1); imshow(I_Moon); title('Original');
subplot(x,y,2); imshow(I_MoonM1, []); title('+ 128');
subplot(x,y,3); imshow(I_MoonM2,[]); title('ABS');
subplot(x,y,4); imshow(I_MoonLap,[]); title('Lapca');