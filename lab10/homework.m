%% clear
close all;
clearvars;
clc;

%% task1
I_n = imread('dam_n.png');
I_n1 = imread('dam_n_1.png');

figure(1);
subplot(1, 2, 1); imshow(I_n); title('dam n');
subplot(1, 2, 2); imshow(I_n1); title('dam n1');

[Cn1, num]= bwlabel(I_n1);
Cn = bwlabel(I_n);

figure(2);
imshow(Cn1,[]); title('bwlabel');

[XX, YY] = size(I_n1);
damImage = zeros(XX, YY);

while true
    zmiany = 0;
    
    for o = 1 : num 
        Cn1_copy = Cn1;
        
        for x = 2 : XX - 1
            for y = 2 : YY - 1
                if (Cn(x, y) > 0 && Cn1(x, y) == 0)
                    C = Cn1(x - 1: x + 1, y - 1: y + 1);
                    C = C(:);
                    C0 = nonzeros(C);
                    if sum(C0 == o) > 0
                        CU = unique(C0);
                        zmiany = 1;
                        if length(CU) == 1
                            Cn1_copy(x, y) = CU;
                        else
                            damImage(x, y) = 1;
                            Cn(x, y) = 0;
                        end
                    end
                end
            end
        end
  
        Cn1 = Cn1_copy;
    end

    if zmiany == 0
        break;
    end
end

figure(3);
subplot(1, 2, 1); imshow(damImage,[]); title('damImage');
subplot(1, 2, 2); imshow(Cn1, []); title('Cn1');