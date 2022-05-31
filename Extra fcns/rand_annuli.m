function out = rand_annuli()
  out = zeros(256);
  while (i < 10) 
%    h = waitbar(0,'Constructing random circles and seeing if they fit...hang on');
%    set(h,'Name','Random Circles');
%    waitbar(i/N,h)
    a = randi([2,8])*26;
    b = randi([2,8])*26;
    r = randi([10,40]);
    new_ring = zeros(256);
    w = randi([5,10]);
    new_ring(a-r-w:a+r+w,b-r-w:b+r+w) = annulus(r,r+w);
%    if isequal(zeros(zr,zc), test_circ & out)
       out  = out | new_ring;
       i = i+1;
    %end
  endwhile

end
