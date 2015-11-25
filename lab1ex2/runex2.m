
x = imread('../images/fracturedspine.tiff');

hist = IPhistogram(x);
bar(hist);
eqimg = IPhisteq(x,hist);
imwrite(eqimg, 'test.tiff');
figure;
hist2 = IPhistogram(eqimg);
bar(hist2);

%figure;
%eqimg2 = IPhisteq(eqimg, hist2);
%hist3 = IPhistogram(eqimg2);
%bar(hist3);




%hist2 = IPhistogram(eqimg);
%figure;
%bar(hist);
%figure;
%bar(hist2);
%
