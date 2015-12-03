% Read the image
x = imread('../images/circuitboard.tif');
% Add the salt & pepper noise
x=imnoise(x,'salt & pepper',0.2);
% Output the noise image
imwrite(x,'noise.png');

% Perform the median algorithm with k values 1 , 2, 3, 4
y = IPmedian(x,1);
imwrite(y,'restored1.png');

y = IPmedian(x,2);
imwrite(y,'restored2.png');


y = IPmedian(x,3);
imwrite(y,'restored3.png');

y = IPmedian(x,4);
imwrite(y,'restored4.png');
