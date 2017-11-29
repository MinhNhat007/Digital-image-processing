%% initation
clc;
close all;
clearvars;

numberImage = 0;

%% reading
I_O = imread('rice.png');

%% processing
[X Y] = size(I_O);
okno = 15;
W2 = floor(okno/2);
I_BW = I_O;

for i = 1:X
    for j = 1:Y
        meanOkno = meanLT(i,j,W2,I_O,X,Y);
        if I_O(i, j) >= meanOkno
            I_BW(i, j) = 255;
        else
            I_BW(i, j) = 0;
        end
    end
end

%Sauvol
R = 128;
k = 0.15;
I_BW1 = I_O;
for i = 1:X
    for j = 1:Y
        meanOkno = meanLT(i,j,W2,I_O,X,Y);
        odchStd = stddevLT(i,j,W2,I_O, meanOkno, X, Y);
        T = meanOkno * (1-k*(odchStd/R - 1));
        if I_O(i, j) >= T
            I_BW1(i, j) = 255;
        else
            I_BW1(i, j) = 0;
        end
    end
end


%% showing
numberImage = numberImage + 1;
figure(numberImage);
x = 1; y = 3;
subplot(x,y,1); imshow(I_O); title('Original');
subplot(x,y,2); imshow(I_BW); title('Binaryzacja lokalna');
subplot(x,y,3); imshow(I_BW1); title('Sauvol');