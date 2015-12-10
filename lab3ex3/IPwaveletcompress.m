% Function to compress an image using wavelet transform
function IPwaveletcompress(img, scale, threshold)

[width,height] = size(img);
wl = width / (2^s);
hl = height / (2^s);

% Wavelet transform
wtrans = IPdwt2(img,scale);
% TODO: scaling needed?

% Construct a matrix for the threshold
thresholdmat = threshold * ones(img); % TODO: evt aanpassen aan grijswaarde voor difference
% Matrix containing 1 for pixels above the threshold
results = img > thresholdmat;
% Perform the thresholding by elementwise multiplying
threshed = zeros(size(img));
threshed = img .*results;

% Copy the original image part (for dark values in the original
threshed(1:hl,1:wl) = wtrans(1:hl,1:wl);

% TODO: calculate the compression


% Convert it back
compressed = IPidwt2(threshed, scale);

error = compressed - img;
rmse = rms(error); % signal pkg
disp("Root mean square error:");
disp(rmse);

squared = compressed .* compressed;
errorsq = error .* error;
snr = squared / errorsq;
disp("Mean square signal to noise:");
disp(snr);

retval = compressed;

end