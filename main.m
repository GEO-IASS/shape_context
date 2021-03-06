% Step1: read image into (1-0 black white) matrix
tic
A_O_1 = imread('/Users/kshen4/Desktop/train/acantharia_protist/337.jpg');
A_O_2 = imread('/Users/kshen4/Desktop/train/acantharia_protist/64.jpg');
%A_O_2 = imread('/Users/kshen4/Desktop/train/hydromedusae_shapeA/170.jpg');

%function [paired_matrix,cost]=main(A_O_1,A_O_2),
% Step2: rotate the image by PCA, the x-axis is the largest variance
A_1 = improc(A_O_1);
A_2 = improc(A_O_2);


% Step3: randomly select 200 points from image and construct new image
[p_1,q_1] = random_sample(A_1);
[p_2,q_2] = random_sample(A_2);
x_1 = [p_1,q_1];
x_2 = [p_2,q_2];

% Step4: find the center point, minimum circle radius of the image
[circle_center_1, min_circle_length_1] = minboundcircle(p_1,q_1);
[circle_center_2, min_circle_length_2] = minboundcircle(p_2,q_2);

% Step5: compute lop polar to compute shape context cost 1
cost_matrix1 = log_polar(x_1,min_circle_length_1);
cost_matrix2 = log_polar(x_2,min_circle_length_2);
% Step6: compute shape context cost 1 and shape context cost 2
shape_context_cost1 = (chi_square(cost_matrix1,cost_matrix2));
shape_context_cost2 = cost2(x_1,x_2,circle_center_1,circle_center_2);
shape_context_cost_total = shape_context_cost1*0.005 + shape_context_cost2;

toc
tic
% Step7: conduct Hungarian Algrithmn to pair points within two image and
% compute the cost value
[paired_matrix,cost] = munkres_faster(shape_context_cost_total);
%end
cost
toc
subplot(3,2,1),imshow(A_1)
subplot(3,2,2),imshow(A_2)
subplot(3,2,3),imshow(cost_matrix1,[0 30])
subplot(3,2,4),imshow(cost_matrix2,[0 30])
subplot(3,2,5),imshow(shape_context_cost1, [0 max(max(shape_context_cost1))])
subplot(3,2,6),imshow(shape_context_cost2,[0 max(max(shape_context_cost2))])
