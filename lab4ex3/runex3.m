
x = imread('../images/blobs.tif');

y = makebinary(x,128);
imwrite(y,'binary.png');

background = x .* y;
background2 = 256 - background;
background2 = background2 .* y;
background2 = 256 - background2;
maxnoiseval = max(max(background))
minnoiseval = min(min(background2))
meannoise = mean([mean(mean(background)) mean(mean(background2)) ]);
imwrite(background,'background.png');
imwrite(background2,'background2.png');

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

%c = xor(c, y);

imwrite(c,'restored.png');

% generate noise image (choose random, or mean)
noise = rand(size(x))*(maxnoiseval-minnoiseval) + minnoiseval;
noise = ones(size(x)) * meannoise;

noise = noise .* c;

imwrite(noise,'noise.png');

restore = not(c);
restoredim = restore .* x + noise;

imwrite(restoredim,'final.png');
