% convert the image to a binary image using threshold
function retval = makebinary(img, threshold)
  schema = ones(size(img))*threshold;
  retval = img > threshold;
end