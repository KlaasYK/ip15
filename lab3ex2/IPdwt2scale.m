function retval = IPdwt2scale(x, j)
out = x;

initrow = size(out, 1);
initcol = size(out, 2);

for i = 1 : j
  mid_r = initrow / 2;
  mid_c = initcol / 2;

  w = out(1:mid_r, mid_c:initcol);
  out(1:mid_r, mid_c:initcol) = (w - min(min(w))) * (255 / (max(max(w)) - min(min(w))))+1;
  max(max(out(1:mid_r, mid_c:initcol)))

  w = out(mid_r:initrow, 1:mid_c);
  out(mid_r:initrow, 1:mid_c) = (w - min(min(w))) * (255 / (max(max(w)) - min(min(w))))+1;

  w = out(mid_r:initrow, mid_c:initcol);
  out(mid_r:initrow, mid_c:initcol) = (w - min(min(w))) * (255 / (max(max(w)) - min(min(w))))+1;
  
  initrow = mid_r;
  initcol = mid_c;
end

w = out(1:initrow, 1:initcol);
out(1:initrow, 1:initcol) = (w - min(min(w))) * (255 / (max(max(w)) - min(min(w))));

retval = out;
endfunction