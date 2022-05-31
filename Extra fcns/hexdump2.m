function hexdump2(filenm, num)
% hexdump(filenm, num)
% Print the first num bytes of a file in hex and ASCII.
fid = fopen(filenm, 'r');
if (fid<0) disp(['Error opening ',filenm]); return; end;
A = fread(fid,num,'uchar');  % Decimal vaules of all bytes
asc = repmat('.',1,num);     %% These three lines produce  
idx = find(A>=32 & A<=126);  %% (Printable) ascii values 
asc(idx) = char(A(idx));     %% of bytes
n = ceil(num/16);
extr = mod(-num,16); % number of extra bytes needed for a multiple of 16
asc = [asc,repmat(' ',1,mod(-num,16))]; % now a multiple of 16, ending in spaces
h = dec2hex(A);
h = [h;repmat(' ',extr,2)]; % also a multiple of 16
for i = 0:n-1  % Here is where the print/display happens
  L = [num2str(dec2hex(i*16,6)),': '];
  for j = 1:8
    L = [L,reshape(h(16*i+2*j-1:16*i+2*j,:)',1,4),' '];
    end
    L = [L,' |',asc(16*i+1:16*i+16),'|'];
  disp(L)
end
fclose(fid);
