% Read the source image
x = imread('../images/tracy.tif');
% Compress the image
y1 = IPwaveletcompress(x,2,0.1);



