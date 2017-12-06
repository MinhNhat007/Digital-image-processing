%% initialization
close all;
clearvars;
clc;

%% reading
I_O = imread('plytkaSzumImp.bmp');

%% processing

%median
I_Median = medfilt2(I_O, [7 7]);
%adapcyjne

I_Tmp = double(I_O);
I_Adap = I_Tmp;
[X Y] = size(I_Adap);
S = 1;
S_max = 3;
for i = 1 + S_max : X - S_max
    for j = 1 + S_max : Y - S_max
        %find components
    while (true)
            count = 0;
        for ii = i - S : i + S
            for jj = j - S: j + S
                count = count + 1;
                Table(count) = I_Tmp(ii, jj);
            end
        end
        z_min = min(Table);
        z_max = max(Table);
        z_med = median(Table);
        z_xy = I_Tmp(i, j);
        
        %algorithm
        if (z_min < z_med) && (z_med < z_max)
            if (z_min < z_xy) && (z_xy < z_max)
                I_Adap(i, j) = z_xy;
                break;
            else
                I_Adap(i, j) = z_med;
                break;
            end
        else
            if (S + 1 <= S_max)
                S = S + 1;
            else
                I_Adap(i, j) = z_med;
                break;
            end
    end
        end
    end
end

%% showing
figure;
x = 1; y = 3;
subplot(x,y,1); imshow(I_O); title('Original');
subplot(x,y,2); imshow(I_Median); title('Median');
subplot(x,y,3); imshow(I_Adap,[]); title('Adaptacyjna');