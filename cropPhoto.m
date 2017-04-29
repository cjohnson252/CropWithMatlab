%cropPhoto.m
%Caroline Johnson
%This program contains a function that will
%display an image and request that the user
%selects two points on that image. It will
%then display an image that has been cropped
%to the two selected points.

function[] = cropPhoto()

x = imread('CropMe.JPG');
[maxrow, maxcol, ~] = size(x);
imshow(x);
title('Select 2 points');
[a, b] = ginput(2);

%If the user clicks points from right to left,
%swap the points.
if a(1,1) > a(2,1) || b(1,1) > b(2,1)
    tempa = a(1,1);
    a(1,1) = a(2,1);
    a(2,1) = tempa;
    
    tempb = b(1,1);
    b(1,1) = b(2,1);
    b(2,1) = tempb;
end

%If the user selects a point outside of the 
%bounds from 1 to max, set the point equal
%to the closest bound.
for i = 1:2
    if b(i,1) < 1
        b(i,1) = 1;
    end
    if b(i,1) > maxrow
        b(i,1) = maxrow;
    end
    if a(i,1) < 1
        a(i,1) = 1;
    end
    if a(i,1) > maxcol
        a(i,1) = maxcol;
    end
end

r1 = round(b(1,1));
r2 = round(b(2,1));
c1 = round(a(1,1));
c2 = round(a(2,1));

y = x(r1:r2, c1:c2, :);
figure();
imshow(y);
title('cropped version');
