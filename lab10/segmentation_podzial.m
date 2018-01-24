function segmentation_podzial(Img)
global minimalny_rozmiar_obrazu;
global prog_odchylenia_standardowego;
global segRes;
global MRes;
global global_index;

Img_HSV = rgb2hsv(Img);
Img_H = double(Img_HSV(:,:,1));
[Img_Y,Img_X] = size(Img_H);

prog_kolorow = 5/255;
minimalny_rozmiar_obszaru = 33;
minimalny_rozmiar_obrazu = 8;
prog_odchylenia_standardowego = 0.05;
segRes = zeros(Img_Y,Img_X);
MRes = zeros(Img_Y,Img_X);
global_index = -1;

segmentation_podzial_split(Img_H,1,1,Img_X,Img_Y);

segRes_split = segRes;
MRes_split = MRes;

global_index
i = 0;
while i<=global_index
    IB = segRes == i;
    
    if any(IB(:))
        [yF, xF] = find(IB,1,'first');
        IB_dilate = imdilate(IB,strel('square',3));
        IB_diff = imabsdiff(IB_dilate,IB);
        IB_mult = IB_diff.*segRes;
        IB_mult_non_zeros = nonzeros(IB_mult);
        IB_unique = unique(IB_mult_non_zeros);
        joined = 0;
        for k = 1:numel(IB_unique);
            IBS = segRes == IB_unique(k);
            [yFS, xFS] = find(IBS,1,'first');
            
            color_difference = abs(MRes(yF,xF) - MRes(yFS, xFS));
            if color_difference < prog_kolorow
                segRes(IBS) = i;
                joined = 1;
            end
        end
        if joined == 0
            i = i+1;
        end
    else
        i = i+1;
    end
end

segRes_for = segRes;
MRes_for = MRes;

segRes_unique = unique(segRes);
for i = 1:numel(segRes_unique)
    obszar = segRes == segRes_unique(i);
    if sum(obszar) < minimalny_rozmiar_obszaru
        segRes(obszar) = 0;
    end
end

segRes_unique_2 = unique(segRes);
for i = 1:numel(segRes_unique_2)
    obszar = segRes == segRes_unique_2(i);
    segRes(obszar) = i;
end

Img_final = label2rgb(segRes);

figure2 = figure(2); f1_rows = 4; f1_cols = 2;
subplot(f1_rows,f1_cols,1); imshow(Img); title('Img Original');
subplot(f1_rows,f1_cols,2); imshow(Img_H,[]); title('Img H');
subplot(f1_rows,f1_cols,3); imshow(segRes_split,[]); title('segRes after split');
subplot(f1_rows,f1_cols,4); imshow(MRes_split,[]); title('MRes after split');
subplot(f1_rows,f1_cols,5); imshow(segRes_for,[]); title('segRes after for');
subplot(f1_rows,f1_cols,6); imshow(MRes_for,[]); title('MRes after for');
subplot(f1_rows,f1_cols,7); imshow(Img_final); title('Img Final');

end
