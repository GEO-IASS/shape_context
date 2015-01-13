function [cost]=cost2(A,B,a_c,b_c)
triA(:,1)=(A(:,1)-a_c(1))./sqrt((A(:,1)-a_c(1)).^2+(A(:,2)-a_c(2)).^2);
triA(:,2)=(A(:,2)-a_c(2))./sqrt((A(:,1)-a_c(1)).^2+(A(:,2)-a_c(2)).^2);
triB(:,1)=(B(:,1)-b_c(1))./sqrt((B(:,1)-b_c(1)).^2+(B(:,2)-b_c(2)).^2);
triB(:,2)=(B(:,2)-b_c(2))./sqrt((B(:,1)-b_c(1)).^2+(B(:,2)-b_c(2)).^2);
cost=0.5.*pdist2(triA,triB);
end

