%% clear
close all;
clearvars;
clc;

%% initalization
I_knee = imread('knee.png');
I_knee = double(I_knee);

%[x,y] = ginput(I_knee)

h = fspecial('gaussian');
I_knee = imfilter(I_knee, h);
Icopy = I_knee;

figure;
imshow(I_knee, []); title('original');

[y, x] = ginput(1);
x = round(x); y = round(y);


[XX, YY] = size(I_knee);

prog = 30;
visited = zeros(XX, YY);
segmented = zeros(XX, YY);
nStack = 1000;
topStack = 0;
nS = 0;
iStack = zeros(nStack, 2);

topStack = topStack + 1;
iStack(topStack, 1) = x; iStack(topStack, 2) = y;
visited(x, y) = 1;

mV =0;
segmented(x, y) = I_knee(x, y);



while (topStack > 0)
    %Icopy(segmented>0) = 255;
    %imshow(Icopy, []);
    %drawnow
    curX = iStack(topStack, 1); curY = iStack(topStack, 2);
    topStack = topStack - 1; 
    nS = nS + 1;
    mV = (mV * (nS - 1) + I_knee(curX, curY))/nS;
    
    if (curX <= 1 || curX >= XX || curY <= 1 || curY >= YY)
        continue;
    end
    
    for i = curX - 1 : curX + 1
        for j = curY - 1 : curY + 1
            Q = abs( mV - I_knee(i, j) );
            %Q = abs( I_knee(curX, curY) - I_knee(i, j));
            if (Q < prog && visited(i, j) == 0)
                topStack = topStack + 1; 
                iStack(topStack, 1) = i; iStack(topStack, 2) = j; 
                segmented(i, j) = I_knee(i, j);
            end
            visited(i, j) = 1;
        end
    end
end
figure;
imshow(segmented, []);
