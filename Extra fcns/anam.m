function out = anam(im,a,b)
  [r,c]=size(im);
  [j,i] = meshgrid(1:r,1:c);
  d = max(max(sqrt((i-a).^2+(j-b).^2)));
  out=zeros(ceil(d),361);
  for i = 1:r
    for j = 1:c
      ia = a-i;
      jb = j-b;
      out(floor(sqrt(ia^2+jb^2))+1,atand(ia,jb)+1)=im(i,j);
    end
  end


