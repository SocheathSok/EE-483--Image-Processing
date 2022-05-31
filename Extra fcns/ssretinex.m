% Single-scale retinex, adapted from
%   http://au.mathworks.com/matlabcentral/fileexchange/26523
%
% Usage: ssretinex(image,hsize)
%
% where hsize is the spread of the Gaussian filter to be used

function out = ssretinex(X,hsize)
if length(size(X))==2
    imsize = size(X);
else
    imsize = size(X(:,:,1));
end
filt = fspecial('gaussian',imsize,hsize/sqrt(2));
if length(size(X))==2
    X1 = mat2gray(im2double(X))+0.05;
    Z = abs(ifft2(fft2(X1).*fft2(filt)));
    Z(find(Z==0))=0.05;
    L = log(Z);
    R = log(X1)-L;
    out = mat2gray(R);
else
    out = zeros(size(X));
    for i = 1:3
        X1 = mat2gray(im2double(X(:,:,i)))+0.01;
        Z = abs(ifft2(fft2(X1).*fft2(filt)));
        Z(find(Z==0))=0.01;
        L = log(Z);
        out(:,:,i) = mat2gray(log(X1)-L);
    end
end
end