% Local Variables:
% mode: Octave
% End:
function out = haar(n,k)
%
% A function to compute the Haar matrix for k scale computation of size 2^n x 2^n
%
if (k==1)
    out = [kron(eye(2^(n-1)),[1 1]); kron(eye(2^(n-1)),[1 -1])];
elseif (k==2)
    out = [kron(eye(2^(n-2)),[1 1 1 1]);kron(eye(2^(n-2)),[1 1 -1 -1]); ...
         kron(eye(2^(n-1)),[1,-1])];
else
    H = [1 1;1 -1];
    for i = 2:k
        H = [kron(H,[1 1]);kron(eye(size(H,1)),[1,-1])];
    end
    d = decomp(k);
    out = kron(eye(2^(n-k)),H(1,:));
    for i = 2:length(d)
        out = [out;kron(eye(2^(n-k)),H(d(i)+1:2*d(i),:))];
    end
end
end
