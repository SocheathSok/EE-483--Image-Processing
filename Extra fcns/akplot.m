function aks = akplot(N)
% ak = asubk(k,N)
% Computes coefficients a_sub_k for an N-point DCT for all k
% k is the analysis vector index
% N is the number of points in each analysis vector and the number of analysis vectors

aks = [];
n = (0:N-1)';
figure;

for k=0:N-1
    s = (k==0)+2*(k~=0);
    aks = [aks , sqrt(s/N) * cos( (2*n+1)*k*pi / (2*N) ) ];
    subplot(N/2,2,k+1);
    stem(n,aks(:,k+1));
    xlabel(strcat('a_',num2str(k)));
end % for

end % function akplot