
function hist = IPhistogram(img)

h = zeros(256,1);
height = rows(img);
width = columns(img);


for i = 1:height
  for j = 1:width
    val = img(i,j) + 1;
    h(val)++;
  endfor  
endfor

hist = h;