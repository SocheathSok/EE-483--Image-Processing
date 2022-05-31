function B = bilateral2(A,varargin)
    switch length(varargin)
    case {0}
      w = 2; sd = 2; sr = 0.04;
    case {1}
      w = varargin{1}; sd = 2; sr = 0.04;
    case {2}
      w = varargin{1}; sd = varargin{2}; sr = 0.04;
    otherwise
      w = varargin{1}; sd = varargin{2}; sr = varargin{3};
  endswitch
  h = waitbar(0,'Applying bilateral filter...');
  set(h,'Name','Bilateral Filter Progress');
  [X,Y] = meshgrid(-w:w,-w:w);
  G = exp(-(X.^2+Y.^2)/(2*sd^2));
  dim = size(A);
  B = zeros(dim);
  for i = 1:dim(1)
    for j = 1:dim(2)
       % Extract local region.
       iMin = max(i-w,1);
       iMax = min(i+w,dim(1));
       jMin = max(j-w,1);
       jMax = min(j+w,dim(2));
       I = A(iMin:iMax,jMin:jMax);
     
       % Compute Gaussian intensity weights.
       H = exp(-(I-A(i,j)).^2/(2*sr^2));
     
       % Calculate bilateral filter response.
       F = H.*G((iMin:iMax)-i+w+1,(jMin:jMax)-j+w+1);
       B(i,j) = sum(F(:).*I(:))/sum(F(:));          
   end
   waitbar(i/dim(1),h);
end

% Close waitbar.
close(h);
