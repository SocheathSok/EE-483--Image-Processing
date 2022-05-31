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
## @deftypefn {Function File} @var{out}= dither(@var{im},@var{k})
## Performs ordered dithering (digital halftoning) on image @var{im} by comparing
## it to a Bayer matrix of size 2^@var{k} x 2^@var{k}, which is
## constructed recursively.  The output is a matrix of type uint8.
## @end deftypefn

function out=dither8(im,k)
D=[0];
for i=1:k
  D=[4*D 4*D+2;4*D+3 4*D+1];
endfor;
D=floor(256/4^k*D);
if length(size(im))==2
  s=size(im);
  sd=ceil(s/2^k);
  D2=repmat(D,sd);
  out=uint8(255*(im>D2(1:s(1),1:s(2))));
else
  s=size(im)(1:2);
  sd=ceil(s/2^k);
  D2=repmat(D,sd);
  out1=uint8(255*(im(:,:,1)>D2(1:s(1),1:s(2))));
  out2=uint8(255*(im(:,:,2)>D2(1:s(1),1:s(2))));
  out3=uint8(255*(im(:,:,3)>D2(1:s(1),1:s(2))));
  out=cat(3,out1,out2,out3);
endif;
endfunction;
