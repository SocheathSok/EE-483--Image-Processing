function out = homfilt2(im,d,n,a)
u = im2uint8(im);
u(find(u==0)) = 1;
l = log(double(u));
ft = fftshift(fft2(l));
f = (a-1)+a*hbutter(im,d,n);
b = f.*ft;
ib = abs(ifft2(b));
out = exp(ib);
