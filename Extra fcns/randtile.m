function out = randtile(im,k,n)
% RANDTILE(im,k,n)
% k is size of random movement; n is size of each tile
[rows,cols] = size(im);
out = zeros(rows+2*k,cols+2*k);
xsize = floor(rows/n);
ysize = floor(cols/n);
for i = 0:floor(rows/n)-1
    for j = 0:floor(cols/n)-1
        xi = randi(2*k+1)-k-1;
        yi = randi(2*k+1)-k-1;
        xo = k+1+i*n;
        yo = k+1+j*n;
        out(xo+xi:xo+xi+n-1,yo+yi:yo+yi+n-1) = im(xo-k:xo+n-k-1,yo-k:yo+n-k-1);
    end
end
end
