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
## @deftypefn {Function File}imssr(@var{im},@var{str},@var{wmin},@var{wmax})
## this function displays the image coded in @var{im} by invoking display.
## @var{str} is 'b', 'g' or 'p' (black and white, gray level or color)
## @var{wmin} and @var{wmax} specify the working range of your image.
## You can enter wmin=mini(m) and wmax=maxi(m) for total end-range 
## occupation.  This can also work as binarization threshold.
## @end deftypefn

## Author:      
## Date:        

function imgshow(im,str)
delete('/tmp/junk.pbm');
delete('/tmp/junk.pgm');
delete('/tmp/junk.ppm');
switch str
  case 'b' 
    range=1;
    head0='P4';
    imagefile='/tmp/junk.pbm';
  case 'g'
    range=255;
    head0='P5';
    imagefile='/tmp/junk.pgm';
  otherwise
    range=255;
    head0='P6';
    imagefile='/tmp/junk.ppm';
endswitch;
sl=length(size(im));
x=size(im)(1);
y=size(im)(2);
if (str=='p'&sl != 3) 
  error("not a color matrix\n");
endif;

ma=max(im(:));
mi=min(im(:));
aa=range/(ma-mi);
b=-aa*mi;
m=aa*im+b;
m=min(range*ones(size(m)),m);
m=max(zeros(size(m)),m);
u=fopen(imagefile,'a');
fdisp(u,[head0;'# CREATOR: Octave 3.0.3';[int2str(y) ' ' int2str(x)];int2str(ma)]);
if head0~='P1'
  fdisp(u,[int2str(y),int2str(x),int2str(ma)]);
endif;
m=round(m(:)');
switch str,
  case 'b'
    k=int(x*y/35);
    m1=m(1:k*35);
    fwrite(u,m1,"uchar",1,"native");
    if k*35<x*y
      m2=m(k*35+1:x*y);fwrite(u,m2,"uchar");
    endif;
  case 'g'
    fwrite(u,m,"uchar");
  otherwise 
    fwrite(u,m,"uchar");
endswitch;
fclose(u)
system(['display ' imagefile ' &']);

