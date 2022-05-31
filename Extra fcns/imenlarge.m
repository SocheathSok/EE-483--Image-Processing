function out=imenlarge(im,n,filt)
    tmp = im;
    for i = 1:n
        [r,c] = size(tmp);
        tmp2 = zeros(2*r-1,2*c-1);
        tmp2(1:2:2*r-1,1:2:2*c-1) = tmp;
        tmp = imfilter(tmp2,filt);
    endfor
    out = tmp;