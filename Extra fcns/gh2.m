function out = gh2(image)
  gh_lut = makelut(@gh_fun,3);
  [r,c] = size(image);
  image2 = repmat([1 2;2 1],r/2,c/2).*image;
  prev = image2;
  g = applylut(image2>0, gh_lut);
  curr = prev .* ~((prev==1) & (g==1));
  while true,
    g = applylut(curr>0, gh_lut);
    curr = curr .* ~((curr==2) & (g==1));
    g = applylut(curr>0,gh_lut);
    curr = curr .* ~((curr==1) & (g==1));
    if isequal(prev,curr),
      break;
    end
    prev = curr;
  end
  out = curr>0;
end

function out = gh_fun(x)
  n = x;
  n(5) = 0;
  B = sum(n(:));
  X = max(max(bwlabel(n,8)));
  S = n(2)*n(4)*n(6)*n(8);
  out = (B>=2 & X==1 & S==0);
end
