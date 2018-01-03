function [ H ] = myFun( I, aMin, aMax, aSkok, bMin, bMax, bSkok )  

a_v = aMin:aSkok:aMax;
b_v = bMin:bSkok:bMax;
H = zeros(length(a_v), length(b_v));

[sizeX sizeY] = size(I);

for x = 1:sizeX
    for y = 1:sizeY
        if (I(y, x) == 1)
            for aa = 1:length(a_v)
                b = y - a_v(aa) * x;
                [v, bb] = min( abs(b_v - b));
                H(aa, bb) = H(aa, bb) + 1;
            end
        end
    end
end

