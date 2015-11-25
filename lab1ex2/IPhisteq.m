function outimg = IPhisteq(img)

width = columns(img);
height = rows(img);

out = zeros(size(img));
n = width * height;

% acquire historgram
hist = IPhistogram(img);
% make it cumalative
for i = 2 : 256
  hist(i) = hist(i-1) + hist(1);
endfor
% normalize it
hist = hist / n;

for i = 1 : height
  for j = 1 : width
    out(i,j) = 256 * hist(img(i,j)+1);
  endfor
endfor

outimg = out;