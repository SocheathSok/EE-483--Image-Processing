function out = zs(image)
  lut_odd = makelut(@zs_odd,3);
  lut_even = makelut(@zs_even,3);
  previous = image;
  current = image & ~applylut(image,lut_odd);
  while true,
    current = current & ~applylut(current,lut_even);
    if isequal(previous,current),
      break;
    end
    current = current & ~applylut(current,lut_odd);
    if isequal(previous,current),
      break;
    end
  previous = current;
  end
  out = current;
end

function out = zs_odd(x)
  t = x;
  t(5) = 0;
  B = sum(t(:));
  X = max(max(bwlabel(t,4)));
  out = (B>=2) & (B<=6) & (X==1);
  out = out & (t(6)==0 | t(8)==0 | (t(2)==0 & t(4)==0));
end

function out = zs_even(x)
  t = x;
  t(5)=0;
  B = sum(t(:));
  X = max(max(bwlabel(t,4)));
  out = (B>=2) & (B<=6) & (X==1);
  out = out & (t(2)==0 | t(4)==0 | (t(6)==0 & t(8)==0));
end

