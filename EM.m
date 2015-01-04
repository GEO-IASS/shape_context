function [M] = EM(H,K,tau);
[n,m] = size(H);
[c,T,phi,A_new] = initial(H,K);
delta = Inf;
while (delta >= tau),
    %M-step
    A = A_new;
    c = sum(A)/n;
    for i = 1:K,
        B_temp = bsxfun(@times,test,test2);
        B_vector = sums(B_temp);
        B_vector = B_vector/sum(B_vector);
        T(i,:) = B_vector
    end
    %M_step
    phi = exp(H*(log(T)).');
    A_temp = bsxfun(@times,c.',phi);
    A_rowSum = 1./sum(A_temp,2);
    A = bsxfun(@times,A_rowSum,A_temp);
    
end

M = zeros(1,n);
for i=1:n,
    max_temp = max(A(i,:));
    M(1,i) = find(A(i,:)==max_temp);
end


function [c,T,phi,A] = initial(H,K);
[n,m] = size(H);
temp = randsample(10,K);
T = ones(K,m)./m;
for i = 1:K,
    temp2 = randsample(100,m);
    T(i,:) = temp2/sum(temp2);
end
phi = exp(H*(log(T)).');
c = [temp];
A_temp = bsxfun(@times,c.',phi);
A_rowSum = 1./sum(A_temp,2);
A = bsxfun(@times,A_rowSum,A_temp);

