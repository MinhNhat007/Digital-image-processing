%% initialization
close all;
clearvars;
clc;

%% reading
I_Lena = imread('lenaSzum.bmp');
I_Lena1 = imread('lena.bmp');


%% processing
I_LenaMed = medfilt2(I_Lena);
I_LenaDiff = imabsdiff(I_Lena, I_LenaMed);

Maska1 = fspecial ('average', 3);
I_Conv1 = uint8(conv2(double(I_Lena1), double(Maska1), 'same'));
I_LenaDiff1 = imabsdiff(I_Lena1, I_Conv1);

%mediana 5x5
I_LenaMed5 = I_Lena1;
for i = 1:10
    I_LenaMed5 = medfilt2(I_LenaMed5, [5 5]);
end
I_LenaDiff5 = imabsdiff(I_Lena1, I_LenaMed5);


%% showing
figure;
x = 2; y = 3;
subplot(x,y,1); imshow(I_Lena); title('Original');
subplot(x,y,2); imshow(I_LenaMed); title('Filtra mediana');
subplot(x,y,3); imshow(I_LenaDiff, []); title('Difference');
subplot(x,y,4); imshow(I_Lena1); title('Original');
subplot(x,y,5); imshow(I_Conv1); title('Filtra liniowa Usredniajaca');
subplot(x,y,6); imshow(I_LenaDiff1, []); title('Difference');

figure;
x = 1; y = 3;
subplot(x,y,1); imshow(I_Lena1); title('Original');
subplot(x,y,2); imshow(I_LenaMed5); title('Filtra mediana 10 razy');
subplot(x,y,3); imshow(I_LenaDiff5, []); title('Difference');
