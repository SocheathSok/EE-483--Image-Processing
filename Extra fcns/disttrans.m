function res=disttrans(image,mask)
%
% This function implements the distance transform by applying MASK to
% IMAGE, using the two step algorithm with "forward" and "backwards" masks.
%
backmask = rot90(rot90(mask));
[mr,mc] = size(mask);
if (mod(mr,2)==0 || mod(mc,2)==0) then
     error('The mask must have odd dimensions.')
     end;
[r,c] = size(image);
nr = (mr-1)/2;
nc = (mc-1)/2;
image2 = padarray(image,[nr,nc]);%,'replicate');

%
% This is the first step; replacing foreground values with 0 and other values
% with infinity
%
image2(find(image2==0))=Inf;
image2(find(image2==1))=0;
%
% Forward pass
%
for i=nr+1:nr+r,
  for j=nc+1:nc+c,
    temp = image2(i-nr:i+nr,j-nc:j+nc)+mask;
    image2(i,j) = min(temp(:));
  end;
end;
%
% Backward pass
%
for i=r+nr:-1:nr+1,
  for j=c+nc:-1:nc+1,
    temp = image2(i-nr:i+nr,j-nc:j+nc)+backmask;  
    image2(i,j) = min(temp(:));
  end;
end;

res=image2(nr+1:r+nr,nc+1:c+nc);

end
