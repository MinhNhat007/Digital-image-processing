%% initialization
close all;
clearvars;
clc;

%% reading

I_O = imread('kw.bmp');
load maskiPP;

%% processing

I_P1 = conv2(double(I_O), P1, 'same');
I_P11 =  I_P1 + 128;
I_P12 = abs(I_P1);

I_P2 = conv2(double(I_O), P2, 'same');
I_P21 =  I_P1 + 128;
I_P22 = abs(I_P2);

I_R1 = conv2(double(I_O), R1, 'same');
I_R11 =  I_R1 + 128;
I_R12 = abs(I_R1);

I_R2 = conv2(double(I_O), R2, 'same');
I_R21 =  I_R2 + 128;
I_R22 = abs(I_R2);

I_S1 = conv2(double(I_O), S1, 'same');
I_S11 =  I_R1 + 128;
I_S12 = abs(I_S1);

I_S2 = conv2(double(I_O), S2, 'same');
I_S21 =  I_S2 + 128;
I_S22 = abs(I_S2);

OS1 = conv2(double(I_O), S1, 'same');
OS2 = conv2(double(I_O), S2, 'same');
OW1 = sqrt((OS1 .^ 2) + (OS2 .^ 2));

OW2 = abs(OS1) + abs(OS2);


%% showing
figure;
x = 1; y = 3;
subplot(x,y,1); imshow(I_O); title('original');
subplot(x,y,2); imshow(I_P11, []); title('P1 + 128');
subplot(x,y,3); imshow(I_P12, []); title('P1 abs');

figure;
x = 1; y = 3;
subplot(x,y,1); imshow(I_O); title('original');
subplot(x,y,2); imshow(I_P21, []); title('P2 + 128');
subplot(x,y,3); imshow(I_P22, []); title('P2 abs');

figure;
x = 1; y = 3;
subplot(x,y,1); imshow(I_O); title('original');
subplot(x,y,2); imshow(I_R11, []); title('R1 + 128');
subplot(x,y,3); imshow(I_R12, []); title('R1 abs');

figure;
x = 1; y = 3;
subplot(x,y,1); imshow(I_O); title('original');
subplot(x,y,2); imshow(I_R21, []); title('R2 + 128');
subplot(x,y,3); imshow(I_R22, []); title('R2 abs');

figure;
x = 1; y = 3;
subplot(x,y,1); imshow(I_O); title('original');
subplot(x,y,2); imshow(I_S11, []); title('S1 + 128');
subplot(x,y,3); imshow(I_S12, []); title('S1 abs');

figure;
x = 1; y = 3;
subplot(x,y,1); imshow(I_O); title('original');
subplot(x,y,2); imshow(I_S21, []); title('S2 + 128');
subplot(x,y,3); imshow(I_S22, []); title('S2 abs');

figure;
x = 1; y = 3;
subplot(x,y,1); imshow(I_O); title('original');
subplot(x,y,2); imshow(OW1, []); title('sqrt(sqr + sqr)');
subplot(x,y,3); imshow(OW2, []); title('abs + abs');