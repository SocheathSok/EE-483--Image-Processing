function res=homfilt(im,cutoff,order,lowgain,highgain)

% HOMFILT(IMAGE,FILTER) applies homomorphic filtering to the image IMAGE
% with the given parameters

u=im2uint8(im);

u(find(u==0))=1;
l=log(double(u));
ft=fftshift(fft2(l));
f=hb_butter(im,cutoff,order,lowgain,highgain);
b=f.*ft;
ib=abs(ifft2(b));
res=exp(ib);
