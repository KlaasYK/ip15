function re = IPskeletonrecon (x, b)

  % create the output matrix
  re = zeros(size(x), 'logical');

  re(x == 1) = 1;
  % extract the skeleton subset counts
  maxk = max(x(x > 0));
  if maxk > 1
    for k = 2:maxk
      tmp = zeros(size(x), 'logical');
      tmp(x == k) = 1;
      for i = 1:(k - 1)
        tmp = IPdilate(tmp, b);
      end
      re = or(re, tmp);
    end
  end
end