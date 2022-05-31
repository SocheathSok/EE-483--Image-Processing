function out = rand_circ(varargin)
  switch length(varargin)
    case{0}
      out = zeros(256);lowRAD = 10;hiRAD = 80;N=10;
    case{1}
      if length(varargin{1})==1
         out = zeros(varargin{1});
      else
         out = zeros(varargin{1}(1),varargin{1}(2));
      end
      lowRAD = 10;hiRAD = 80;N=10;
    case{2}
      switch length(varargin{1})
        case{0}
          out = zeros(256);
        case{1}
          out = zeros(varargin{1});
        case{2}
          out = zeros(varargin{1}(1),varargin{1}(2));
      endswitch
      if length(varargin{2})==1
         lowRAD = varargin{2};hiRAD = varargin{2};
      else
         lowRAD = varargin{2}(1);hiRAD = varargin{2}(2);
      end
      N = 10;
    case{3}
      switch length(varargin{1})
        case{0}
          out = zeros(256);
        case{1}
          out = zeros(varargin{1});
        case{2}
          out = zeros(varargin{1}(1),varargin{1}(2));
      endswitch
      switch length(varargin{2})
        case{0}
          lowRAD = 10;hiRAD = 80;
        case{1}
          lowRAD = varargin{2};hiRAD = varargin{2};
        case{2}
          lowRAD = varargin{2}(1);hiRAD = varargin{2}(2);
      endswitch
      N = varargin{3};
    endswitch
  
  i = 0;
  [zr,zc] = size(out);
  if (lowRAD+hiRAD)^2*N*pi > 4*zr*zc
    error('Circles are too big, or too numerous.  Try with smaller N, or smaller radii.')
  end
  lowRAD;
  hiRAD;
  N;
  area = zr*zc;
  while (i < N) && (lowRAD <= hiRAD)
%    h = waitbar(0,'Constructing random circles and seeing if they fit...hang on');
%    set(h,'Name','Random Circles');
%    waitbar(i/N,h)
    rad = randi([lowRAD,hiRAD]);
    a = randi([rad+1,zr-rad-1]);
    b = randi([rad+1,zc-rad-1]);
    test_circ = zeros(zr,zc);
    new_circ = zeros(zr,zc);
    test_circ(a-rad:a+rad,b-rad:b+rad) = circ(rad);
    new_circ(a-rad+1:a+rad-1,b-rad+1:b+rad-1) = circ(rad-1);
    if isequal(zeros(zr,zc), test_circ & out)
       out  = out | new_circ;
       area = area-pi*rad^2;
       hiRAD = min(hiRAD, floor(sqrt(area/pi)));
       i = i+1;
    end
  endwhile

end
