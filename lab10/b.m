%% clear
close all;
clearvars;
clc;

global prog;
global limitPodzialu;
global index;
global segRes;
global MRes;

%% reading

I_um = imread('umbrealla.png');

figure(1); 
subplot(1, 3, 1); imshow(I_um); title('original');

I_um = double(I_um);
I_HSV = rgb2hsv(I_um);
I_H = double(I_HSV(:, :, 1));

subplot(1, 3, 2); imshow(I_HSV, []); title('HSV');
subplot(1, 3, 3); imshow(I_H, []); title('H');

prog = 0.05;
limitPodzialu = 8;
index = 1;
[YY, XX] = size(I_H);
segRes = zeros(YY, XX);
MRes = zeros(YY, XX);

split(I_H, 1, 1, YY, XX);

figure(2);
subplot(1, 2, 1); imshow(MRes, []); title('MRes after split function');
subplot(1, 2, 2); imshow(segRes, []); title('segRes after split function');

%algoryths
i= 0;
while (i < index)
    IB = segRes == i;
    
    [YYY, XXX] = size(IB);
    if (YYY <= 0 && XXX <= 0)
        i = i + 1;
        continue;
    end 
        
    [yF, xF] = find(IB, 1, 'first');
    
    mySE = strel('square', 3);
    IB_dilate = imdilate(IB, mySE);
    IB_diff = imabsdiff(IB_dilate,IB);
    I_mul = segRes .* IB_diff;
    IB_unique = unique(nonzeros(I_mul));
    
    flag = 0;
    for j = 1:numel(IB_unique)
        IBS = segRes == IB_unique(j);
        [yF2, xF2] = find(IBS, 1, 'first');
        
        corlorDiff = abs(MRes(yF, xF) - MRes(yF2, xF2));
        if (corlorDiff < 5/255)
            segRes(IBS) = i;
            flag = 1;
        end
        
    end
    
    if (flag == 0)
        i = i + 1;
    end
end

U = unique(segRes);
for i = 1:numel(U)
    obszar = segRes == U(i);
    if sum(obszar) < 30
        segRes(obszar) = 0;
    end
end

U = unique(segRes);
for i = 1:numel(U)
    obszar = segRes == U(i);
    segRes(obszar) = i;
end

Img_final = label2rgb(segRes);

figure(3);

subplot(1, 3, 1); imshow(MRes, []); title('MRes');
subplot(1, 3, 2); imshow(segRes, []); title('segRes');
subplot(1, 3, 3); imshow(Img_final, []); title('Final');