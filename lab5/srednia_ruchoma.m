%% initialization
clc;
close all;
clearvars;

numberImage = 0;

%% reading
I_O = imread('tekstReczny.png');
tmp_I = I_O;
I_O = double(I_O);
I_OD = I_O;

%% processing
progReczna = 80 / 255;
I_Reczna = im2bw(I_O, progReczna);
progOtsu = graythresh(I_O);
I_Otsu = im2bw(I_O, progOtsu);

%metoda srednia ruchroma
n = 20;
a = 0.5;
[X Y] = size(I_O);
first = 1;
last = 0;
srednia = 0;
for i = 1:X
    for j = 1:Y
        last = last + 1;
        queue(last) = I_O(i, j);
        srednia = srednia + queue(last) / n;
         if ( (i-1)*X + j > n)
            srednia = srednia - queue(first) / n;
            first = first + 1;
         end
         if (I_O(i,j) > a * srednia)
             I_OD(i, j) = 255;
         else I_OD(i, j) = 0;
         end
    end
end

%metoda sednia ruchoma
% n = 20;
% a = 0.5;
% [X Y] = size(I_OD);
% count = 0;
% sum = 0;
% for i = 1:X
%     for j = 1:Y
%         count = count + 1;
%         sum = sum + I_OD(i, j);
%         if (count <= n)
%             m(count) = sum/n;
%         else
%             critical = count - n;
%             ii = uint8((critical - 1)/Y + 1);
%             jj = uint8(mod ((critical - 1), Y) + 1); 
%             sum = sum - I_OD(ii, jj);
%             m(count) = m(count - 1) + sum/n;
%         end
%     end
% end
% 
% for t = 1:count
%     i = uint8((count - 1)/Y + 1);
%     j = mod((count - 1), Y) + 1;
%     T = m(t) * a;
%     if ( I_OD(i, j) > T )
%         I_OD(i, j) = 255;
%     else I_OD(i, j) = 0;
%     end
% end

%% showing
I_O = tmp_I;
numberImage = numberImage + 1;
figure;
x = 2; y = 2;
subplot(x, y, 1); imshow(I_O); title('Original');
subplot(x, y, 2); imhist(I_O);
subplot(x, y, 3); imshow(I_Reczna); title(strcat('BW by reczna with prog = ', num2str(progReczna*255)));
subplot(x, y, 4); imshow(I_Otsu); title(strcat('BW by Otsu with prog = ', num2str(progOtsu*255)));
figure;
x = 1; y = 2;
subplot(x, y, 1); imshow(I_O); title('Original');
subplot(x, y, 2); imshow(I_OD); title('Metoda srednia_ruchona');
%imshow(I_OD);