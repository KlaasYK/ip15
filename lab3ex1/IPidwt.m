% function to perform 1D Haar wavelet transform
function retval = IPidwt(x,s) 
sqrt2 = sqrt(2);
out = x;

% Determine the initial length
initl = length(x) / (2^(s-1));

for i = 1 : s
  % Retrieve the sums and the differences
  sums = out(1:initl/2);
  diffs = out(initl/2+1:initl);
  % Calculate and scale the result
  plus = (sums+diffs)/sqrt2;
  mins = (sums-diffs)/sqrt2;
  % Combine the new values
  combined = zeros(initl,1);
  combined(1:2:end) = plus;
  combined(2:2:end) = mins;
  % Store them in the output matrix
  out(1:initl) = combined;
  % Increase the length or the next iteration
  initl *= 2;
end

retval = out;
end