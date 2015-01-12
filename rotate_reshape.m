function [result,B]=rotate_reshape(A,n_row,n_col)
    [m,n] = find(A<=150);
    x = [m,n];
    covx = cov(x);
    COEFF= pcacov(covx);
    slope_1 = -COEFF(1)/COEFF(2);
    angle_1 = -(atan(slope_1)/pi*180);
    result = imrotate_white(A,angle_1);
    B = edge(medfilt2(result,[2 2]),'canny',[0.0025 0.003]); %%
    s=size(B);
    B(s(1)-1,:)=0;
    B(:,s(2)-1)=0;
    [p,q] = find(B==1);
    result = result(min(p):max(p),min(q):max(q));
%    result = imresize(result, [n_row n_col], 'bilinear');
%    [center, r] = minboundcircle(p,q)
%    result = result(center(1)-r:center(1)+r,center(2)-r, center(2)+r)

end


