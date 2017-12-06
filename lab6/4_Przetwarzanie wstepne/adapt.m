function [ ret ] = adapt( im, x, y, Smax )
%ADAPT Summary of this function goes here
%   Detailed explanation goes here

fazaA = 1;
rozmiar = 1;

while fazaA == 1,
    Sxy = double( im( (y-rozmiar):(y+rozmiar) , (x-rozmiar):(x+rozmiar) ) );
    zmin = min(Sxy(:));
    zmax = max(Sxy(:));
    zmed = median(Sxy(:));
    zxy = double(im(y, x));
    
    A1 = zmed - zmin;
    A2 = zmed - zmax;
    if ((A1 > 0) && (A2 < 0)),
        fazaA = 0;
    else
        rozmiar = rozmiar+1;
        if rozmiar <= Smax,
            %powtorz A
        else
            ret = zmed;
            return;
        end
    end;
end

B1 = zxy - zmin;
B2 = zxy - zmax;
if ((B1 > 0) && (B2 < 0)),
    ret = zxy;
    return;
else
    ret = zmed;
    return;
end

end

