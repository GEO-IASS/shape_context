function [B]=random_sample(A);
B = A >= 0;
[m,n] = find(A==1);
k = size(m);
n_point = 200;
random_sample = randsample(k(1),n_point);
for i=1:n_point,
    index = random_sample(i);
    B(m(index),n(index)) = 0;
end