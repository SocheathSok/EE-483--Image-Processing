function out=pixelize(im,n)
out=imresize(imresize(im,1/n),n,'nearest');
