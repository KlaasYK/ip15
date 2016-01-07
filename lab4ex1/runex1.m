x = imread('../images/nutsbolts.tif');
b = ~~[1 1 1; 1 1 1; 1 1 1];
skel = IPskeletondecomp(x, b);
recon = IPskeletonrecon(skel, b);
imwrite(recon, 'recon.png')
% check to test if any logical element differs, if equal the result should be 0
any(any(xor(recon, x)))