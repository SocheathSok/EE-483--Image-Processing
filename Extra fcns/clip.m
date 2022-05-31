function out = clip(x,y,z)
  out = x;
  out(find(out<y))=y;
  out(find(out>z))=z;