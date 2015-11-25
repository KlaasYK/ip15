function [retval] = IPSobel (img)

#compute the horizontal and vertical differences
gx = IPfilter(img, [-1 -2 -1; 0 0 0; 1 2 1]);
gy = IPfilter(img, [-1 0 1; -2 0 2; -1 0 1]);

#did not check if output is bigger than uint8, should probably be done
retval = abs(gx) + abs(gy);

endfunction