function [p,q]=random_sample(A)
n_point=200;
[m,n] = find(A==1);
k = size(m);
r1 = randsample(k(1),n_point);
r = sort(r1)
r
p = m(r);
q = n(r);
