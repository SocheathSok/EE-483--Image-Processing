function out=hb_butter(im,d,n,l,h)
% HB_BUTTER(IM,D,O,N) creates a high-boost Butterworth filter of the same size
% as image IM, with cutoff D, lowgain L, highgain H, and order N.
%
% Use:
%   x=imread('cameraman.tif');
%   l=hb_butter(x,25,2,0.5,2);
%

out=l+(h-l)*hbutter(im,d,n);
