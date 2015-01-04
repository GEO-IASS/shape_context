% calcuate the distance and angle between two points
function [dis,angle]=dist_angle(point_A,point_B);          
difference = point_B - point_A;
dis = (difference(1)^2+difference(2)^2)^0.5;
slope = difference(1)/difference(2);
angle = atan(slope);
if difference(2)<0,
    angle = angle + pi;
end
if angle <0,
    angle = angle + 2*pi;
end
