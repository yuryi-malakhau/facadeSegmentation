%This script converst labels into fast ai format
imgData = imageDatastore('..\labels');
mkdir('..\newLabels');
for i=1:size(imgData.Files,1)
    fileName = strsplit(imgData.Files{i}, 'labels\');
    fileName = fileName{1,2};
    img = imread(imgData.Files{i});
    mask = zeros(size(img,1), size(img,2));
    
    %conditions for labels
    for j=1:size(img,1)
        for k=1:size(img,2)
            if img(j,k,1)==0 && img(j,k,2)==0 && img(j,k,3)==0
                mask(j,k) = 1; %various
            elseif img(j,k,1)==32896 && img(j,k,2)==0 && img(j,k,3)==0
                mask(j,k) = 2; %building
            elseif img(j,k,1)==32896 && img(j,k,2)==0 && img(j,k,3)==32896
                mask(j,k) = 3; %car
            elseif img(j,k,1)==32896 && img(j,k,2)==32896 && img(j,k,3)==0
                mask(j,k) = 4; %door
            elseif img(j,k,1)==32896 && img(j,k,2)==32896 && img(j,k,3)==32896
                mask(j,k) = 5; %pavement
            elseif img(j,k,1)==32896 && img(j,k,2)==32896/2 && img(j,k,3)==0
                mask(j,k) = 6; %road
            elseif img(j,k,1)==0 && img(j,k,2)==32896 && img(j,k,3)==32896
                mask(j,k) = 7; %sky
            elseif img(j,k,1)==0 && img(j,k,2)==32896 && img(j,k,3)==0
                mask(j,k) = 8; %vegetation
            elseif img(j,k,1)==0 && img(j,k,2)==0 && img(j,k,3)==32896
                mask(j,k) = 9; %window
            end
        end
    end
    mask = uint16(mask);
    imwrite(mask,fullfile('..','newLabels', fileName));
    disp(strcat("Progress: ", num2str(i/size(imgData.Files,1)*100), "%"));
end