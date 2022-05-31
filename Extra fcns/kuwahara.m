function out = kuwahara(im,varargin)
  [r,c] = size(im);
  imd = im2double(im);
  if length(varargin)==0
    n = 1;
  else
    n = varargin{1};
  end
  filt = fspecial("average",2*n+1);
  m = imfilter(imd,filt,'symmetric');
  m2 = imfilter(imd.^2,filt,'symmetric');
  v = padarray(m2-m.^2,[n,n],'symmetric');
  m = padarray(m,[n,n],'symmetric');
  out = zeros(r,c);
  h = waitbar(0,'Applying Kuwahara filter...hang on');
  set(h,'Name','Kuwahara Filter Progress');
  for i = n+1:r+n
    waitbar((i-n)/r,h)
    for j = n+1:c+n
      vs = [v(i+n,j+n),v(i+n,j-n),v(i-n,j+n),v(i-n,j-n)];
      ms = [m(i+n,j+n),m(i+n,j-n),m(i-n,j+n),m(i-n,j-n)];
      # k = find(vs==min(vs));
      [mn,k] = min(vs);
      out(i-n,j-n)=mean(ms(k));
    end
  end
  close(h)
end
