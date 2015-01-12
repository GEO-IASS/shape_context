% given distance and angle of two points, finds its location in cost matrix
function [n_cost]=find_cost(dis,angle,len)
n = fix(angle*6/pi)+1;
if n == 13,
    n = 1;
end

unit = 2*len/exp(4);
m = fix(log(dis/unit));
if m <= 0,
    m = 0;
else
    if m == 5,
        m = 4;
    end
end
n_cost = n + m*12;
