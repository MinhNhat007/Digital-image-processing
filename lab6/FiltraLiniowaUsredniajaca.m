%% initialization
close all;
clearvars;
clc;

%% reading
I_O = imread('plansza.bmp');
I_Lena = imread('lena.bmp');

%% processing
Maska = fspecial ('average', 3);
Maska3 = Maska;
Maska5 = fspecial ('average', 5);
Maska9 = fspecial ('average', 9);
Maska15 = fspecial ('average', 15);
Maska35 = fspecial ('average', 35);
M = [1 2 1; 2 4 2; 1 2 1];
M = M/sum(sum(M));

MaskaGaussian1 = fspecial('gaussian',5,0.3);
MaskaGaussian2 = fspecial('gaussian',5,0.5);
MaskaGaussian3 = fspecial('gaussian',5,0.7);

I_lenaGaussian1 = uint8(conv2(double(I_Lena), MaskaGaussian1, 'same'));
I_lenaGaussian2 = uint8(conv2(double(I_Lena), MaskaGaussian2, 'same'));
I_lenaGaussian3 = uint8(conv2(double(I_Lena), MaskaGaussian3, 'same'));


I_lenaConvM = uint8(conv2(double(I_Lena), M, 'same'));
I_LenaConv3 = uint8(conv2(double(I_Lena), double(Maska3), 'same'));
I_LenaConv5 = uint8(conv2(double(I_Lena), double(Maska5), 'same'));
I_LenaConv9 = uint8(conv2(double(I_Lena), double(Maska9), 'same'));
I_LenaConv15 = uint8(conv2(double(I_Lena), double(Maska15), 'same'));
I_LenaConv35 = uint8(conv2(double(I_Lena), double(Maska35), 'same'));

I_Conv = uint8(conv2(double(I_O), double(Maska), 'same'));
I_Diff = imabsdiff(I_O, I_Conv);

%% showing;
figure;
x = 1; y = 3;
subplot(x,y,1); imshow(I_O); title('Original');
subplot(x,y,2); imshow(I_Conv); title('Filtra liniowa Usredniajaca');
subplot(x,y,3); imshow(I_Diff, []); title('Difference');

%showLena
figure
x = 2; y = 3;
subplot(x,y,1); imshow(I_Lena); title('Original');
subplot(x,y,2); imshow(I_LenaConv3); title('Maska 3');
subplot(x,y,3); imshow(I_LenaConv5); title('Maska 5');
subplot(x,y,4); imshow(I_LenaConv9); title('Maska 9');
subplot(x,y,5); imshow(I_LenaConv15); title('Maska 15');
subplot(x,y,6); imshow(I_LenaConv35); title('Maska 35');

figure;
x = 1; y = 2;
subplot(x,y,1); imshow(I_Lena); title('Original');
subplot(x,y,2); imshow(I_lenaConvM); title('Maska M');

figure;
x = 3; y = 2;
subplot(x,y,1); mesh(MaskaGaussian1);
subplot(x,y,2); imshow(I_lenaGaussian1); title('Maska gaussian 0.3');
subplot(x,y,3); mesh(MaskaGaussian2);
subplot(x,y,4); imshow(I_lenaGaussian2); title('Maska gaussian 0.5');
subplot(x,y,5); mesh(MaskaGaussian3);
subplot(x,y,6); imshow(I_lenaGaussian3); title('Maska gaussian 0.7');
