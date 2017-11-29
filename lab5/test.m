close all;
clearvars;
clc;



im = imread('tekstReczny.png');
imBW = im;

i1 = imread('1.bmp');
i2 = imread('2.bmp');
i3 = i1 - i2;
figure;
subplot(2,2,1); imshow(im);
subplot(2,2,2); imshow(i1);
subplot(2,2,3); imshow(i2);
subplot(2,2,4); imshow(i3);

figure; imshow(im);
figure; imhist(im);

[width, height] = size(im);
n = 20;
a = 0.5;

queue = zeros(1, n);
i = 1;
srednia = 0;
for x = 1:width,
    for y = 1:height,
        i_last = mod(i, 20) + 1;
        srednia = srednia + (queue(i) - queue(i_last)) / n;
        
        i = mod(i, 20) + 1;
        
        T = a * srednia;
        if im(x,y) > T,
            imBW(x,y) = 255;
        else
            imBW(x,y) = 0;
        end
    end
end

figure;
imshow(imBW);