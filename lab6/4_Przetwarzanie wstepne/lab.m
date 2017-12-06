close all;
clearvars;
clc;

%% A

plansza = imread('plansza.tif');
% plansza = imread('lena.bmp');

figure;
h = fspecial('average', [3 3]);
plansza2 = uint8(conv2(double(plansza), double(h), 'same'));
subplot(2, 2, 1); imshow(plansza);
subplot(2, 2, 2); imshow(plansza2);
subplot(2, 2, 3); imshow(imabsdiff(plansza, plansza2), []);

figure;
subplot(2, 3, 1); imshow(plansza);
subplot(2, 3, 2); imshow(uint8(conv2(double(plansza), double(fspecial('average', [3 3])), 'same')));
subplot(2, 3, 3); imshow(uint8(conv2(double(plansza), double(fspecial('average', [5 5])), 'same')));
subplot(2, 3, 4); imshow(uint8(conv2(double(plansza), double(fspecial('average', [9 9])), 'same')));
subplot(2, 3, 5); imshow(uint8(conv2(double(plansza), double(fspecial('average', [15 15])), 'same')));
subplot(2, 3, 6); imshow(uint8(conv2(double(plansza), double(fspecial('average', [35 35])), 'same')));

figure;
M = [
    1 2 1;
    2 4 2;
    1 2 1
    ];
M = M / sum(sum(M));
plansza2 = uint8(conv2(double(plansza), double(M), 'same'));
subplot(2, 2, 1); imshow(plansza);
subplot(2, 2, 2); imshow(plansza2);
subplot(2, 2, 3); imshow(imabsdiff(plansza, plansza2), []);

figure;
h1 = fspecial('gaussian', [5, 5], 0.5);
h2 = fspecial('gaussian', [5, 5], 0.8);
h3 = fspecial('gaussian', [5, 5], 0.1);
% subplot(2, 2, 1); mesh(h);
subplot(2, 2, 2); imshow(conv2(double(plansza), double(h1), 'same'));
subplot(2, 2, 3); imshow(conv2(double(plansza), double(h2), 'same'));
subplot(2, 2, 4); imshow(conv2(double(plansza), double(h3), 'same'));

%% B

figure;
lenaszum = imread('lenaszum.bmp');
lenamed = medfilt2(lenaszum, [3, 3]);
subplot(2, 2, 1); imshow(lenaszum);
subplot(2, 2, 2); imshow(lenamed);
subplot(2, 2, 3); imshow(imabsdiff(lenaszum, lenamed), []);

figure;
h = fspecial('average', [3 3]);
lenaavg = uint8(conv2(double(lenaszum), double(h), 'same'));
subplot(2, 2, 1); imshow(lenaszum);
subplot(2, 2, 2); imshow(lenaavg);
subplot(2, 2, 3); imshow(imabsdiff(lenaszum, lenaavg), []);

figure;
lenapost = lenaszum;
for i = 1:10,
    lenapost = medfilt2(lenapost, [5, 5]);
end
imshow(lenapost);

%% C

% laplasjan

moon = imread('moon.tif');
M = [
    0 1 0;
    1 -4 1;
    0 1 0
    ];
M = M / 9;

figure;
imshow(moon);

figure;
moon_scal = conv2(double(moon), M, 'same') + 128;
imshow(moon_scal, []);

figure;
moon_abs = abs(conv2(double(moon), M, 'same'));
imshow(moon_abs, []);

figure;
h = fspecial('laplacian');
moon_lap = uint8(conv2(double(moon), double(h), 'same'));
imshow(moon_lap, []);

figure; %
imshow(moon + moon_lap, []);

% gradienty

kw = imread('kw.bmp');
load('maskiPP.mat');

figure;
subplot(2, 1, 1); imshow(conv2(double(kw), R1, 'same') + 128);
subplot(2, 1, 2); abs(imshow(conv2(double(kw), R1, 'same')));

figure;
subplot(2, 1, 1); imshow(conv2(double(kw), R2, 'same') + 128);
subplot(2, 1, 2); abs(imshow(conv2(double(kw), R2, 'same')));

figure;
subplot(2, 1, 1); imshow(conv2(double(kw), P1, 'same') + 128);
subplot(2, 1, 2); abs(imshow(conv2(double(kw), P1, 'same')));

figure;
subplot(2, 1, 1); imshow(conv2(double(kw), P2, 'same') + 128);
subplot(2, 1, 2); abs(imshow(conv2(double(kw), P2, 'same')));

figure;
subplot(2, 1, 1); imshow(conv2(double(kw), S1, 'same') + 128);
subplot(2, 1, 2); abs(imshow(conv2(double(kw), S1, 'same')));

figure;
subplot(2, 1, 1); imshow(conv2(double(kw), S2, 'same') + 128);
subplot(2, 1, 2); abs(imshow(conv2(double(kw), S2, 'same')));

figure;
OS1 = conv2(double(kw), S1, 'same');
OS2 = conv2(double(kw), S2, 'same');
OW = sqrt((OS1 .^ 2) + (OS2 .^ 2));
subplot(2, 1, 1); imshow(kw);
subplot(2, 1, 2); imshow(OW, []);

figure;
OS1 = conv2(double(kw), S1, 'same');
OS2 = conv2(double(kw), S2, 'same');
OW = sqrt(abs(OS1) + abs(OS2));
subplot(2, 1, 1); imshow(kw);
subplot(2, 1, 2); imshow(OW, []);

kw = imread('jet.bmp');

figure;
OS1 = conv2(double(kw), S1, 'same');
OS2 = conv2(double(kw), S2, 'same');
OW = sqrt((OS1 .^ 2) + (OS2 .^ 2));
subplot(2, 1, 1); imshow(kw);
subplot(2, 1, 2); imshow(OW, []);

figure;
OS1 = conv2(double(kw), S1, 'same');
OS2 = conv2(double(kw), S2, 'same');
OW = sqrt(abs(OS1) + abs(OS2));
subplot(2, 1, 1); imshow(kw);
subplot(2, 1, 2); imshow(OW, [])
