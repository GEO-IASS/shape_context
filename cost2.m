function [cost]=cost2(A,B,a_c,b_c)
    n=length(A);
    
for i=1:n
    for j=1:n
        cos_a=(A(i,1)-a_c(1))/sqrt((A(i,1)-a_c(1))^2+(A(i,2)-a_c(2))^2);
        sin_a=(A(i,2)-a_c(2))/sqrt((A(i,1)-a_c(1))^2+(A(i,2)-a_c(2))^2);
        cos_b=(B(j,1)-b_c(1))/sqrt((B(j,1)-b_c(1))^2+(B(j,2)-b_c(2))^2);
        sin_b=(B(j,2)-b_c(2))/sqrt((B(j,1)-b_c(1))^2+(B(j,2)-b_c(2))^2);
        cost(i,j)=0.5*sqrt((cos_a-cos_b)^2+(sin_a-sin_b)^2);
    end
end
end

