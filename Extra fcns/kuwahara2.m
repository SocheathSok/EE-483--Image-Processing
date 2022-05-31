function out = kuwahara2(im,varargin)
  [r,c] = size(im);
  imd = im2double(im);
  if length(varargin)==0
    n = 1;
  else
    n = varargin{1};
  end
#  filt = fspecial("average",2*n+1);
#  m = imfilter(imd,filt,'symmetric');
#  v = padarray(imfilter(imd.^2,filt,'symmetric')-m.^2,[n,n],'symmetric');
#  m = padarray(m,[n,n],'symmetric');
#  tmp = zeros(r+2*n+1,c+2*n+1,5);
#  tmp(1:r,1:c,1) = v;
#  tmp(n+1:r+n,n+1:c+n,2) = v;
#  tmp(1:r,n+1:c+n,3) = v;
#  tmp(n+1:r+n,1:c,4) = v;
#  mins = min(tmp,[],3)(n+1:r+n,n+1:c+n);
#  for i = n+1:r+n
#    for j = n+1:c+n
#      vs = [v(i+n,j+n),v(i+n,j-n),v(i-n,j+n),v(i-n,j-n)];
#      ms = [m(i+n,j+n),m(i+n,j-n),m(i-n,j+n),m(i-n,j-n)];
#      k = find(vs==min(vs));
#      out(i-n,j-n)=mean(ms(k)); 
#    end
#  end
  m = padarray(imd,[n,n],'symmetric');
  b = nlfilter(m,[2*n+1,2*n+1],@kfilt);
  out = b(n+1:r+n,n+1:c+n);
end
  
function out = kfilt(bl)
  [r,c] = size(bl);
  n = ceil(r/2);
  vs = [var(bl(1:n,1:n)),var(bl(n+1:r,1:c)),var(bl(1:n,n+1:c)),var(bl(n+1:r,n+1:c))];
  ms = [mean(bl(1:n,1:n)),mean(bl(n+1:r,1:c)),mean(bl(1:n,n+1:c)),mean(bl(n+1:r,n+1:c))];
  [mn,k] = min(vs);
  out = ms(k);
end
