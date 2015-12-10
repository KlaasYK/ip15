% inverse discrete wavelet transform
function retval = IPidwt2(x, s);
out = x;

[height, width] = size(x);
initrow = height / (2^(s-1));
initcol = width / (2^(s-1));

for i = 1 : s
  mid_r = initrow / 2;
  mid_c = initcol / 2;

  % make sure we swap horizontal and vertical details
  rowsums = [out(1:mid_r, 1:mid_c), out(mid_r+1:initrow, 1:mid_c)];
  rowdiffs = [out(1:mid_r, mid_c+1:initcol), out(mid_r+1:initrow, mid_c+1:initcol)];
  
  % Calculate and scale the result
  plus = (rowsums+rowdiffs);
  mins = (rowsums-rowdiffs);
  % Combine the new values
  combined = zeros(initrow,initcol);
  combined(1:2:end,:) = plus;
  combined(2:2:end,:) = mins;
  % Replace the values in the image
  out(1:initrow,1:initcol) = combined;
  
  % Do the same with the columns
  colsums = out(1:initrow,1:mid_c);
  coldiffs = out(1:initrow,mid_c+1:initcol);
  
  % Calculate and scale the result
  plus = (colsums+coldiffs);
  mins = (colsums-coldiffs);
  % Combine the new values
  combined(:,1:2:end) = plus;
  combined(:,2:2:end) = mins;
  % Replace the values in the image
  out(1:initrow,1:initcol) = combined;
  
  initrow *= 2;
  initcol *= 2;
end

retval = im2uint8(out);
end