%% initialization
close all;
clearvars;
clc;

%% scieniane
I_fin = imread('fingerprint.bmp');
I_bwmorph1 = bwmorph(I_fin, 'thin', 1);
I_bwmorph2 = bwmorph(I_fin, 'thin', 2);
I_bwmorph = bwmorph(I_fin, 'thin', Inf);
figure;
x = 2; y = 2;
subplot(x, y, 1); imshow(I_fin); title('original fingerprint');
subplot(x, y, 2); imshow(I_bwmorph1); title('bwmorph 1');
subplot(x, y, 3); imshow(I_bwmorph2); title('bwmorph 2');
subplot(x, y, 4); imshow(I_bwmorph); title('bwmorph Inf');

%% Szkieletyzacja
I_skel = imread('kosc.bmp');
I_bwmorph = bwmorph(I_skel, 'skel', Inf);
figure;
x = 1; y = 2;
subplot(x, y, 1); imshow(I_skel); title('original skel');
subplot(x, y, 2); imshow(I_bwmorph); title('bwmorph');

%% rekonstrukcja morfologiczna
I_text = imread('text.bmp');
SE = ones(51, 1);
marker = imerode(I_text,SE);
I_rekonstrukcja = imreconstruct(marker, I_text);
I_open = imopen(I_text, SE);

I_fill = imfill(I_text, 'holes');
I_clear = imclearborder(I_text);
figure;
x = 2; y = 3;
subplot(x, y, 1); imshow(I_text); title('original text');
subplot(x, y, 2); imshow(I_rekonstrukcja); title('rekonstrukcja');
subplot(x, y, 3); imshow(I_open); title('open');
subplot(x, y, 4); imshow(I_fill); title('image fill');
subplot(x, y, 5); imshow(I_clear); title('image clear border');


