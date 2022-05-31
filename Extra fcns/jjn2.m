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
## @deftypefn {Function File} @var{out}= jjn(@var{im})
## Applies Jarvis-Judice-Ninke error diffusion to an image @var{im}, which
## is assumed to be of type uint8.  
## @end deftypefn

function y = jjn2(x)
height=size(x,1);
width=size(x,2);
ed=[0 0 0 7 5;3 5 7 5 3;1 3 5 3 1]/48;
y=uint8(zeros(height,width));
z=zeros(height+4,width+4);
z(3:height+2,3:width+2)=x;
for i=3:height+2,
  for j=3:width+2,
    if z(i,j) < 128
      y(i-2,j-2) = 0;
      e = z(i,j);
    else
      y(i-2,j-2) = 255;
      e = z(i,j)-255;
    endif;
    z(i:i+2,j-2:j+2)=z(i:i+2,j-2:j+2)+e*ed;
  end
end
