function segmentation_podzial_split(Img,x1,y1,x2,y2)    
global minimalny_rozmiar_obrazu;
global prog_odchylenia_standardowego;
global segRes;
global MRes;
global global_index;

Image_Part = Img(y1:y2,x1:x2);
meanVal = mean(Image_Part(:));
stdVal = std(Image_Part(:));

if(stdVal < prog_odchylenia_standardowego) || ((x2-x1) <= minimalny_rozmiar_obrazu)
    global_index = global_index + 1;
    segRes(y1:y2,x1:x2) = global_index;
      MRes(y1:y2,x1:x2) = meanVal;
else
    xN = round((x2+x1)/2);
    yN = round((y2+y1)/2);
    
    segmentation_podzial_split(Img,x1,y1,xN,yN);
    segmentation_podzial_split(Img,xN+1,y1,x2,yN);
    segmentation_podzial_split(Img,xN+1,yN+1,x2,y2);
    segmentation_podzial_split(Img,x1,yN+1,xN,y2);
end

end
