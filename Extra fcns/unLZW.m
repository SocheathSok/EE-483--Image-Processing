% Local Variables:
% mode: Octave
% End:
function out = unLZW(code)
%
% A very simple function for LZW decompression of strings of uppercase letters.
%
  L = length(code);
  dict = mat2cell(char(65:90),1,ones(26,1));
  buffer = "";
  out = dict{code(1)};
  n = 27;
  buffer = dict{code(1)};
  for i = 2:L
    c = code(i);
    if c <= length(dict)
      entry = dict{c};
    elseif c == length(dict)+1
      entry = strcat(buffer,buffer(1));
    else
      error('Bad compressed code');
    end
    out = strcat(out, entry);
    dict{n} = strcat(buffer,entry(1));
    n = n+1;
    buffer = entry;
  end
end
