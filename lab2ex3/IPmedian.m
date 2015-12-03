% Median filter width a 2k+1 x 2k+1 window
function [out] = IPmedian(img,k)
% get the image size
[width, height] = size(img)
%create the output image
dest = uint8(zeros(size(img)));

% loop over all pixels
for x = 1 : width
  for y = 1 : height
    % determine the edge of the window
    % the size of the window shrinks at the boundaries of the image
    startx = max(x-k,1);
    starty = max(y-k,1);
    endx = min(x+k,width);
    endy = min(y+k,height);
    % get the submatrix
    submat = img(startx:endx,starty:endy);
    [w,h] = size(submat);
    % convert it to a vector to be able to calculute the median
    submat = reshape(submat, 1, w*h);
    % take the median and store it    
    dest(x,y) = median(submat);
  end
end
% output the image
out = dest;