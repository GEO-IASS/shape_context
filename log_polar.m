% computing the cost matrix
function [cost_matrix]=log_polar(x,min_circle_length)
mc=2*min_circle_length/exp(4);
[X_1,Y_2]=meshgrid(x(:,1),x(:,2));
[Y_1,X_2]=meshgrid(x(:,2),x(:,1));
D1=sqrt((X_2-X_1).^2+(Y_2-Y_1).^2);
Y_diff=Y_2-Y_1;
A1=((X_2-X_1)./(Y_diff));
A1_angle=atan(A1)+pi/2+(-1+sign(Y_diff))/2*pi;

[~,D2]=histc(D1,[0 mc mc*exp(1) mc*exp(2) mc*exp(3) mc*exp(4)]);

for i=1:12
    range(i)=(i-7)*(2*pi)/12;
end
range(13)=3.1416;

[~,A2]=histc(A1_angle,range);
matrix=(D2-1).*12+A2;
cost_matrix=histc(matrix,1:60)';

end
