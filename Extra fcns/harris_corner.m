function out = harris_corner(im,varargin)
  switch length(varargin)
    case {0}
      sigma = 1;k = 0.05;
    case {1}
      sigma = varargin{1};k = 0.05;
    otherwise
      sigma = varargin{1};k = varargin{2};
  endswitch	     
  gauss = fspecial('gaussian',max(1,fix(6*sigma)),sigma);
  sob = [1 2 1;0 0 0;-1 -2 -1];
  imx = filter2(sob,im,'same');
  imy = filter2(sob',im,'same');
  Axx = filter2(gauss,imx.^2);
  Axy = filter2(gauss,imx.*imy);
  Ayy = filter2(gauss,imy.^2);
  detA = Axx.*Ayy - Axy.^2;
  trA = Axx+Ayy;
  # out= 2*detA/(trA+1e-6);
  out = detA - k*trA.^2;
end

