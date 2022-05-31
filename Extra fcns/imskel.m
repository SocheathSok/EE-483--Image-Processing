function skel = imskel(image,kernel)
% IMSKEL - Calculates the skeleton of IMAGE using kernel KERNEL
% 
skel=zeros(size(image));
e=image;
while (any(e(:))),
    o=imopen(e,kernel);
    skel=skel | (e&~o);
    e=imerode(e,kernel);
end
