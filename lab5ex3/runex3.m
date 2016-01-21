x = imread('../images/lincoln.tif');

[start,contour] = IPcontour(x);
start
[l,~] = size(contour);

contour = IPfourierdescr(contour,38);

% reconstruct the boundary
im = zeros(size(x));
for i=1:l
    im(contour(i,1),contour(i,2))= 1;
end

imwrite(im,'contour.png');