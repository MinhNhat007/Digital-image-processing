%% initation
clearvars;
close all;
clc;

%% Read image and load data
I = imread('lena.bmp');
figure(1);
imshow(I);
load a1;

%% resize by method interpofolacja dwuszescienna
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
        %calculating accurated coordinates on original image
        accuratedY = newY*yStep;
        accuratedX = newX*xStep;
        
        %calculating 4 points around
        j1 = floor(accuratedY);
        i1 = floor(accuratedX);
        j2 = min(j1 + 1, YY - 1);
        i2 = min(i1 + 1, XX - 1);
      
        %calculating values and derivatives;
        A  = double(I(j1+1, i1+1));
        B  = double(I(j1+1, i2+1));
        C  = double(I(j2+1, i2+1));
        D  = double(I(j2+1, i1+1));
        
        Ax = calculateDerivatives(I,YY,XX,j1,i1,0);
        Ay = calculateDerivatives(I,YY,XX,j1,i1,1);
        Axy= calculateDerivatives(I,YY,XX,j1,i1,2);
        
        Bx = calculateDerivatives(I,YY,XX,j1,i2,0);
        By = calculateDerivatives(I,YY,XX,j1,i2,1);
        Bxy= calculateDerivatives(I,YY,XX,j1,i2,2);
        
        Cx = calculateDerivatives(I,YY,XX,j2,i2,0);
        Cy = calculateDerivatives(I,YY,XX,j2,i2,1);
        Cxy= calculateDerivatives(I,YY,XX,j2,i2,2);
        
        Dx = calculateDerivatives(I,YY,XX,j2,i1,0);
        Dy = calculateDerivatives(I,YY,XX,j2,i1,1);
        Dxy= calculateDerivatives(I,YY,XX,j2,i1,2);
        
        %calculating vectors X, alpha
        vectorX = [A,B,D,C,Ax,Bx,Dx,Cx,Ay,By,Dy,Cy,Axy,Bxy,Dxy,Cxy]';
        vectorAlpha = A1*vectorX;
        
        %write value to new image
        result = 0;
        for ii = 0:3
            for jj = 0:3
                result = result + vectorAlpha(jj*4+ii+1)*(accuratedY-j1)^ii*(accuratedX-i1)^jj; 
            end
        end
        newI(newY+1,newX+1) = result;
    end
end

figure(2);
imshow(newI);