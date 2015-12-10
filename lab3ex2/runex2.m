
x = im2double(imread('../images/vase.tif'));

%% lab 1 ex 2abc
y = IPdwt2(x, 3);
imwrite(y, 'unscaled.tif');
imwrite(IPdwt2scale(x, 3), 'scaled.tif');