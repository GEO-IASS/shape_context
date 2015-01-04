A_1 = imread('/Users/kshen4/Dropbox/kaggle_shared/chuyao/data/test/1.jpg');
A_1 = im2bw(A_1);
A_2 = imread('/Users/kshen4/Dropbox/kaggle_shared/chuyao/data/test/127923.jpg');
A_2 = im2bw(A_2);
B_1 = random_sample(A_1);
B_2 = random_sample(A_2);
[p_1,q_1] = find(B_1==0);
[p_2,q_2] = find(B_2==0);
x_1 = [p_1,q_1];
x_2 = [p_2,q_2];
[circle_center_1, min_circle_length_1] = minboundcircle(p_1,q_1);
[circle_center_2, min_circle_length_2] = minboundcircle(p_2,q_2);
cost_matrix1 = log_polar(x_1,circle_center_1,min_circle_length_1);
cost_matrix2 = log_polar(x_2,circle_center_2,min_circle_length_2);

% subplot(2,2,1), imshow(B_1)
% subplot(2,2,2), imshow(B_2)
% subplot(2,2,3), imshow(cost_matrix1,[0 max(max(cost_matrix1))])
% subplot(2,2,4), imshow(cost_matrix2,[0 max(max(cost_matrix2))])
shape_context_cost1 = (chi_square(cost_matrix1,cost_matrix2));
shape_context_cost2 = cost2(x_1,x_2,circle_center_1,circle_center_2);
shape_context_cost_total = shape_context_cost1*0.005 + shape_context_cost2;
subplot(2,2,1),imshow(shape_context_cost1,[0 max(max(shape_context_cost1))])
subplot(2,2,2),imshow(shape_context_cost2,[0 max(max(shape_context_cost2))])
subplot(2,2,3),imshow(shape_context_cost_total,[0 max(max(shape_context_cost_total))])
%[cost,paired_matrix] = Hungarian_homemade(shape_context_cost_total);
%[paired_matrix,cost] = Hungarian(shape_context_cost_total);
[paired_matrix,cost] = munkres(shape_context_cost_total);
subplot(2,2,4),imshow(paired_matrix)