% Read the source image
x = im2double(imread('../images/tracy.tif'));
% Compress the image
y1 = IPwaveletcompress(x,1,0.02);
y1 = IPwaveletcompress(x,2,0.02);
y1 = IPwaveletcompress(x,3,0.02);

imwrite(im2uint8(y1),'output.png'); 


