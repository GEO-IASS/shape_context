% expend image that has less than 200 points to larger image
function [expend_image]=re_shape(A,n_point);
expend_image = A;
while sum(sum(expend_image)) < n_point,
    expend_image = imresize(expend_image,2,'bilinear');
end
