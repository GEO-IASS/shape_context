    % calcuate the Chi-square test value
function [shape_context_cost1]=chi_square(cost_matrix1,cost_matrix2);
n = size(cost_matrix1);
shape_context_cost1 = zeros(n(1),n(1));
for i=1:n(1),
    for j = 1:n(1),
        cost_matrix_squared = (cost_matrix1(i,:) - cost_matrix2(j,:)).^2;
        cost_matrix_sum = (cost_matrix1(i,:) + cost_matrix2(j,:));
        cost_temp = cost_matrix_squared./cost_matrix_sum;
        cost_temp(isnan(cost_temp)) = 0;
        value = sum(cost_temp);
        shape_context_cost1(i,j) = value/2;
    end
end