function er = IPerode (x, b)
  xd1 = size(x, 1);
  xd2 = size(x, 2);
  bd1 = size(b, 1);
  bd2 = size(b, 2);
  % pad the image
  a = zeros(size(x) + 2 * size(b));
  a(bd1+1:(bd1 + xd1), bd2+1:(bd2 + xd2)) = x;
  % based on (A erode B)^c = A^c dilate B^hat
  a = ~(IPdilate(~a, flip(flip(b, 1), 2)));
  % unpad
  er = a(bd1+1:(bd1 + xd1), bd2+1:(bd2 + xd2));
end