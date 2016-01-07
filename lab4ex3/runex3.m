
x = imread('../images/blobs.tif');

mask = makebinary(x,128);
imwrite(mask,'binarymask.png');

% Calculate the average background noise
background = x .* mask;
background2 = 256 - background;
background2 = background2 .* mask;
background2 = 256 - background2;
meannoise = mean([mean(mean(background)) mean(mean(background2)) ]);

% structuring element
blob = makeblob(8);
blob2 = makeblob(11);
blob3 = makeblob(4);

% erode the circles (all circles radius < 8 will be removed)
eroded = makebinary(conv2(mask,blob,"same"),1);
imwrite(eroded,'convolution.png');

% take the complement as eroding background = dilating foreground
erodedcomp = not(eroded);

% erode the background two times using different SE
firstdilate = not(makebinary(conv2(erodedcomp,blob2,"same"),1));
% or used, since the background uses 1 and foreground 0
firstdilate = or(firstdilate,  mask);
secondilate = not(makebinary(conv2(not(firstdilate),blob3,"same"),1));
secondilate = or(secondilate,  mask);
imwrite(secondilate,'restored.png');

% generate noise image component
noise = uint8(ones(size(x)) .* secondilate * meannoise);

restoredimage = not(secondilate) .* x + noise;
imwrite(restoredimage,'final.png');
