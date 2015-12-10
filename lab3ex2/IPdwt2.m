% function to perform 2D Haar wavelet transform
function retval = IPdwt2(x, j)
sqrt2 = sqrt(2);
sqrt4 = sqrt(4);
out = im2double(x);
out -= 0.5;

initrow = size(out, 1);
initcol = size(out, 2);

for i = 1 : j
  odds_r = out(1:2:initrow, 1:initcol);
  evens_r = out(2:2:initrow, 1:initcol);
  sums = (odds_r + evens_r) / sqrt4;
  diffs = ((odds_r - evens_r)) /sqrt2;
  out(1:initrow, 1:initcol) = [sums; diffs];
  
  odds_c = out(1:initrow, 1:2:initcol);
  evens_c = out(1:initrow, 2:2:initcol);
  sums = (odds_c + evens_c) / sqrt4;
  diffs = ((odds_c - evens_c)) / sqrt2;
  out(1:initrow, 1:initcol) = [sums, diffs];
    
  
  initrow = initrow / 2;
  initcol = initcol / 2;
end

out += 0.5;

retval = im2uint8(out);
endfunction