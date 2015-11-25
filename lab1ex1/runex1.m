
x = imread('../images/chronometer1250dpi.tif');

smallx = IPresize(x,-10);
newx = IPresize(smallx,10);

imwrite(newx, 'test.tiff');
