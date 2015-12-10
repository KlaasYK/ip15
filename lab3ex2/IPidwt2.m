% inverse discrete wavelet transform
function retval = IPidwt2(x, s);
sqrt4 = sqrt(4);
out = x;
[width, height] = size(x);
initrow = height / (2^(s-1));
initcol = width / (2^(s-1));

for i = 1 : s
  colsums = out(1:initrow,1:initcol/2);
  coldiffs = out(1:initrow,initcol/2+1:initcol);
  
  % Calculate and scale the result
  plus = (colsums+coldiffs)/sqrt4;
  mins = (colsums-coldiffs)/sqrt4;
  % Combine the new values
  combined = zeros(initrow,initcol);
  combined(:,1:2:end) = plus;
  combined(:,2:2:end) = mins;
  % Replace the values in the image
  out(1:initrow,1:initcol) = combined;
  
  % Do the same with the rows
  rowsums = out(1:initrow/2,1:initcol);
  rowdiffs = out(initrow/2+1:initrow,1:initcol);
  
  % Calculate and scale the result
  plus = (rowsums+rowdiffs)/sqrt4;
  mins = (rowsums-rowdiffs)/sqrt4;
  % Combine the new values
  combined = zeros(initrow,initcol);
  combined(1:2:end,:) = plus;
  combined(2:2:end,:) = mins;
  % Replace the values in the image
  out(1:initrow,1:initcol) = combined;
  
  initrow *= 2;
  initcol *= 2;
end

retval = im2uint8(out);
end