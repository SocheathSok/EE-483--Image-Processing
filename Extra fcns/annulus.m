function out = annulus(r1,r2)
  r3 = max(r1,r2);
  r4 = min(r1,r2);
  [x,y] = meshgrid(-r3:r3,-r3:r3);
  out1 = (x.^2+y.^2>r4^2);
  out2 = (x.^2+y.^2<=r3^2);
  out = out1 & out2;
end
