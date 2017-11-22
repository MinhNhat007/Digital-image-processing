%% initation
clearvars;
close all;
clc;

%% reading
I_O = imread('jet.bmp');
[counts,binLocations] = imhist(I_O);

%% processing
lm = round(mean(mean(I_O)));
H1=counts(1:lm);
H2=counts(lm+1:256);
H1=H1/sum(H1);
H2=H2/sum(H2);
C1=cumsum(H1);
C2=cumsum(H2);

C1n = (lm)*C1;
C2n = lm+1 + (255-lm+1)*C2;
lut = [C1n; C2n];
I_1 = intlut(I_O, uint8(lut));

% [X, Y] = size(I_O);
% [value, lm1] = min( abs(C-(X*Y/2)));
% lm1=round(mean(lm1));
% H3=counts(counts<=lm1);
% H4=counts(counts>lm1);
% H3=H3/sum(H3);
% H4=H4/sum(H4);
% C3=cumsum(H3);
% C4=cumsum(H4);
% 
% C3n = (lm1)*C3;
% C4n = lm1+1 + (255-lm1+1)*C4;
% lut1 = [C3n; C4n];
% I_2 = intlut(I_O, uint8(lut1));

%% showing
figure(1);
subplot(3,2,1);
imshow(I_O);
title('original');
subplot(3,2,2);
imhist(I_O);

subplot(3,2,3);
imshow(I_1);
title('bbhe');
subplot(3,2,4);
imhist(I_1);

subplot(3,2,5);
imshow(histeq(I_O));
title('he');
subplot(3,2,6);
imhist(histeq(I_O));

% subplot(4,2,7);
% imshow(I_2);
% title('dsihe');
% subplot(4,2,8);
% imhist(I_O);
