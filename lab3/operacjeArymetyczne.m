%% initation
clearvars;
close all;
clc;

%% read file
load funkcjeLUT;
I_jet = imread('jet.bmp');
I_lena = imread('lena.bmp');

%% processing add
I_add = imadd(I_jet, I_lena, 'uint16');

figure(1);
x = 1;
y = 3;
subplot(x,y,1);
imshow(I_jet);
title('jet');
subplot(x,y,2);
imshow(I_lena);
title('lena');
subplot(x,y,3);
imshow(I_add, []);
title('dodawanie');

%% kombinacja liniowa
I_kombinacja37 = imlincomb(3, I_jet, 7, I_lena, 'uint16');
I_kombinacja73 = imlincomb(7, I_jet, 3, I_lena, 'uint16');

figure(2);
x = 2;
y = 2;
subplot(x,y,1);
imshow(I_jet);
title('jet');
subplot(x,y,2);
imshow(I_lena);
title('lena');
subplot(x,y,3);
imshow(I_kombinacja37,[]);
title('30 jet + 70 lena');
subplot(x,y,4);
imshow(I_kombinacja73,[]);
title('70 jet + 30 lena');

%% odejmowanie
I_sub = imsubtract(int16(I_lena), int16(I_jet));
I_compare = imabsdiff(I_jet, I_lena);

figure(3);
x = 2;
y = 2;
subplot(x,y,1);
imshow(I_jet);
title('jet');
subplot(x,y,2);
imshow(I_lena);
title('lena');
subplot(x,y,3);
subplot(x,y,3);
imshow(I_sub,[]);
title('odejmowanie');
subplot(x,y,4);
imshow(I_compare,[]);
title('imabsdiff');

%% mnozenie
coeficient = 2;
I_mul = immultiply(uint16(I_jet), uint16(I_lena));
I_mul2 = immultiply(I_lena, coeficient);
maska = imread('kolo.bmp');
maska = boolean(maska);
I_maska = immultiply(I_lena, maska);

figure(4);
x = 2;
y = 3;
subplot(x,y,1);
imshow(I_jet);
title('jet');
subplot(x,y,2);
imshow(I_lena);
title('lena');
subplot(x,y,3);
imshow(I_mul);
title('mnozenie');
subplot(x,y,4);
imshow(I_mul2);
title('lena razy 2');
subplot(x,y,5);
imshow(I_maska);
title('image after masking');