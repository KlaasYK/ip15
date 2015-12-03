% Read the image
x = imread('../images/characters.tif');
% Get image width and heigt
[width, height] = size(x);
% Perform the Fourier transform
spectrum = fftshift(fft2(x));
% Calculate the avarge of the image
% It can be found by taking the dc component (center of the image)
% And dividing it by the number of pixels
avg_fourier = abs(spectrum(width/2+1,height/2+1))/(width*height)
avg_mean = mean(mean(x))

% calculate the magnitude
spectrum = abs(spectrum);

% take the log value for better scaling in octave
logspectrum = log2(spectrum);
% Take note of max and min of the spectrum for image scaling
maxs = max(max(logspectrum));
mins = min(min(logspectrum));
% Scale the image for output to file
spectrumimg = uint8(floor((logspectrum - mins) / (maxs-mins) * 256));
imwrite(spectrumimg, 'spectrum.png');
% Show the log image as a figure
figure, imshow(logspectrum,[]), colormap gray
