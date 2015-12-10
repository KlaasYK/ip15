% function to perform 1D Haar wavelet transform
function retval = IPdwt(x,s) 
sqrt2 = sqrt(2);
out = x;

initl = length(out);

for i = 1 : s
  % Get the odd and even elements
  odds = out(1:2:initl);
  evens = out(2:2:initl);
   % Calculate the means and details
  sums = (odds + evens);
  diffs = (odds - evens);
  % Put the new values
  out(1:initl) = [sums, diffs] / sqrt2;
  initl /= 2;
end

retval = out;
end