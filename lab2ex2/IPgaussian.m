function H = IPgaussian (D0, M, N)
% calculate the padded image dimensions based on the suggested value
% in Section 4.7.3 of the book
P = 2 * M;
Q = 2 * N;
% take u = 0, ..., P-1 and v = 0, ..., Q-1 (book Section 4.8.0)
[V, U] = meshgrid(0:P-1, 0:Q-1);
% calculate the squared distance D(u,v) of Eq. (4.8-2)
squaredist = ((U - P/2).^2 + (V - Q/2).^2);
% calculate H(u,v) based on Eq. (4.9-4)
% note that this is done with matrix operations
Hc = ones(P, Q) - e.^(- squaredist / ( 2 * D0^2));
% finally the filter is uncentered
H = ifftshift(Hc);
endfunction