%% initialization
close all;
clearvars;
clc;
 
%% task 1
I_dom = imread('dom.png');
I_edgeCanny = edge(I_dom,'canny');
I_edgeCanny1 = edge(I_dom,'canny', 0.25);

I_edgeLog = edge(I_dom,'log');
I_edgeLog1 = edge(I_dom,'log', 0.006, 2.2);

I_edgeSobel = edge(I_dom, 'sobel');
I_edgeSobel1 = edge(I_dom, 'sobel', 0.145);

figure; x = 1; y = 3;
subplot(x, y, 1); imshow(I_dom); title('origina');
subplot(x, y, 2); imshow(I_edgeCanny); title('edge canny');
subplot(x, y, 3); imshow(I_edgeCanny1); title('edge canny 0.25');
figure; x = 1; y = 3;
subplot(x, y, 1); imshow(I_dom); title('origina');
subplot(x, y, 2); imshow(I_edgeLog); title('edge log');
subplot(x, y, 3); imshow(I_edgeLog1); title('edge log');
figure; x = 1; y = 3;
subplot(x, y, 1); imshow(I_dom); title('origina');
subplot(x, y, 2); imshow(I_edgeSobel); title('edge sobel');
subplot(x, y, 3); imshow(I_edgeSobel1); title('edge sobel 1.45');
