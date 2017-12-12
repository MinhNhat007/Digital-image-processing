function [data_filtered] = bilateral_local(data, local_window, RO)
    Nx = size(data, 2);
    h = fspecial('gaussian', local_window, 25);
    
    data_filtered = zeros(1, Nx);
    
    for i = 1 : Nx
        patch = reshape(data(:, i), local_window);
        [rows, cols] = find(patch == patch);
        rows = reshape(rows, local_window);
        cols = reshape(cols, local_window);
        Ncy = ceil(local_window(1)/2);
        Ncx = ceil(local_window(2)/2);
        dist = sqrt(Ncy - rows).^2 + (Ncx - cols).^2;
        
        y = abs(patch - patch(Ncy, Ncx));
        gamma = exp(-y.^2/(2 * RO .^ 2));
        
        Wn = sum(sum(h.*gamma));
        Sigma = sum(sum(h.*gamma.*patch));
        
        data_filtered(i) = Sigma / Wn;
    end
end