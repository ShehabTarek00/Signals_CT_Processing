img_SA = imread('C:\Users\Ali Mohamed\Downloads\Project\peppers.png');
figure;
subplot(1, 4, 1);
imshow(img_SA)
title('Original image');
Red_Comp_SA = img_SA(:,:,1);
Green_Comp_SA = img_SA(:,:,2);
Blue_Comp_SA = img_SA(:,:,3);
a = zeros(size(img_SA, 1), size(img_SA, 2));
Just_Red_Comp = cat(3, Red_Comp_SA, a, a);
subplot(1, 4, 2);
imshow(Just_Red_Comp);
title('Red Component');
Just_Green_Comp = cat(3, a, Green_Comp_SA, a);
subplot(1, 4, 3);
imshow(Just_Green_Comp);
title('Green Component');
Just_Blue_Comp = cat(3, a, a, Blue_Comp_SA);
subplot(1, 4, 4);
imshow(Just_Blue_Comp);
title('Blue Component');



