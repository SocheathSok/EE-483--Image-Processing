% Local Variables:
% mode: Octave
% End:
function [out,dict] = LZW(data)
%
% A very simple function for LZW compression of strings of uppercase letters.
%
    L = length(data);
    dict = mat2cell(char(65:90),1,ones(26,1));
    buffer = "";
    out = [];
    n = 27;
    for i = 1:L,
	newbuffer = strcat(buffer, data(i));
	if ~ismember(newbuffer,dict),
	    dict{n} = newbuffer;
	    disp(cstrcat(newbuffer,' ',num2str(n)))
	    [x,m] = ismember(buffer,dict);
	    out = [out,m];
	    n = n+1;
	    buffer = data(i);
        else,
	    buffer = newbuffer;
        end
    end
    [x,m] = ismember(data(end),dict);
    out = [out,m];
end
