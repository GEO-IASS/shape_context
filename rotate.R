library(jpeg)
img <- readJPEG(system.file("img", "/Users/kshen4/Desktop/90.jpg", package="jpeg"))




"""
A = imread('/Users/kshen4/Desktop/90.jpg')
imshow(A)
B = imrotate(A,35)
imshow(B)
[m,n] = size(B)
for i = 1:m
    for j = 1:n
        if B(i,j) == 0
            B(i,j) = 255
        end
    end
end

imshow(B)
"""
