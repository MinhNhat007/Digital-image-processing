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
    end
end

figure(2);
imshow(newI);

%resize by method interpolacja dwuliniowa
%resize by method najblizszego sasiada
reScale = 3;
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
        exactY = newY*yStep;
        exactX = newX*xStep;
        i1 = floor(newY*yStep);
        j1 = floor(newX*xStep);
        if(i1 + 1 >= YY)
            i2 = i1;
        else
            i2 = i1 + 1;
        end
        if j1 + 1 >= XX
            j2 = j1;
        else
            j2 = j1 + 1;
        end
        fA = I(i1+1, j1+1);
        fB = I(i2+1, j1+1);
        fC = I(i2+1, j2+1);
        fD = I(i1+1, j2+1);
        newI(newY+1, newX+1) = fA*(i2-exactY)*(j2-exactX)+fB*(exactY-i1)*(j2-exactX)+fC*(exactY-i1)*(originalX-j1)+fD*(i2-exactY)*(exactX-j1);
    end
end

figure(3);
imshow(newI);