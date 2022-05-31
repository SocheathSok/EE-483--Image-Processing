function hexdump(filenm, n)
% hexdump(filenm, n)
% Print the first n bytes of a file in hex and ASCII.
fid = fopen(filenm, 'r');
if (fid<0) disp(['Error opening ',filenm]); return; end;
nread = 0;
while (nread < n)
    width = 16;
    [A,count] = fread(fid, width, 'uchar');
    nread = nread + count;
    if (nread>n) count = count - (nread-n); A = A(1:count); end;
    hexstring = repmat(' ',1,width*2);
    hexstring(1:2*count) = sprintf('%02x',A);
    hexdisp = repmat(' ',1,40);
    for i = 1:idivide(count,2)
        hexdisp(5*i-4:5*i-1) = hexstring(4*i-3:4*i);
    end				   
    ascstring = repmat('.',1, count);
    idx = find(double(A)>=32 & double(A)<=126);
    ascstring(idx) = char(A(idx));
    fprintf('%s:  %s |%s|\n', num2str(dec2hex(nread-16,6)), hexdisp, ascstring);
end;
fclose(fid);
