
x = imread('../images/blurrymoon.tiff');

#dependency of IPfilter
pkg load image

## lab 1 ex 3a
# test: calculate the difference between our implementation against the imfilter
umask =  1/9 * ones(3, 3);
sum(sum(IPfilter(x, umask) - imfilter(x, umask)))

## lab 1 ex 3b

sobelimg = IPSobel(x);
imwrite(sobelimg, 'blurrymoonsobel.tiff');