close all;
clearvars;
clc;

%% reading
I_ccl1 = imread('ccl1.png');
I_original = I_ccl1;

%% processing
[YY, XX] = size(I_ccl1);
Stack = zeros(2, 100);
topStack = 0;
T = 1:100;
L = 0;
for y=2:YY
    for x=2:(XX-1)
       if(I_ccl1(y,x) ~= 0)
           
           A=I_ccl1(y-1,x-1);
           B=I_ccl1(y-1,x);
           C=I_ccl1(y-1,x+1);
           D=I_ccl1(y,x-1);
           
           if (A==0) 
               TA=0;
           else TA=T(A);
           end
           if (B==0) 
               TB=0;
           else TB=T(B);
           end
           if (C==0) 
               TC=0;
           else TC=T(C);
           end
           
         sasiedzi = [TA, TB, TC, D];
         suma = sum(sasiedzi);
         if(suma==0)
             I_ccl1(y,x)=L;
             L=L+1;
         elseif suma>0
             minSasiedzi = min(nonzeros(sasiedzi));
             maxSasiedzi = max(nonzeros(sasiedzi));
             if(minSasiedzi == maxSasiedzi)
                 I_ccl1(y,x) = minSasiedzi;
             else
                 T(maxSasiedzi) = minSasiedzi;
                 I_ccl1(y,x) = minSasiedzi;
                 if(A > C || D > C)
                     topStack=topStack+1;
                     Stack(1,topStack)=maxSasiedzi;
                     Stack(2,topStack)=minSasiedzi;
                 end
             end
          end
       end
    end
    while(topStack > 0)
       T(Stack(1, topStack)) = T(Stack(2, topStack));
       topStack = topStack - 1;
    end
end

for y = 1:numel(T)
    if T(y) ~= y
        T(y)=T(T(y));
    end
end

for y = 1 : YY
    for x=1 : XX
        if(I_ccl1(y,x) ~= 0)
            I_ccl1(y,x) = T(I_ccl1(y,x));
        end;
    end
end
figure(1);
subplot(1,2,1); imshow(I_original); title('original');
subplot(1,2,2); imshow(label2rgb(I_ccl1)); title('zmodyf. ind. dwuprzebiegowa');