%% clear
close all;
clearvars;
clc;

%% processing
I_cc = imread('ccl1.png');
tmp_I = I_cc;
I_ocze = imread('ccl1Result.png');

%I_cc = double(I_cc);

figure(1);
imshow(I_cc); title('original');

[YY, XX] = size(I_cc);
L = 1;
for y = 2 : YY
    for x = 2 : XX - 1
        if I_cc(y, x) ~= 0
            sasiedzi = [I_cc(y - 1, x - 1) I_cc(y - 1, x) I_cc(y - 1, x + 1) I_cc(y, x - 1)];
            suma = sum(sasiedzi);
            if (suma == 0)
                I_cc(y, x) = L;
                L = L + 1;
            else
                minSasiedzi = min(nonzeros(sasiedzi));
                maxSasiedzi = max(nonzeros(sasiedzi));
                if (minSasiedzi == maxSasiedzi)
                    I_cc(y, x) = minSasiedzi;
                else
                    I_cc(y, x) = minSasiedzi;
                end
            end
        end
    end
end
I_result = label2rgb(I_cc);
figure(2);
subplot(1, 2, 1); imshow(I_result); title('Result');
subplot(1, 2, 2); imshow(I_ocze); title('Oczekiwane');

%% new process
id = (1:100);

I_cc = tmp_I;
[YY, XX] = size(I_cc);
L = 1;
for y = 2 : YY
    for x = 2 : XX - 1
        if I_cc(y, x) ~= 0
            sasiedzi = [I_cc(y - 1, x - 1) I_cc(y - 1, x) I_cc(y - 1, x + 1) I_cc(y, x - 1)];
            suma = sum(sasiedzi);
            if (suma == 0)
                I_cc(y, x) = L;
                L = L + 1;
            else
                minSasiedzi = min(nonzeros(sasiedzi));
                maxSasiedzi = max(nonzeros(sasiedzi));
                if (minSasiedzi == maxSasiedzi)
                    I_cc(y, x) = minSasiedzi;
                else
                    I_cc(y, x) = minSasiedzi;
                    id = union(id, minSasiedzi, maxSasiedzi);
                end
            end
        end
    end
end
lut = 1 : 100;
for i = 1: 100
    lut(i) = root(id, i);
end

I_result1 = I_cc;
for y = 1 : YY
    for x = 1: XX
        if (I_cc(y, x) > 0)
            I_result1(y, x) = lut(I_cc(y, x));
        end
    end
end

I_result1 = label2rgb(I_result1);
figure(3);
subplot(1, 2, 1); imshow(I_result1); title('Result');
subplot(1, 2, 2); imshow(I_ocze); title('Oczekiwane');