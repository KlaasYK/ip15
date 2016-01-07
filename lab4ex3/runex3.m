
x = imread('../images/blobs.tif');

y = makebinary(x,128);
imwrite(y,'binary.png');

% structuring element
blob = makeblob(8);
blob2 = makeblob(11);
blob3 = makeblob(4);

% erode the circles
z = makebinary(conv2(y,blob,"same"),1);
imwrite(z,'conv.png');
% take the complement
a = not(z);
% erode the background
b = not(makebinary(conv2(a,blob2,"same"),1));
imwrite(b,'filtered.png');
% restore the image (my octave fucked up, must be and)
c = or(b,  y);
c = not(makebinary(conv2(not(c),blob3,"same"),1));
c = or(c,  y);


imwrite(c,'restored.png');



