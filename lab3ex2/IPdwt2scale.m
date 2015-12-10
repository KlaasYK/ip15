function retval = IPdwt2scale(x, j)
% calculate the dwt with a shifted image around 0 (assumes doubles)
out = x - 0.5;
out = IPdwt2(out, j);
out = out + 0.5;

initrow = size(out, 1);
initcol = size(out, 2);

% iterate trough the levels in the image
for i = 1 : j
  mid_r = initrow / 2;
  mid_c = initcol / 2;

  % contrast stretch the horizontal details
  w = out(1:mid_r, mid_c+1:initcol);
  out(1:mid_r, mid_c+1:initcol) = (w - min(min(w))) * (1 / (max(max(w)) - min(min(w))));

  % contrast stretch the vertical details
  w = out(mid_r+1:initrow, 1:mid_c);
  out(mid_r+1:initrow, 1:mid_c) = (w - min(min(w))) * (1 / (max(max(w)) - min(min(w))));

  % contrast stretch the diagonal details
  w = out(mid_r+1:initrow, mid_c+1:initcol);
  out(mid_r+1:initrow, mid_c+1:initcol) = (w - min(min(w))) * (1 / (max(max(w)) - min(min(w))));
  
  initrow = mid_r;
  initcol = mid_c;
end

% contrast stretch the approximation image
w = out(1:initrow, 1:initcol);
out(1:initrow, 1:initcol) = (w - min(min(w))) * (1 / (max(max(w)) - min(min(w))));

retval = im2uint8(out);
endfunction