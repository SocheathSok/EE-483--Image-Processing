function [r,theta] = polarmesh(im)
[rows,cols] = size(im);
ox = ceil((rows+1)/2);
oy = ceil((cols+1)/2);
[y,x] = meshgrid([1:cols]-oy,[1:rows]-ox);
r = sqrt(x.^2+y.^2);
theta = atan2(y,x);
end
