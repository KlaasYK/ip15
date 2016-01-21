function [contour] = IPfourierdescr(boundary,P)

transform = fft(boundary);
[l,~] = size(transform);

% Check P value
if (P > l/2)
   error('P too large! Must be <= length(boundary)/2');
end

% Loop over all values, set the high frequency
% fourier descriptors to zero.
for i = P : (l-P)
      transform(i,:) = complex([0 0],0);
end
contour = round(real(ifft(transform)));
end
