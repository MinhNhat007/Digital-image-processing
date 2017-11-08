%% initation
clearvars;
close all;
clc;

%% read files
I_kolo = imread('kolo.bmp');
I_kwadrat = imread('kwadrat.bmp');

%% processing
kolo = boolean(I_kolo);
kwadrat = boolean(I_kwadrat);
I_and = kwadrat & kolo;
I_or  = kwadrat | kolo;
I_xor = xor(kwadrat, kolo);
I_not = not(kolo);


x = 2;
y = 3;
subplot(x,y,1);
imshow(I_kolo);
title('Original kolo');

subplot(x,y,2);
imshow(I_kwadrat);
title('Original kwadrat');

subplot(x,y,3);
imshow(I_not);
title('not');

subplot(x,y,4);
imshow(I_and);
title('and');

subplot(x,y,5);
imshow(I_xor);
title('xor');

subplot(x,y,6);
imshow(I_or);
title('or');