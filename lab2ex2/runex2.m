
x = imread('../images/characters.tif');

%% lab 1 ex 2abc
H = IPgaussian(30, size(x, 1), size(x, 2));
imwrite(fftshift(H), "filter.png");
imwrite(IPftfilter(x, H), "characters-GHPF-D30.png");
H = IPgaussian(60, size(x, 1), size(x, 2));
imwrite(IPftfilter(x, H), "characters-GHPF-D60.png");
H = IPgaussian(160, size(x, 1), size(x, 2));
imwrite(IPftfilter(x, H), "characters-GHPF-D160.png");