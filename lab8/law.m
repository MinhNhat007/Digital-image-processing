function out = law(nhood)
    criticalPoint = nhood(2, 2);
    sumOfNeighbour = sum(sum(nhood)) - criticalPoint;
    if (criticalPoint == 1)
        if (sumOfNeighbour == 2 || sumOfNeighbour == 3)
            out = 1;
        else
            out = 0;
        end
    else
        if (sumOfNeighbour == 3)
            out = 1;
        else
            out = 0;
        end
    end
end