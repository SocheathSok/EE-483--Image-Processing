function [out,dict] = imLZW(im)
%
% A very simple function for LZW compression of an binary image
%
    data = dec2bin(im(:),1);
    L = length(im(:));
    dict = {"0","1"};
    buffer = "";
    out = uint16([]);
    n = 257;
    for i = 1:L,
	newbuffer = strcat(buffer,data(i));
	if ~ismember(newbuffer,dict),
	    dict{n} = newbuffer;
	    [x,m] = ismember(buffer,dict);
	    out = [out,m];
	    n = n+1;
	    buffer = data(i);
        else,
	    buffer = newbuffer;
        end
    end
    out = [out,im(end)];
end
