cd('/Users/kshen4/Desktop/train/fish_larvae_myctophids/');
files=dir('*.jpg');
list = [];
n_row = 100;
n_col = 100;
for i=1:length(files)
    a = imread(files(i).name);
    A = rotate_reshape(a,n_row,n_col);
    x = reshape(A, [1, n_row*n_col]);
    list = [list; x];
    
end
covx = cov(double(list));
COEFF= pcacov(covx);
list_2 = double(list);
list_3 = bsxfun(@minus,list_2,mean(list_2));
score = abs(list_3*COEFF(:,1:3));
type = zeros(1,length(score));
for i=1:length(score),
    max_n = max(score(i,:));
    max_loc = find(score(i,:)==max_n);
    type(i) = max_loc;
end
%[Evalues, Evectors, x_mean]=PCA(list);
cd('..');