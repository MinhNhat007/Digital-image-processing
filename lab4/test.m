clearvars;
close all;
clc;

lenaRGB = imread('lenaRGB.bmp');

% lena
figure;
imshow(lenaRGB);

% skladowe
figure;
R = lenaRGB(:,:,1);
subplot(1,2,1);
imshow(R);
subplot(1,2,2);
imhist(R);

figure;
G = lenaRGB(:,:,2);
subplot(1,2,1);
imshow(G);
subplot(1,2,2);
imhist(G);

figure;
B = lenaRGB(:,:,3);
subplot(1,2,1);
imshow(B);
subplot(1,2,2);
imhist(B);

% wyrownanie histogramu dla kazdej skladowej
Re = histeq(R, 256);
Ge = histeq(G, 256);
Be = histeq(B, 256);
lenaeq = lenaRGB;
lenaeq(:,:,1) = Re;
lenaeq(:,:,2) = Ge;
lenaeq(:,:,3) = Be;
figure;
imshow(lenaeq);

% hsv
lenaHSV = rgb2hsv(lenaRGB);
H = lenaHSV(:,:,1);
S = lenaHSV(:,:,2);
V = lenaHSV(:,:,3);

figure; subplot(1,2,1); imshow(H); subplot(1,2,2); imhist(H); title('H');
figure; subplot(1,2,1); imshow(S); subplot(1,2,2); imhist(S); title('S');
figure; subplot(1,2,1); imshow(V); subplot(1,2,2); imhist(V); title('V');
Ve = histeq(V, 256);
figure; subplot(1,2,1); imshow(Ve); subplot(1,2,2); imhist(Ve); title('V wyrownane');

figure;
lenaHSV2 = lenaHSV;
lenaHSV2(:,:,3) = Ve;
lenaRGB2 = hsv2rgb(lenaHSV2);
imshow(lenaRGB2);