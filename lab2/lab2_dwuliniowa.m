clearvars;
close all;
clc;

%Read and show
I = imread('chessboard.bmp');
figure(1);
imshow(I);

%resize by method interpolacja dwuliniowa
reScale = 5;
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
        %calculating to exact coordinates
        exactY = newY*yStep;
        exactX = newX*xStep;
        %calculating i1, i2, j1, j3
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
        %initation for values of 4 points around
        fA = double(I(i1+1, j1+1));
        fB = double(I(i2+1, j1+1));
        fC = double(I(i2+1, j2+1));
        fD = double(I(i1+1, j2+1));
        
        i = exactY-i1;
        j = exactX-j1;
        M1 = [1-i i];
        M2 = [fA fD; fB fC];
        M3 = [1-j; j];
        %newI(newY+1, newX+1) = fA*(i2-exactY)*(j2-exactX)+fB*(exactY-i1)*(j2-exactX)+fC*(exactY-i1)*(originalX-j1)+fD*(i2-exactY)*(exactX-j1);
        newI(newY+1, newX+1)=M1*M2*M3;
    end
end

figure(2);
imshow(newI);