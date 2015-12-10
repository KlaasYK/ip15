% Function to compress an image using wavelet transform
function retval = IPwaveletcompress(img, scale, threshold)

[width,height] = size(img);
wl = width / (2^scale);
hl = height / (2^scale);

% Wavelet transform
wtrans = IPdwt2(img,scale);

% Construct a matrix for the threshold
thresholdmat = threshold * ones(size(img));
% Matrix containing 1 for pixels above the threshold
results = abs(wtrans) > thresholdmat;
% Perform the thresholding by elementwise multiplying
threshed = zeros(size(img));
threshed = wtrans .*results;

% Copy the original image part (for dark values in the original
threshed(1:hl,1:wl) = wtrans(1:hl,1:wl);

% Convert it back
compressed = IPidwt2(threshed, scale);

printf("Scale: %d Threshold: %f\n", scale, threshold);
error = compressed - img;
errorsq = error .* error;
rmse = sqrt(mean(mean(errorsq)));
printf("Root mean square error: %f\n",rmse);

squared = compressed .* compressed;
snr = sum(sum(squared)) / sum(sum(errorsq));
printf("Mean square signal to noise: %f\n",snr);

% Calculatute the compression
orig = entropy(im2uint8(img));
comp = entropy(im2uint8(threshed));
printf("Compress ratio: %f:1\n\n",orig/comp);


retval = compressed;

end