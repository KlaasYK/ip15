x = imread('../images/house.tif');

sigma = 0.006*min(size(x));
im = IPMarrHildreth(x, sigma);
imwrite(im,'mrhouse06.png');
