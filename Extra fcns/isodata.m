function I = isodata(im)
   m = double(max(im(:)));
   n = double(min(im(:)));
   t = (m+n)/2;
   d = 2;
   while d > 0.5
     im1 = im.*(im>t);
     im2 = im.*(im<=t);
     m = sum(im1(:))/nnz(im1);
     n = sum(im2(:))/nnz(im2);
     t1 = (m+n)/2;
     disp([m,n,t1])
     d = abs(t-t1);
     t = t1;
   I = t1;
   end
