clearvars;
close all;
clc;

%% wczytanie
I = imread('clock.bmp');
figure(1);
imshow(I);

%% interpolacja metoda najbliższego sąsiada
xReScale = 1.5;
yReScale = 1.5;

[YY, XX] = size(I);
nYY = round(YY*yReScale);
nXX = round(XX*xReScale);
nI = uint8(zeros(nYY,nXX));

yStep = YY/nYY;
xStep = XX/nXX;

for ix = 0 : (nXX-1)
    ox = floor(ix*xStep);
    
    for iy = 0 : (nYY-1)
        oy = floor(iy*yStep);
        if(oy +2 > YY) 
            oy=oy-1;
        end
        
        if(ox +2 > XX) 
            ox=ox-1;
        end
        
        A = I(oy+1,ox+1);
        B = I(oy+1,ox+2);
        C = I(oy+2,ox+1);
        D = I(oy+2,ox+2);
        
        nI(iy+1, ix+1) = A*(1-floor(ox/XX))*(1-floor(oy/YY))+B*floor(ox/XX)*(1-floor(oy/YY))+C*floor(oy/YY)*floor(ox/XX)+D*(1-floor(ox/XX))*floor(oy/YY);
        
        
    end  
end

figure(5);
imshow(nI);