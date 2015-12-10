% input vector
x = [1,4,-3,0]
% Wavelet Transform
y = IPdwt(x,2)
% Inverse wavelet transform (cast to integer)
z = int32(IPidwt(y,2))
% Difference
diff = x-z
