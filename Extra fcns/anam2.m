function out = anam2(im,a,b)
  [r,c]=size(im);
  [j,i] = meshgrid(1:r,1:c);
  d = ceil(max(max(sqrt((i-a).^2+(j-b).^2))));
  out=zeros(d,361);
  imp = impad(im,[d,d],[d,d]);
  for i = 0:360
    t = zeros(d,1);
    for j = 1:d
      t(i) = imp(floor(a+j*cosd(i))+1,floor(b+j*sind(i))+1);
    out(:,i+1) = t;
    end
  end
  
	  
