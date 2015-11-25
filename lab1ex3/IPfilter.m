function [retval] = IPfilter (im, mask)

#first convert image data to double
i = im2double(im);

#get image dimensions
nr = size(i, 1);
nc = size(i, 2);

#now the shifted matrices can be computed like in the following grid:
# ul | u | ur
# l | i  | r
# dl | d | dr
#note that shifts are inversely related to the coordinates (x, y) of the pixel.
#for example a shift up means the the (x, y) position in the shifted matrix
#contains the (x, y + 1) pixel.
i_u = [i(2:nr, :); i(1, :)];
i_d = [i(nr, :); i(1:(nr - 1), :)];
i_l = [i(:, 2:nc) i(:, 1)];
i_r = [i(:, nc) i(:, 1:(nc - 1))];
i_ul = [i_u(:, 2:nc) i_u(:, 1)];
i_ur = [i_u(:, nc) i_u(:, 1:(nc - 1))];
i_dl = [i_d(:, 2:nc) i_d(:, 1)];
i_dr = [i_d(:, nc) i_d(:, 1:(nc - 1))];

#finally the mask can be applied (correlation)
pim = mask(1, 1) * i_dr + mask(1, 2) * i_d + mask(1, 3) * i_dl + ...
      mask(2, 1) * i_r  + mask(2, 2) * i   + mask(2, 3) * i_l  + ...
      mask(3, 1) * i_ur + mask(3, 2) * i_u + mask(3, 3) * i_ul;
#and the values can be converted back
retval = im2uint8(pim);

endfunction