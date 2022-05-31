function out = circ(k)
  [x,y] = meshgrid(-k:k,-k:k);
  out = x.^2+y.^2<k^2;
end
