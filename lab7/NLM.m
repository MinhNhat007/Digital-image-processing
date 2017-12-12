function [data_filtered] = NLM(data, v_size, n_size, sigma, alpha)
    % Size of the image 
    [m n]=size(data);
    
    % Memory for the output
    data_filtered = zeros(m,n);
    
    %initilization
    maska = fspecial('gaussian', [2*n_size+1 2*n_size+1], sigma);
    
    %implement algorithm
    for i = 1:m
    for j = 1:n
        if i - v_size <= 0 || j - v_size <= 0 || i + v_size > m || j + v_size > n
            data_filtered(i, j) = data(i, j);
        else
            w_max = 0;
            average=0;
            sweight=0;
            v_i_min = i - v_size;
            v_i_max = i + v_size;
            v_j_min = j - v_size;
            v_j_max = j + v_size;
            
             N_x = data(i - n_size : i + n_size, j - n_size : j + n_size);
             u_x = N_x * maska;
            
            for ii = v_i_min + n_size : v_i_max - n_size
            for jj = v_j_min + n_size : v_j_max - n_size
                 N_p = data(ii - n_size : ii + n_size, jj - n_size : jj + n_size);
                 u_p = N_p * maska;
                 lambda = norm(u_p-u_x, 2) ^ 2;
                 w_p_x = exp(-lambda/(alpha*sigma^2));
                 if (w_p_x > w_max)
                    w_max = w_p_x;
                 end
                 sweight = sweight + w_p_x;
                 average = average + w_p_x*data(ii, jj);  
            end
            end
            
            average = average + w_max*data(i,j);
            sweight = sweight + w_max;
                   
            if sweight > 0
                data_filtered(i,j) = average / sweight;
            else
                data_filtered(i,j) = data(i,j);
            end    
            
        end
    end
    end
end