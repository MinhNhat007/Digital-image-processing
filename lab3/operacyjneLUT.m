%% initation
clearvars;
close all;
clc;

%% read file
load funkcjeLUT;
I = imread('jet.bmp');

%% processing
figure(1);
LUT(I,kwadratowa);
title('kwadratowa');
figure(2);
LUT(I,log);
title('log');
figure(3);
LUT(I, odwlog);
title('odwlog');
figure(4);
LUT(I, odwrotna);
title('odwrotna');
figure(5);
LUT(I, pierwiastkowa);
title('pierwiastkowa');
figure(6);
LUT(I, pila);
title('pila');
figure(7);
LUT(I, wykladnicza);
title('wykladnicza');


%% show result