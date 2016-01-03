function di = IPdilate (x, b)
  bhat = flip(flip(b, 1), 2);
  di = conv2(x, bhat, "same") > 0;
end