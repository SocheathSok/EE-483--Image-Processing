function [out,dict] = imLZW(im)
%
% A very simple function for LZW compression of an image
%
    data = dec2hex(im(:),2);
    L = length(im(:));
    dict = mat2cell(dec2hex([0:255],2),ones(256,1),2);
    buffer = "";
    out = uint16([]);
    n = 257;
    for i = 1:L,
	newbuffer = strcat(buffer,data(i,:));
	if ~ismember(newbuffer,dict),
	    dict{n} = newbuffer;
	    [x,m] = ismember(buffer,dict);
	    out = [out,m];
	    n = n+1;
	    buffer = data(i,:);
        else,
	    buffer = newbuffer;
        end
    end
    out = [out,im(end)];
end

# find sum of all code lengths as binary: sum(ceil(log2(out)))