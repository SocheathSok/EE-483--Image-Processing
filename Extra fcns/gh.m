function out = gh(a)
[r,c] = size(a);
aa = repmat([1 2;2 1],ceil(size(a)/2));
aa = aa(1:r,1:c).*a;

N = 1;
last = aa;
previous = gh_sub(last,1);
current = gh_sub(previous,2);
while 1
  if isequal(current, last)
    break
  end;
  N = 3-N;
  last = previous;
  previous = current;
  current  =  gh_sub(current,N);
end;

current(find(current>0)) = 1;
out = current;
end

function out = eight_comps(a)
  out = min(1-a(4),max(a(7),a(8)))+...
      min(1-a(8),max(a(9),a(6)))+...
      min(1-a(6),max(a(3),a(2)))+...
      min(1-a(2),max(a(1),a(4)));
end

function out = gh_sub(a,k)

[r,c] = size(a);
out = a;

for i = 2:r-1,
  for j = 2:c-1,
    if a(i,j) == k,
      nbhd = a(i-1:i+1,j-1:j+1);
      nbhd(find(nbhd>0)) = 1;
      b = sum(nbhd(:));
      if eight_comps(nbhd)==1 && b>2,
        out(i,j) = 3;
      end;
    end;
  end;
end;

out(find(out == 3)) = 0;
end
