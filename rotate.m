% rotate the picture with PCA, the vector with largest variance shifts to
% be x-aix
load trees
A = imread('/Users/kshen4/Desktop/90_black.jpg');
A = im2bw(A)
imshow(A);

[m,n] = find(A<250);
x = [m,n];
covx = cov(x);
[COEFF,latent,explained] = pcacov(covx);
slope_1 = COEFF(1)/COEFF(2);
slope_2 = COEFF(3)/COEFF(4);
angle_1 = -(atan(slope_1)/pi*180);
angle_2 = -(atan(slope_2)/pi*180);

B_1 = imrotate(A,angle_1);
subplot(2,2,1), imshow(B_1);
B_2 = imrotate(A,angle_2);
subplot(2,2,2), imshow(B_2);
C_1 = changem(B_1,[255],[0]);
subplot(2,2,3), imshow(C_1);
C_2 = changem(B_2,[255],[0]);
subplot(2,2,4), imshow(C_2);