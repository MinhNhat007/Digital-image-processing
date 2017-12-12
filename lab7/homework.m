%% initialization
close all;
clearvars;
clc;

%% reading
load MR_data

%% processing 
%non local means
v = 5;
n = 2;
sigma = 10;
alpha = 1;
local_window = [5 5];

I_O = I_noisy3;

profile on
I_NLM = NLM(I_O,v, n, sigma, alpha);
p_NLM = profile('info')
profile off
profile on
I_Bilateral = bilateral(I_O, local_window, 10.0);
p_Bilateral = profile('info')
%% showing 
x = 1; y = 3;
subplot(x,y,1); imshow(I_O,[]); title('original');
subplot(x,y,2); imshow(I_NLM,[]); title('Non local');
subplot(x,y,3); imshow(I_Bilateral,[]); title('bilateral');