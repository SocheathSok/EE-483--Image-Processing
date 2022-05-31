function out = polar2im(im,r,theta)
[rows,cols] = size(im);
ox = ceil((rows+1)/2);
oy = ceil((cols+1)/2);
x = r.*cos(theta);
y = r.*sin(theta);
xx = clip(round(x)+ox,1,rows);
yy = clip(round(y)+oy,1,cols);
out = im(sub2ind(size(im),xx,yy));
end

