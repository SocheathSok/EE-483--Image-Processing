function out = projection(img,theta)
% pad the image with zeros so we don't lose anything when we rotate.
[iLength, iWidth] = size(img);
iDiag = sqrt(iLength^2 + iWidth^2);
LengthPad = ceil(iDiag - iLength) + 2;
WidthPad = ceil(iDiag - iWidth) + 2;
padIMG = zeros(iLength+LengthPad, iWidth+WidthPad);
padIMG(ceil(LengthPad/2):(ceil(LengthPad/2)+iLength-1), ...
ceil(WidthPad/2):(ceil(WidthPad/2)+iWidth-1)) = img;
% loop over the number of angles, rotate 90-theta (because we can easily sum
% if we look at stuff from the top), and then add up. Don't perform any
% interpolation on the rotating.
n = length(theta);
out = zeros(size(padIMG,2), n);
for i = 1:n
tic
tmpimg = imrotate(padIMG, 90-theta(i), 'bilinear', 'crop');
out(:,i) = (sum(tmpimg))';
theta(i)
toc
end
