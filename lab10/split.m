function split(I, y1, x1, y2, x2)
    
    global prog;
    global limitPodzialu;
    global index;
    global segRes;
    global MRes;

    subImage = I(y1:y2, x1: x2);
    subVector = subImage(:);
    myMean = mean(subVector);
    myStd = std(subVector);
    
    if (myStd < prog) || ((x2 - x1) <= limitPodzialu) || ((y2 - y1) <= limitPodzialu)
        segRes(y1:y2, x1:x2) = index;
        index = index + 1;
        
        MRes(y1:y2, x1:x2) = myMean;
    else
        y3 = floor((y2+y1)/2);
        x3 = floor((x1+x2)/2);
        
        split(I, y1, x1, y3, x3);
        split(I, y1, x3 + 1, y3, x2);
        split(I, y3 + 1, x1, y2, x3);
        split(I, y3 + 1, x3 + 1, y2, x2);
    end
end