
x = im2double(imread('../images/vase.tif'));

%% lab 3 ex 2abcd
y = IPdwt2(x, 3);

imwrite(y, 'unscaled.png');
imwrite(im2uint8(IPdwt2scale(x, 3)), 'scaled.png');
imwrite(im2uint8(IPidwt2(y,3)), 'output.png');
% the difference
sum(sum(im2uint8(x - IPidwt2(y,3))))
