% make a circular blob
function retval = makeblob(radius)
  out = ones(2*radius+1);
  for i=1 : (2*radius+1)
    for j=1 : (2*radius+1)
      if (sqrt(i*i+j+j) < 1.0)
        out(i,j) = 0;
      end
    end
  end
  retval = out;
end