%% clear
close all;
clearvars;
clc;

%% implementation
I = imread('ccl2.png');
L = bwlabel(I, 4);
L1 = bwlabel(I, 8);
figure(1);
subplot(1, 3, 1); imshow(I,[]); title('original');
subplot(1, 3, 2); imshow(label2rgb(L)); title('4');
subplot(1, 3, 3); imshow(label2rgb(L1)); title('8');