
x = imread('../images/fracturedspine.tiff');

eqimg = IPhisteq(x);

imagesc(eqimg);