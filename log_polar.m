% computing the cost matrix
function [cost_matrix]=find_cost(x,circle_center,min_circle_length);
n_point = 200;
cost_matrix = zeros(n_point, 60);
for i=1:n_point,
    point_A = x(i,:);
    for j = 1:n_point,
        if j ~= i,
            point_B = x(j,:);
            [dis,angle] = dist_angle(point_A,point_B);
            cost_number = find_cost(dis,angle,min_circle_length);
            cost_matrix(i,cost_number) = cost_matrix(i,cost_number)+1;
        end
    end
end

    