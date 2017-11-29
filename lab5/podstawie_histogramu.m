%% initation
clc;
close all;
clearvars;

count = 0;

%% reading
I_O = imread('coins.png');
I_O1 = imread('figura.png');



%% processing 
prog = 80;
I_BW = im2bw(I_O, prog/255);

progOtsu = graythresh(I_O);
I_BWOtsu = im2bw(I_O, progOtsu);

progKittler = clusterKittler(I_O);
I_BWKittler = im2bw(I_O, progKittler/255);

progYen = entropyYen(I_O);
I_BWYen = im2bw(I_O, progYen/255);

I_BW1 = im2bw(I_O1, prog/255);


%% showing
count = count + 1;
figure(count);
x = 3; y = 2;
subplot(x,y,1);
imshow(I_O);
title('Original');
subplot(x,y,2);
imhist(I_O, 256);
subplot(x,y,3);
imshow(I_BW);
title('bw with prog = 80');
subplot(x,y,4);
imshow(I_BWOtsu);
title(strcat('bw by Otsu with prog = ', num2str(progOtsu*255)));
subplot(x,y,5);
imshow(I_BWKittler);
title(strcat('bw by Kittler with prog = ', num2str(progKittler)));
subplot(x,y,6);
imshow(I_BWYen);
title(strcat('bw by Kittler with prog = ', num2str(progYen)));