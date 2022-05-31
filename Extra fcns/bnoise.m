function r=bnoise(im,a)

% BNOISE adds binary salt & pepper noise to a binary image.
%
%   BNOISE(IMAGE,A) converts fraction A of the pixels of IMAGE to noise.
%   A must be between 0 and 1.



if ~isbw(im)
  error('The image must be binary.')
end;

if (nargin==1) 
  a=0.1;
elseif (a<0 | a>1)
  error('The value of noise must be between 0 and 1.')
end;

x=rand(size(im));
d1=find(x<=a/2);
d2=find(x>=1-a/2);
r=im;
r(d1)=0;
r(d2)=1;
