% function to perform 2D Haar wavelet transform
function retval = IPdwt2(x, j)
% note that x should be double instead of uint, because
% the result can get negative
out = x;
coef = 1/2;

initrow = size(out, 1);
initcol = size(out, 2);

for i = 1 : j
  odds_c = out(1:initrow, 1:2:initcol);
  evens_c = out(1:initrow, 2:2:initcol);
  sums = (odds_c + evens_c);
  diffs = (odds_c - evens_c);
  out(1:initrow, 1:initcol) = [sums, diffs] * coef;

  odds_r = out(1:2:initrow, 1:initcol);
  evens_r = out(2:2:initrow, 1:initcol);
  sums = (odds_r + evens_r) * coef;
  diffs = (odds_r - evens_r) * coef;
  
  %
  mid_r = initrow / 2;
  mid_c = initcol / 2;
  % approximation image
  out(1:mid_r, 1:mid_c) = sums(:, 1:mid_c);
  % vertical detail
  out(mid_r+1:initrow, 1:mid_c) = sums(:, mid_c+1:initcol);
  % horizontal detail
  out(1:mid_r, mid_c+1:initcol) = diffs(:, 1:mid_c);
  % detail detail
  out(mid_r+1:initrow, mid_c+1:initcol) = diffs(:, mid_c+1:initcol);
  
  initrow = mid_r;
  initcol = mid_c;
end

retval = out;

endfunction