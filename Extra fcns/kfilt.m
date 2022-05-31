function out = kfilt(bl)
  [r,c] = size(bl);
  n = ceil(r/2);
  vs = [var(bl(1:n,1:n)),var(bl(n+1:r,1:c)),var(bl(1:n,n+1:c)),var(bl(n+1:r,n+1:c))];
  ms = [mean(bl(1:n,1:n)),mean(bl(n+1:r,1:c)),mean(bl(1:n,n+1:c)),mean(bl(n+1:r,n+1:c))];
  [mn,k] = min(vs);
  out = ms(k);
end
