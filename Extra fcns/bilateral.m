% Corrections to make it run in Matlab
% Changed # comment delimiter to % and endswitch to end - KPH

function out = bilateral(im,varargin)
  im = im2double(im);
  switch length(varargin)
    case {0}
      w = 2;sd = 2;sr = 0.04;
    case {1}
      w = varargin{1};sd = 2;sr = 0.04;
    case {2}
      w = varargin{1};sd = varargin{2};sr = 0.04;
    otherwise
      w = varargin{1};sd = varargin{2};sr = varargin{3};
  end % switch
  [r,c] = size(im);
  out = zeros(r,c);
  A = padarray(im,[w,w],'symmetric');
  G = fspecial('gaussian',2*w+1,sd);
  h = waitbar(0,'Applying bilateral filter...hang on');
  set(h,'Name','Bilateral Filter Progress');
  for i = 1+w:r+w-1
      for j = 1+w:c+w-1
	  R = A(i-w:i+w,j-w:j+w);  % region to be computed
	  H = exp(-(R-A(i,j)).^2/(2*sr^2));  % range filter depends on differences of pixel values
	  F = H.*G; % Both sets of filter weights  applied as a single mask
          out(i-w,j-w) = sum(F(:).*R(:))/sum(F(:));
      end;
      waitbar((i-w)/r,h)
  end;
  close(h);
end
      
