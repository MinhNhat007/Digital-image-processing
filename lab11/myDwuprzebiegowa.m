close all;
clearvars;
clc;

%% wczytywanie
I = imread('ccl1.png');
I2=I;
figure(1);
subplot(1,2,1);
imshow(I); title('moja metoda');

%% algorytm jednoprzebiegowy
[YY, XX] = size(I);
N=100;
cechy = repmat(struct('Pole',0,'Centroid', [0 0], 'ProstakatOt', [0 0 0 0]), N, 1);

S = zeros(2, 100);
top=0;
T = 1:N;
L=1;
for i=2:YY
    for j=2:(XX-1)
       if(I(i,j) ~= 0)
           A=I(i-1,j-1);
           B=I(i-1,j);
           C=I(i-1,j+1);
           D=I(i,j-1);
           if (A==0)
               TA=0;
           else
               TA=T(A);
           end
           if (B==0)
               TB=0;
           else
               TB=T(B);
           end
           if (C==0)
               TC=0;
           else
               TC=T(C);
           end
         sasiedzi = [TA, TB, TC, D];
         suma = sum(sasiedzi);
         
         % nowy obiekt
         if(suma==0)
             cechy(L).Pole = 1;
             cechy(L).Centroid(1)=j;
             cechy(L).Centroid(2)=i;
             cechy(L).ProstakatOt(1)=j;
             cechy(L).ProstakatOt(2)=i;
             cechy(L).ProstakatOt(3)=j;
             cechy(L).ProstakatOt(4)=i;
             I(i,j)=L;
             L=L+1;
         elseif suma>0
                 sasiedzi=nonzeros(sasiedzi);
                 minS = min(sasiedzi);
                 maxS = max(sasiedzi);
                 if(minS == maxS)
                     I(i,j)=minS;
                 else
                     T(maxS)=minS;
                     I(i,j)=minS;
                     if(A>C || D>C)
                         top=top+1;
                         S(1,top)=maxS;
                         S(2,top)=minS;
                     end
                 end
                 % aktualizacja parametrow
             polePop = cechy(minS).Pole;
             cechy(minS).Pole = polePop + 1;
             xPop = cechy(minS).Centroid(1);
             yPop = cechy(minS).Centroid(2);
             cechy(minS).Centroid(1)=xPop*polePop/(polePop+1) + j/(polePop+1);
             cechy(minS).Centroid(2)=yPop*polePop/(polePop+1) + i/(polePop+1);
             cechy(minS).ProstakatOt(1)=min(cechy(minS).ProstakatOt(1),j);
             cechy(minS).ProstakatOt(2)=min(cechy(minS).ProstakatOt(2),i);
             cechy(minS).ProstakatOt(3)=max(cechy(minS).ProstakatOt(3),j);
             cechy(minS).ProstakatOt(4)=max(cechy(minS).ProstakatOt(4),i);
             
         end
       end
    end
    while(top>0)
       T(S(1,top))=T(S(2,top));
       top=top-1;
    end
end

%eliminowanie pozostalych konfliktow
for i=1:numel(T)
    if T(i)~=i
        L2 = i;
        Lold = T(i);
        poleLold = cechy(Lold).Pole;
        poleL2 = cechy(L2).Pole;
        xLold = cechy(Lold).Centroid(1);
        yLold = cechy(Lold).Centroid(2);
        xL2 = cechy(L2).Centroid(1);
        yL2 = cechy(L2).Centroid(2);
        
        cechy(Lold).Centroid(1)=xLold*poleLold/(poleLold + poleL2) + xL2*poleL2/(poleLold + poleL2);
        cechy(Lold).Centroid(2)=yLold*poleLold/(poleLold + poleL2) + yL2*poleL2/(poleLold + poleL2);
        
        cechy(Lold).ProstakatOt(1)=min(cechy(Lold).ProstakatOt(1),cechy(L2).ProstakatOt(1));
        cechy(Lold).ProstakatOt(2)=min(cechy(Lold).ProstakatOt(2),cechy(L2).ProstakatOt(2));
        cechy(Lold).ProstakatOt(3)=max(cechy(Lold).ProstakatOt(3),cechy(L2).ProstakatOt(3));
        cechy(Lold).ProstakatOt(4)=max(cechy(Lold).ProstakatOt(4),cechy(L2).ProstakatOt(4));
        cechy(Lold).Pole = cechy(Lold).Pole + cechy(L2).Pole;
        T(i)=T(T(i));
    end
end

%rysowanie parametrow
uniqueT = unique(T);
hold on;
for i=1:numel(uniqueT)
    x=cechy(uniqueT(i)).Centroid(1);
    y=cechy(uniqueT(i)).Centroid(2);
    if(x==0 && y==0) 
        continue; 
    end
    plot(x,y,'o', 'Color', 'blue');
    text(x+6,y+3,num2str(cechy(uniqueT(i)).Pole), 'Color', 'magenta');
    w=cechy(uniqueT(i)).ProstakatOt(3)-cechy(uniqueT(i)).ProstakatOt(1);
    h=cechy(uniqueT(i)).ProstakatOt(4)-cechy(uniqueT(i)).ProstakatOt(2);
    rectangle('Position',[cechy(uniqueT(i)).ProstakatOt(1) cechy(uniqueT(i)).ProstakatOt(2) w h], 'EdgeColor', 'g');
end
hold off;

%% wersja matlabowa
subplot(1,2,2);
imshow(I2); title('matlab');

Ilabel= bwlabel(I2);
pole = regionprops(Ilabel, 'Area');
centroid = regionprops(Ilabel, 'Centroid');
prostakatOt = regionprops(Ilabel, 'BoundingBox');

hold on;
for i=1:numel(pole)
    x=centroid(i).Centroid(1);
    y=centroid(i).Centroid(2);
    plot(x,y,'o', 'Color', 'blue');
    text(x+6,y+3,num2str(pole(i).Area), 'Color', 'magenta');
    rectangle('Position',prostakatOt(i).BoundingBox, 'EdgeColor', 'g');
end
hold off;