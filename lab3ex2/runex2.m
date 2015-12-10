
x = im2double(imread('../images/vase.tif'));

%% lab 2 ex 2abc
y = IPdwt2(x, 3);
imwrite(y, 'unscaled.tif');
imwrite(im2uint8(IPdwt2scale(x, 3)), 'scaled.tif');
imwrite(im2uint8(IPidwt2(y,3)), 'output.tif');