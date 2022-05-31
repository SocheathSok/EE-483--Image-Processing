function out = psmed8(x)
  L = x(:);
  if mod(length(L),2) == 0
      error("Must be odd length")
  endif
  n = (length(L)+1)/2;
  [tx,ty]=meshgrid(1:n);
  A = L(tx+ty-1);
  out = (max(min(A))+min(max(A)))/2;
