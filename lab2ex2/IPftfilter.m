function rval = IPftfilter (x, H)

M = size(x, 1);
N = size(x, 2);

% pad the image such that it has the same dimensions
% as the filter transfer function
fp = uint8(zeros(size(H)));
fp(1:M, 1:N) = x;

fp = im2double(fp);
% calculate the spectrum of the padded image
% note that shifting the center is not needed, because the filter H is also
% not centered
Fp = fft2(fp);
% applay the filter to the image
G = H .* Fp;
% convert the new spectrum to the image by taking the inverse DFT, the real
% values and unpadding it
newx = real(ifft2(G))(1:M, 1:N);
rval = im2uint8(newx);

endfunction