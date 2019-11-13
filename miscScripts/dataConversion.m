%This script converst labels into fast ai format
imgData = imageDatastore(fullfile('..','labelmefacade','Oldlabels'));
%mkdir('..\newLabels');
for i=1:size(imgData.Files,1)
    fileName = strsplit(imgData.Files{i}, 'labels\');
    fileName = fileName{1,2};
    img = imread(imgData.Files{i});
    mask = zeros(size(img,1), size(img,2));
    
    %conditions for labels
    for j=1:size(img,1)
        for k=1:size(img,2)
            if img(j,k,1)==0 && img(j,k,2)==0 && img(j,k,3)==0
                mask(j,k) = 0; %various
            elseif img(j,k,1)==32896 && img(j,k,2)==0 && img(j,k,3)==0
                mask(j,k) = 1; %building
            elseif img(j,k,1)==32896 && img(j,k,2)==0 && img(j,k,3)==32896
                mask(j,k) = 2; %car
            elseif img(j,k,1)==32896 && img(j,k,2)==32896 && img(j,k,3)==0
                mask(j,k) = 3; %door
            elseif img(j,k,1)==32896 && img(j,k,2)==32896 && img(j,k,3)==32896
                mask(j,k) = 4; %pavement
            elseif img(j,k,1)==32896 && img(j,k,2)==32896/2 && img(j,k,3)==0
                mask(j,k) = 5; %road
            elseif img(j,k,1)==0 && img(j,k,2)==32896 && img(j,k,3)==32896
                mask(j,k) = 6; %sky
            elseif img(j,k,1)==7 && img(j,k,2)==32896 && img(j,k,3)==0
                mask(j,k) = 8; %vegetation
            elseif img(j,k,1)==8 && img(j,k,2)==0 && img(j,k,3)==32896
                mask(j,k) = 9; %window
            end
        end
    end
    mask = uint16(mask);
    imwrite(mask,fullfile('..','labelmefacade', 'labels', fileName));
    disp(strcat("Progress: ", num2str(i/size(imgData.Files,1)*100), "%"));
end