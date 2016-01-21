function [contour] = IPfourierdescr(boundary,P)

transform = fft(boundary);
[l,~] = size(transform);

% Check P value
if (P > l/2)
   error('P too large! Must be <= length(boundary)/2'); 
end

% Loop over all values, set the high frequency
% fourier descriptor to zero.
for i = 1 : l
   if (i > (P) && i < (l-P))
      transform(i,:) = complex([0 0],0);
   end
end
contour = round(real(ifft(transform)));
end