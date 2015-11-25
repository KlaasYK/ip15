function out = IPresize(img,factor)

if (factor < 0)
  factor *= -1;
  new = uint8(zeros(size(img)/factor));
  
  for i = 1 : columns(new)
    for j = 1 : rows(new)
       new(j,i) = img(j*factor,i*factor);
    endfor
  endfor
else 
  new = uint8(zeros(size(img)*factor));
  % because matlabs starts at 1....
  climit = columns(new)-factor;
  rlimit = rows(new)-factor;  
  for i = 1 : climit
    for j = 1 : rlimit
      new(j,i) = img(floor(j/factor)+1,floor(i/factor)+1);
    endfor
  endfor
endif

out = new;