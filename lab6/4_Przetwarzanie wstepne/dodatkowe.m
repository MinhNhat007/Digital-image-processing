close all;
clearvars;
clc;

im = imread('plytkaSzumImp.tif');
figure; imshow(im);

szer = size(im, 2);
wys = size(im, 1);
Smax = 3;

im2 = uint8(zeros(wys, szer));

for x = (1+Smax):(szer-Smax),
    for y = (1+Smax):(wys-Smax),
        im2(y, x) = adapt(im, x, y, Smax);
    end
end

figure; imshow(medfilt2(im, [7, 7]));
figure; imshow(im2);
