
x = imread('../images/fracturedspine.tiff');

hist = IPhistogram(x);
bar(hist);
axis("tight");
axis("tic", "labely");
eqimg = IPhisteq(x,hist);
imwrite(eqimg, 'test.tiff');
figure;
hist2 = IPhistogram(eqimg);
bar(hist2);
axis("tight");
axis("tic", "labely");
