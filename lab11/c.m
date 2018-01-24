%% clear
close all;
clearvars;
clc;

%% implementation
I_shapes = imread('shapes.png');

figure(1);
subplot(1, 2, 1); imshow(I_shapes,[]); title('original');

I_label = bwlabel(I_shapes, 4);

wspolczynniki = obliczWspolczynniki(I_label);

subplot(1, 2, 2); imshow(label2rgb(I_label)); title('label');

r = regionprops(I_label, 'Centroid');
for i = 1:length(r)
    text(r(i).Centroid(1), r(i).Centroid(2), ['\color{magenta}', num2str(i)]);
end

[YY, XX] = size(I_label);

for y = 1:YY
    for x = 1:XX
        pixel = I_label(y, x);
        if (pixel ~= 0 && ~(wspolczynniki(pixel, 2) > 0.33 && wspolczynniki(pixel, 2) < 0.66))
            I_label(y, x) = 0;
        end
    end
end

figure(2);
imshow(I_label);

%% session 2
I_shapesReal = imread('shapesReal.png');

I_shapes_real_imerode = imerode(imcomplement(im2bw(I_shapesReal,0.22)),strel('rectangle',[5 5]));

figure(3);
subplot(1, 2, 1); imshow(I_shapesReal, []); title('shape real');
subplot(1, 2, 2); imshow(I_shapes_real_imerode, []); title('label');

I_shapes = I_shapes_real_imerode;
I_label = bwlabel(I_shapes, 4);

wspolczynniki = obliczWspolczynniki(I_label);

subplot(1, 2, 2); imshow(label2rgb(I_label)); title('label');

r = regionprops(I_label, 'Centroid');
for i = 1:length(r)
    text(r(i).Centroid(1), r(i).Centroid(2), ['\color{magenta}', num2str(i)]);
end

[YY, XX] = size(I_label);

for y = 1:YY
    for x = 1:XX
        pixel = I_label(y, x);
        if (pixel ~= 0 && ~(wspolczynniki(pixel, 2) > 0.56 && wspolczynniki(pixel, 2) < 0.65))
            I_label(y, x) = 0;
        end
    end
end

figure(4);
subplot(1, 2, 1); imshow(I_label); title('cross');
