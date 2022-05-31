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
## @deftypefn {Function File} @var{out}= fftconvol(@var{im},@var{f})
## Computes a convolution of image @var{im} with filter @var{f}, using
## the FFT.
## @end deftypefn

## Author:      
## Date:        

function out=fftconvol(im,f)
fil=zeros(size(im));
fs=size(f);
fil(1:fs(1),1:fs(2))=f;
imf=ifft2(fft2(im).*fft2(fil));
out=round(abs(imf));
endfunction
    
