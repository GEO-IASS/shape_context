function [result]=improc(A)
    ed=edge(medfilt2(A,[2 2]),'canny',[0.0025 0.003]); %%
    s=size(ed);
    ed(s(1)-1,:)=0;
    ed(:,s(2)-1)=0;
    [m,n] = find(ed==1);
    x = [m,n];
    covx = cov(x);
    COEFF= pcacov(covx);
    slope_1 = -COEFF(1)/COEFF(2);
    angle_1 = -(atan(slope_1)/pi*180);
    result = imrotate(ed,angle_1);
    total = sum(sum(result));
    if total < 200,
        result = reshape(result,200);
    end
    
end

