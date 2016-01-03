function skfr = IPskeletondecomp (x, b)

  % create the output matrix
  skfr = zeros(size(x), 'uint8');

  k = 1;
  cur = x;
  while any(any(cur)) == 1
    next = IPerode(cur, b);
    % S_k(), since next dilate b is smaller than cur
    skel = xor(cur, IPdilate(next, b));
    skfr(skel) = k;
    cur = next;
    k++;
  end
end