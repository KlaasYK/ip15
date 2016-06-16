% function to perform 2D Haar wavelet transform
function retval = IPdwt2(x, j)
sqrt2 = sqrt(2);
out = im2double(x);

initrow = size(out, 1);
initcol = size(out, 2);

for i = 1 : j
  odds_c = out(1:initrow, 1:2:initcol);
  evens_c = out(1:initrow, 2:2:initcol);
  sums = (odds_c + evens_c);
  diffs = (odds_c - evens_c);
  out(1:initrow, 1:initcol) = [sums, diffs] / sqrt2;
  
  odds_r = out(1:2:initrow, 1:initcol);
  evens_r = out(2:2:initrow, 1:initcol);
  sums = (odds_r + evens_r);
  diffs = (odds_r - evens_r);
  out(1:initrow, 1:initcol) = [sums; diffs] / sqrt2;
  
  initrow = initrow / 2;
  initcol = initcol / 2;
end

retval = im2uint8(out);
endfunction