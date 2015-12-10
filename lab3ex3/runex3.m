% Read the source image
x = im2double(imread('../images/tracy.tif'));
% Compress the image
y1 = IPwaveletcompress(x,1,0.02);
y2 = IPwaveletcompress(x,3,0.02);
y3 = IPwaveletcompress(x,5,0.02);
y7 = IPwaveletcompress(x,7,0.02);
y8 = IPwaveletcompress(x,9,0.02);

y4 = IPwaveletcompress(x,3,0.02);
y5 = IPwaveletcompress(x,3,0.05);
y6 = IPwaveletcompress(x,3,0.10);

y9 = IPwaveletcompress(x,7,0.02);
y10 = IPwaveletcompress(x,7,0.05);
y11 = IPwaveletcompress(x,7,0.10);


imwrite(im2uint8(y1),'l1t002.png'); 
imwrite(im2uint8(y2),'l3t002.png');
imwrite(im2uint8(y3),'l5t002.png');

imwrite(im2uint8(y4),'l3t002.png'); 
imwrite(im2uint8(y5),'l3t005.png');
imwrite(im2uint8(y6),'l3t010.png');

imwrite(im2uint8(y7),'l7t002.png');
imwrite(im2uint8(y8),'l9t002.png');

imwrite(im2uint8(y9),'l7t002.png'); 
imwrite(im2uint8(y10),'l7t005.png');
imwrite(im2uint8(y11),'l7t010.png');