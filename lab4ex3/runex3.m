
x = imread('../images/blobs.tif');

y = makebinary(x,128);

% structuring element
blob = makeblob(6);


z = makebinary(conv2(y,blob,"valid"),1);


imwrite(y,'binary.png');
imwrite(z,'conv.png');



