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
## @deftypefn {Function File} @var{out}= immsr(@var{im},@var{sigma1},@var{sigma2}...)
## Computes a multiscale retinex enhancement of image @var{im}, using
## gaussian filters @var{g1}, @var{g2},... of scales @var{sigma1}, @var{sigma2},... 
## according to the formula
##
## log(@var{im})-log(@var{im} * @var{g}i)
##
## where the "*" symbol represents convolution, and averaging the results to
## obtain the result @var{out}.  Example (where im is a true color RGB image):
## @end deftypefn
## @example
## imr=imssr(im,20,40,70);
## imshow(im2uint8(imr/3))
## @end example

function out=immsr(im,varargin)
if nargin==1
  error('Must have at least one scale')
else
  sigma=varargin{1};
  out=imssr(im,sigma);
  if nargin>=3
    for i=2:nargin-1
      sigma=varargin{i};
      out=out+imssr(im,sigma);
    endfor;
    out=out/(nargin-1);
  endif;
#  for i=1:3
#    out(:,:,i)=alpha(im,i)*out(:,:,i);
#  endfor;
endif;
endfunction;
