function out = ghomflt(im,d,l,h)
imu = im2uint8(im);
imu(find(imu==0)) = 1;
iml = log(double(imu));
imf = fftshift(fft2(iml));
boost = l+(h-l)*fspecial('gaussian',size(im),d);
imb = imf.*boost;
imi = abs(ifft2(imb));
out = exp(imi);
