function [data_filtered] = bilateral(data, local_window, RO)

    FUNCTION = @(data_, local_window_, RO_)bilateral_local(data_, local_window_, RO);
    data_filtered = colfilt(data, local_window, 'sliding', FUNCTION, local_window);
end