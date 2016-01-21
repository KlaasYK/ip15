x = imread('../images/tiger.tif');

% 8 gives best closed result
[y,blocks] = splitmerge(x,16,@IPpredicate);

mini = min(min(y));
maxi = max(max(y));

z = y ./ (maxi-mini);
im=im2uint8(z);
imwrite(im,'test.png');
