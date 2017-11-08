function newDerivative = calculateDerivatives(Matrix, YY, XX, j, i, mode)
    if mode == 0 %Ax
        X1 = double(Matrix(min(YY,j+1+1), i+1));
        X2 = double(Matrix(max(1,j-1+1),i+1));
        newDerivative  = (X1-X2)/2;
    elseif mode == 1 %Ay
        Y1 = double(Matrix(j+1,min(XX,i+1+1)));
        Y2 = double(Matrix(j+1,max(1,i-1+1)));
        newDerivative = (Y1-Y2)/2;
    else %Axy
        XY1 = double(Matrix(min(YY,j+1+1),min(XX,i+1+1)));
        XY2 = double(Matrix(max(1,j-1+1),i+1));
        XY3 = double(Matrix(j+1,max(1,i-1+1)));
        XY4 = double(Matrix(j+1,i+1));
        newDerivative = (XY1-XY2-XY3+XY4)/4;
    end
end