%% initialization
close all;
clearvars;
clc;

%% reading
load MR_data

%% processing 
local_window = [5 5];
I_noisefree1 = convolution(I_noisefree, local_window);
I_noisy11 = convolution(I_noisy1, local_window);
I_noisy21 = convolution(I_noisy2, local_window);
I_noisy31 = convolution(I_noisy3, local_window);
I_noisy41 = convolution(I_noisy4, local_window);


I_noisefree2 = bilateral(I_noisefree, local_window, 5.0);
I_noisy12 =  bilateral(I_noisy1, local_window, 5.0);
I_noisy22 =  bilateral(I_noisy2, local_window, 5.0);
I_noisy32 =  bilateral(I_noisy3, local_window, 5.0);
I_noisy42 =  bilateral(I_noisy4, local_window, 5.0);


%% showing
figure;
x = 1; y = 3;
subplot(x, y, 1); imshow(I_noisefree, []); title('original free');
subplot(x, y ,2); imshow(I_noisefree1, []); title('colfilt');
subplot(x, y, 3); imshow(I_noisefree2, []); title('bilateral');

figure;
x = 1; y = 3;
subplot(x, y, 1); imshow(I_noisy1, []); title('original 1');
subplot(x, y ,2); imshow(I_noisy11, []); title('colfilt');
subplot(x, y, 3); imshow(I_noisy12, []); title('bilateral');

figure;
x = 1; y = 3;
subplot(x, y, 1); imshow(I_noisy2,[]); title('original 2');
subplot(x, y ,2); imshow(I_noisy21,[]); title('colfilt');
subplot(x, y, 3); imshow(I_noisy22, []); title('bilateral');

figure;
x = 1; y = 3;
subplot(x, y, 1); imshow(I_noisy3,[]); title('original 3');
subplot(x, y ,2); imshow(I_noisy31,[]); title('colfilt');
subplot(x, y, 3); imshow(I_noisy32, []); title('bilateral');

figure;
x = 1; y = 3;
subplot(x, y, 1); imshow(I_noisy4,[]); title('original 4');
subplot(x, y ,2); imshow(I_noisy41,[]); title('colfilt');
subplot(x, y, 3); imshow(I_noisy42, []); title('bilateral');