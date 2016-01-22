function im = IPMarrHildreth (x, sigma)
  fx = double(x);
  N = ceil(6*sigma);
  % correct for meshgrid result size
  if (mod(N,2) == 1)
    N = N - 1;
  end
  [U, V] = meshgrid(-N/2:N/2, -N/2:N/2);
  % calculate a gaussian filter
  rs = (U .* U + V .* V)/(2*sigma^2);
  g = (1/(2*pi*sigma^2))*e.^-rs;
  % pad the image
  xd1 = size(x, 1);
  xd2 = size(x, 2);
  bd1 = size(g, 1);
  bd2 = size(g, 2);
  a = zeros(size(x) + 2 * size(g));
  a(bd1+1:(bd1 + xd1), bd2+1:(bd2 + xd2)) = fx;
  %% apply the gaussian filter
  a = conv2(a, g, 'same');
  %% compute the Laplacian
  a = conv2(a, [1 1 1; 1 -8 1; 1 1 1], 'same');
  % unpad
  fx = a(bd1+1:(bd1 + xd1), bd2+1:(bd2 + xd2));
  %% detect zero crossings
  % prepare output image
  im = zeros(size(x), 'logical');
  % shift the result and pad edges with nan
  nr = size(fx, 1);
  nc = size(fx, 2);
  x_u = [fx(2:nr, :); NaN([1 nc])];
  x_d = [NaN([1 nc]); fx(1:(nr - 1), :)];
  x_l = [fx(:, 2:nc) NaN([nr 1])];
  x_r = [NaN([nr 1]) fx(:, 1:(nc - 1))];
  x_ul = [x_u(:, 2:nc) NaN([nr 1])];
  x_ur = [NaN([nr 1]) x_u(:, 1:(nc - 1))];
  x_dl = [x_d(:, 2:nc) NaN([nr 1])];
  x_dr = [NaN([nr 1]) x_d(:, 1:(nc - 1))];
  % compute differences in the four directions
  d_ud = abs(x_u - x_d);
  d_lr = abs(x_l - x_r);
  d_x1 = abs(x_ul - x_dr);
  d_x2 = abs(x_ur - x_dl);
  % calculate the threshold based on maximum value of the absolute differences
  mud = max(max(d_ud));
  mlr = max(max(d_lr));
  mx1 = max(max(d_x1));
  mx2 = max(max(d_x2));
  mv = max([mud mlr mx1 mx2]);
  t = 0.15 * mv;
  % check zero crossings
  im = (((x_u < 0 & x_d > 0)   | (x_u > 0 & x_d < 0))   & d_ud > t) | ...
        (((x_l < 0 & x_r > 0)   | (x_l > 0 & x_r < 0))   & d_lr > t) | ...
        (((x_ul < 0 & x_dr > 0) | (x_ul > 0 & x_dr < 0)) & d_x1 > t) | ...
        (((x_ur < 0 & x_dl > 0) | (x_ur > 0 & x_dl < 0)) & d_x2 > t);
end