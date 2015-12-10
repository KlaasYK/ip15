% Read the source image
x = im2double(imread('../images/tracy.tif'));
% Compress the image
y1 = IPwaveletcompress(x,1,0.02);
y2 = IPwaveletcompress(x,2,0.02);
y3 = IPwaveletcompress(x,3,0.02);

y4 = IPwaveletcompress(x,3,0.02);
y5 = IPwaveletcompress(x,3,0.05);
y6 = IPwaveletcompress(x,3,0.10);


imwrite(im2uint8(y1),'l1t002.png'); 
imwrite(im2uint8(y2),'l2t002.png');
imwrite(im2uint8(y3),'l3t002.png');

imwrite(im2uint8(y4),'l3t002.png'); 
imwrite(im2uint8(y5),'l3t005.png');
imwrite(im2uint8(y6),'l3t010.png');


