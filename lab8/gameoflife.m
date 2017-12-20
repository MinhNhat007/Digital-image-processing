%% initialization
close all;
clearvars;
clc;

%% reading 
load gra;

%% processing
myLut = makelut(@law, 3);
plansza = plansza1;

%% showing
figure;
x = 3; y = 3;
subplot(x, y, 1); imshow(plansza); title('0 generation');

myGeneration1 = applylut(plansza, myLut);
subplot(x, y, 2); imshow(myGeneration1); title('1 generation');

myGeneration2 = applylut(myGeneration1, myLut);
subplot(x, y, 3); imshow(myGeneration2); title('2 generation');

myGeneration3 = applylut(myGeneration2, myLut);
subplot(x, y, 4); imshow(myGeneration3); title('3 generation');

myGeneration4 = applylut(myGeneration3, myLut);
subplot(x, y, 5); imshow(myGeneration4); title('4 generation');

myGeneration5 = applylut(myGeneration4, myLut);
subplot(x, y, 6); imshow(myGeneration5); title('5 generation');

myGeneration6 = applylut(myGeneration5, myLut);
subplot(x, y, 7); imshow(myGeneration6); title('6 generation');

myGeneration7 = applylut(myGeneration6, myLut);
subplot(x, y, 8); imshow(myGeneration7); title('7 generation');

myGeneration8 = applylut(myGeneration7, myLut);
subplot(x, y, 9); imshow(myGeneration8); title('8 generation');