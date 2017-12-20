%% initialization
close all;
clearvars;
clc;

%% reading
%task 1
I_ertka = imread('ertka.bmp');

%taks 2
I_hom = imread('hom.bmp');

%% processing 
w = 3;
SE_square = strel('square', w);
I_open = imopen(I_ertka, SE_square);
I_close = imclose(I_ertka, SE_square);
I_clear = imclose(I_open, SE_square);

I_square = imerode(I_ertka, SE_square);
I_square1 = imerode(I_square, SE_square);
I_square2 = imerode(I_square, SE_square);
I_backSquare = imdilate(I_ertka, SE_square);

%task 2
SE1 = [0 1 0; 1 1 1; 0 1 0];
SE2 = [1 0 1; 0 0 0; 1 0 1];
I_bwhitmiss = bwhitmiss(I_hom,SE1,SE2);


%% showing
%taks 1
figure;
x = 3; y = 3;
subplot(x, y, 1); imshow(I_ertka); title('original');
subplot(x, y, 2); imshow(I_square); title('square');
subplot(x, y, 3); imshow(I_backSquare); title('imdilate');
subplot(x, y, 4); imshow(I_square2); title('square 3 times');
subplot(x, y, 5); imshow(I_open); title('open');
subplot(x, y, 6); imshow(I_close); title('close');
subplot(x, y, 7); imshow(I_clear); title('open + close');
subplot(x, y, 8); imshow(I_hom); title('hom');
subplot(x, y, 9); imshow(I_bwhitmiss); title('bwhitmiss');