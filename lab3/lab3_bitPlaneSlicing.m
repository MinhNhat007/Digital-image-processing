%% initation
clearvars;
close all;
clc;

%% read file
I_0 = imread('100zloty.jpg');
I_0 = rgb2gray(I_0);

%% processing: zadanie 1

figure(1);
subplot(3,3,1);
imshow(I_0);
title('original');

titles = {'first bit', 'second bit', 'third bit', 'fourth bit', 'fifth bit', 'sixth bit', 'seventh bit', 'eighth bit'};
for j=1:8
    I = double(bitget(I_0,j));
    subplot(3,3,j+1)
    imshow(I);
    title(titles(j));
end

%% zadanie 2 
figure(2);
subplot(2,2,1);
imshow(I_0);
title('original');

%compose 8, 7
I = zeros(size(I_0));
I =bitset(I,8,bitget(I_0,8));
I=bitset(I,7,bitget(I_0,7));
I =uint8(I);
subplot(2,2,2);
imshow(I);
title('Recontruction bit 7th and 8th');

%compose 8,6
I = zeros(size(I_0));
I =bitset(I,8,bitget(I_0,8));
I=bitset(I,6,bitget(I_0,6));
I =uint8(I);
subplot(2,2,3);
imshow(I);
title('Recontruction bit 6th and 8th');

%compose 8,7,6
I = zeros(size(I_0));
I = bitset(I,8,bitget(I_0,8));
I = bitset(I,7,bitget(I_0,7));
I = bitset(I,6,bitget(I_0,6));
I = uint8(I);
subplot(2,2,4);
imshow(I);
title('Recontruction bit 6th, 7th and 8th');


