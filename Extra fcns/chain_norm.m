function out = chain_norm(cc)
    N = length(cc);
    z = zeros(N);
    for i = 1:N
	z(i,:) = circshift(cc',i)';
    end
    zs = sortrows(z);
    out = uint8(zs(1,:));
end
