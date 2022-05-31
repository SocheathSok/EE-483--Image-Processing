function out=rle(image)
%
%  RLE(IMAGE) produces a vector containing the run-length encoding of
%  IMAGE, which should be a binary image.   The image is set out as a long
%  row, and the code contains the number of zeros,  followed by the number
%  of ones, alternating.
%
%  Example:
%
%    rle([1 1 1 0 0;0 0 1 1 1;1 1 0 0 0])
%
%    ans = 
%      
%        0    3    4    5    3
%
L=prod(size(image));
im=reshape(image',1,L);
x=1;
out=[];
while L ~= 0,
  temp=min(find(im == x));
  if isempty(temp),
    out=[out L];
    break
  end;
  out=[out temp-1];
  x=1-x;
  im=im(temp:L);
  L=L-temp+1;
end;
