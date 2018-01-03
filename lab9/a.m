%% initialization
close all;
clearvars;
clc;

%% task 1
I_dom = imread('dom.png');
I_edge = edge(I_dom,'log');

figure; x = 1; y = 2;
subplot(x, y, 1); imshow(I_dom); title('origina');
subplot(x, y, 2); imshow(I_edge); title('edge log');