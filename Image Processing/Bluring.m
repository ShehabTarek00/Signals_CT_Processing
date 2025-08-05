% Read an example grayscale image
imagePath = 'C:\Users\Ali Mohamed\Downloads\Project\peppers.png';
Original_Image = imread(imagePath);
% grayscaleImage = rgb2gray(Original_Image);

% Define a blurring kernel (e.g., a 5x5 averaging filter)
blurKernel = ones(15)/(15^2);

Red_Comp_SA = Original_Image(:,:,1);
Green_Comp_SA = Original_Image(:,:,2);
Blue_Comp_SA = Original_Image(:,:,3);

% % Apply convolution to blur the image
% Blured_Image = conv2(double(grayscaleImage), blurKernel, 'same');

 Blured_Image_Red_Comp_SA = conv2(double(Red_Comp_SA), blurKernel, 'same');
 Blured_Image_Green_Comp_SA = conv2(double(Green_Comp_SA), blurKernel, 'same');
 Blured_Image_Blue_Comp_SA = conv2(double(Blue_Comp_SA), blurKernel, 'same');
 
 Blured_Image = cat(3, Blured_Image_Red_Comp_SA, Blured_Image_Green_Comp_SA, Blured_Image_Blue_Comp_SA);



% Convert the result back to uint8 for display
Blured_Image = uint16(Blured_Image);


% Display the original and blurred images
figure;

subplot(1, 2, 1);
imshow(Original_Image);
title('Original Image');

subplot(1, 2, 2);
imshow(Blured_Image);
title('Blurred Image');
