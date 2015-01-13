function [shape_context_cost1]=chi_square(cost_matrix1,cost_matrix2)
interk = @(X,Y) sum(bsxfun(@minus,X,Y).^2./bsxfun(@plus,X,Y),2);
cost_matrix1=cost_matrix1+0.00001;
cost_matrix2=cost_matrix2+0.00001;
shape_context_cost1 = pdist2(cost_matrix1,cost_matrix2,interk)./2;
end



