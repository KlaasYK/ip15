function y = IPgdilate (x, b)
#code based on IPfilter of lab 1 ex 3

# cast to double so nan exists
x = double(x);

#get image dimensions
nr = size(x, 1);
nc = size(x, 2);

#now the shifted matrices can be computed:
x_u = [x(2:nr, :); NaN([1 nc])];
x_d = [NaN([1 nc]); x(1:(nr - 1), :)];
x_l = [x(:, 2:nc) NaN([nr 1])];
x_r = [NaN([nr 1]) x(:, 1:(nc - 1))];
x_ul = [x_u(:, 2:nc) NaN([nr 1])];
x_ur = [NaN([nr 1]) x_u(:, 1:(nc - 1))];
x_dl = [x_d(:, 2:nc) NaN([nr 1])];
x_dr = [NaN([nr 1]) x_d(:, 1:(nc - 1))];

#create a new structuring element with 0's for true and NaN for false
c = zeros(size(b));
c(~b) = nan;

#finally the value can be calculated (NaN's are ignored) by taking pairwise maxima of matrices
y = max(max(max(max(max(max(max(max(
         c(1, 1) + x_dr,  c(1, 2) + x_d), c(1, 3) + x_dl), ...
         c(2, 1) + x_r),   c(2, 2) + x),   c(2, 3) + x_l),  ...
         c(3, 1) + x_ur),  c(3, 2) + x_u), c(3, 3) + x_ul);

# cast the image back to uint8
y = uint8(y);
end