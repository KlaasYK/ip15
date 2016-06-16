x = imread('../images/vase.tif');
b = ~~[1 1 1; 1 1 1; 1 1 1];
imwrite(x, 'vase.png')
imwrite(IPgdilate(x, b), 'gdilate.png')
imwrite(IPgerode(x, b), 'gerode.png')
imwrite(IPgdilate(IPgerode(x, b), b), 'gopening.png')
imwrite(IPgerode(IPgdilate(x, b), b), 'gclosing.png')