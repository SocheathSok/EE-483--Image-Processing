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
## @deftypefn {Function File} @var{out}= imssr(@var{im},@var{sigma})
## Computes a single scale retinex enhancement of image @var{im}, using
## a gaussian filter @var{g} of scale @var{sigma}, according to the formula
##
## out=log(@var{im})-log(@var{im} * @var{g})
##
## where the "*" symbol represents convolution.
## @end deftypefn

## Author:      
## Date:        

function out=imssr(im,sigma)
[x,y]=meshgrid(-sigma:sigma);
g=exp(-(x.^2+y.^2)/(sigma^2));
if (length(size(im))==2)
  out=mat2gray(log(im+1)-log(fftconvol(im,g)+1));
else
  out=zeros(size(im));
  for i=1:3
    out(:,:,i)=mat2gray(log(im(:,:,i)+1)-log(fftconvol(im(:,:,i),g)+1));
  endfor
endif
endfunction
    
