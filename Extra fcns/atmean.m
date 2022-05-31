function out = atmean(r)
%
%  implements alpha-trimmed mean filter
%
  s = sort(r(:));
  d = floor(length(s)/4);
  out = mean(s(1+d:end-d));
end
