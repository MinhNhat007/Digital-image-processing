clearvars;
close all;
clc;

%Read and show
I = imread('clock.bmp');
figure(1);
imshow(I);

%resize by method najblizszego sasiada
reScale = 2;
xReScale = reScale;
yReScale = reScale;
[YY, XX] = size(I);
nYY = round(YY * yReScale);
nXX = round(XX * xReScale);
newI = uint8(zeros(nYY, nXX));

xStep = XX/nXX;
yStep = YY/nYY;
originalY = 0;
originalX = 0;
for newY = 0:(nYY-1)
    for newX = 0:(nXX-1)
        %corresponding to scales in original image
        originalY = round(newY*yStep);
        originalX = round(newX*xStep);
        %condition limited for round case
        if (originalY >= YY) 
            originalY = originalY - 1;
        end
        if (originalX >= XX)
            originalX = originalX - 1;
        end
        %finally create new Image
        newI(newY+1, newX+1) = I(originalY+1, originalX+1);
        %A
        %B
        %C
        %D
    end
end

figure(2);
imshow(newI);

%resize by method interpolacja dwuliniowa


