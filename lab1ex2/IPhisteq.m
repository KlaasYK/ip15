function outimg = IPhisteq(img,hist)

width = columns(img);
height = rows(img);

out = uint8(zeros(size(img)));
n = width * height;
rel = zeros(256,1);

% acquire historgram
if (nargin < 2)
  hist = IPhistogram(img);
endif

rel(1) = hist(1);
% make it cumalative
for i = 2 : 256
  rel(i) = rel(i-1) + hist(i);
endfor
% normalize it
rel = rel / n;
for i = 1 : height
  for j = 1 : width
    out(i,j) = uint8(round(256 * rel(img(i,j)+1)));
  endfor
endfor

outimg = out;