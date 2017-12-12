clearvars;
close all;
clc;

%% wczytanie
I = imread('100zloty.jpg');
Igray = rgb2gray(I);
figure(1);
subplot(3,3,1);
imshow(Igray); title('Original');

%% bit-plane slicing
b1 = boolean(bitget(Igray,1));
b2 = boolean(bitget(Igray,2));
b3 = boolean(bitget(Igray,3));
b4 = boolean(bitget(Igray,4));
b5 = boolean(bitget(Igray,5));
b6 = boolean(bitget(Igray,6));
b7 = boolean(bitget(Igray,7));
b8 = boolean(bitget(Igray,8));

%% wyswietlanie
subplot(3,3,2);
imshow(b1); title('Bit plan 1');
subplot(3,3,3);
imshow(b2); title('Bit plan 2');
subplot(3,3,4);
imshow(b3); title('Bit plan 3');
subplot(3,3,5);
imshow(b4); title('Bit plan 4');
subplot(3,3,6);
imshow(b5); title('Bit plan 5');
subplot(3,3,7);
imshow(b6); title('Bit plan 6');
subplot(3,3,8);
imshow(b7); title('Bit plan 7');
subplot(3,3,9);
imshow(b8); title('Bit plan 8');

%%rekonstrukcja obrazu
I87 = uint8(b8*2^7 + b7*2^6); %b8+b7
I876 = I87 + uint8(b6*2^5);   %b8+b7+b6
I8765 = I876 + uint8(b5*2^4); %b8+b7+b6+b5

figure(2);
subplot(2,2,1);
imshow(Igray); title('Original');
subplot(2,2,2);
imshow(I87); title('B8+B7');
subplot(2,2,3);
imshow(I876); title('B8+B7+B6');
subplot(2,2,4);
imshow(I8765); title('B8+B7+B6+B5');