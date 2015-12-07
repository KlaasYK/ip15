% function to perform 1D Haar wavelet transform
function retval = IPdwt(x,s) 
sqrt2 = sqrt(2);
out = x;

initl = length(out);

for i = 1 : s
  % Calculate the means and details
  odds = out(1:2:initl);
  evens = out(2:2:initl);
  sums = (odds + evens);
  diffs = (odds - evens);
  % Put the new values
  out(1:initl) = [sums, diffs] / sqrt2;
  initl = initl / 2;
end

retval = out;
end