function out = decomp(k)
if (k==1)
    out = [1 1];
else
    out = [decomp(k-1) 2^(k-1)];
end
end
