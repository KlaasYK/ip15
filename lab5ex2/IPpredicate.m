function flag = IPpredicate(region)

  % set the boundary (zero values) to a value in the sky
  % this prevent the black line on the side
  boundary = zeros(size(region));
  boundary = region == boundary;
  boundary = boundary .* 128;
  
  % fix the boundary
  region += boundary;
  
  % 107 till 168 grey levels for the sky
  low = ones(size(region)) * 100;
  high = ones(size(region)) * 180;
  
  highpass = region > low;
  lowpass = region < high;
 
  diff = highpass .- lowpass;
  if (sum(sum(diff)) == 0)
    flag = true;
  else
    flag = false;
  end
end