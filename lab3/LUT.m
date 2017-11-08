function LUT(obraz, przekodowanie )
    % Detailed explanation goes here
    newObraz = intlut(obraz, przekodowanie);
    
    %show results
    subplot(1,3,1);
    plot (przekodowanie);
    title('function');

    subplot(1,3,2);
    imshow(obraz);
    title('original');

    subplot(1,3,3);
    imshow(newObraz);
    title('image after changing');

end

