## Copyright (C) 2008 Alasdair McAndrew
##
## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 2 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program; If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {Function File} @var{I}= harris(@var{im}, @var{min_N}, @var{max_N})
## Determines the corner points of @var{im} by use of the Harris corner 
## detection algorithm.  This files is taken from Harris.m, a Matlab file
## by Ali Ganoun, at
##
## http://www.mathworks.com/matlabcentral/fileexchange/9272 
##
## and has been 
## adapted very slightly for Octave.  The values @var{min_N} and @var{max_N}
## are lower and upper bounds for the number of corner points to find; if 
## left out they default to 12 and 16.  For example:
## @end deftypefn
## @example
## I=harris(im);
## imshow(I)
## J=harris(im,30,40);
## figure;imshow(J)
## @end example

function I=harris(im,varargin)

I=im;
Aj=6;
## cmin=xmin-Aj; cmax=xmax+Aj; rmin=ymin-Aj; rmax=ymax+Aj;
switch length(varargin)
  case {0}
    min_N=12;max_N=16;
  case {1}
    min_N=varargin{1};max_N=min_N+6;
  otherwise
    min_N=varargin{1};max_N=varargin{2};
endswitch
sigma=2; Thrshold=20; r=6; disp=1;
dx = [-1 0 1; -1 0 1; -1 0 1]; ## The Mask 
dy = dx';

Ix = conv2(I, dx, 'same');   
Iy = conv2(I, dy, 'same');
g = fspecial('gaussian',max(1,fix(6*sigma)), sigma); ## Gaussian Filter
    
Ix2 = conv2(Ix.^2, g, 'same');  
Iy2 = conv2(Iy.^2, g, 'same');
Ixy = conv2(Ix.*Iy, g,'same');

k = 0.04;
R11 = (Ix2.*Iy2 - Ixy.^2) - k*(Ix2 + Iy2).^2;
R11=(1000/max(max(R11)))*R11;
R=R11;
ma=max(max(R));
sze = 2*r+1; 
MX = ordfilt2(R,sze^2,ones(sze));
R11 = (R==MX)&(R>Thrshold); 
count=sum(sum(R11(5:size(R11,1)-5,5:size(R11,2)-5)));
    
loop=0;
while (((count<min_N)|(count>max_N))&(loop<30))
  if count>max_N
     Thrshold=Thrshold*1.5;
  elseif count < min_N
      Thrshold=Thrshold*0.5;
  endif
  R11 = (R==MX)&(R>Thrshold); 
  count=sum(sum(R11(5:size(R11,1)-5,5:size(R11,2)-5)));
  loop=loop+1;
end
    
R=R*0;
R(5:size(R11,1)-5,5:size(R11,2)-5)=R11(5:size(R11,1)-5,5:size(R11,2)-5);
[r1,c1] = find(R);
PIP=[r1,c1];
   
Size_PI=size(PIP,1);
for r=1: Size_PI
 I(PIP(r,1)-2:PIP(r,1)+2,PIP(r,2)-2)=255;
 I(PIP(r,1)-2:PIP(r,1)+2,PIP(r,2)+2)=255;
 I(PIP(r,1)-2,PIP(r,2)-2:PIP(r,2)+2)=255;
 I(PIP(r,1)+2,PIP(r,2)-2:PIP(r,2)+2)=255;
endfor
endfunction