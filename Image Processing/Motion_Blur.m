% Read an example grayscale image
imagePath = 'C:\Users\Ali Mohamed\Downloads\Project\peppers.png';
Original_Image = imread(imagePath);

% Horizontal Blur
horz_blur = zeros(21, 21);
horz_blur = insertShape(horz_blur, 'Line', [21, 10, 0, 10], 'Color', [255 255 255], 'LineWidth', 1);
horz_blur = double(rgb2gray(horz_blur));

% Normalize the kernel
horz_blur = horz_blur / sum(horz_blur(:));


Red_Comp_SA = Original_Image(:,:,1);
Green_Comp_SA = Original_Image(:,:,2);
Blue_Comp_SA = Original_Image(:,:,3);

% Apply convolution to blur the image
Motion_Blured_Image_Red_Comp_SA = conv2(double(Red_Comp_SA), horz_blur, 'same');
Motion_Blured_Image_Green_Comp_SA = conv2(double(Green_Comp_SA), horz_blur, 'same');
Motion_Blured_Image_Blue_Comp_SA = conv2(double(Blue_Comp_SA), horz_blur, 'same');
 
Motion_Blured_Image = cat(3, Motion_Blured_Image_Red_Comp_SA, Motion_Blured_Image_Green_Comp_SA, Motion_Blured_Image_Blue_Comp_SA);



% Convert the result back to uint8 for display
 Motion_Blured_Image = uint16(Motion_Blured_Image);


% Display the original and blurred images
figure;

subplot(1, 2, 1);
imshow(Original_Image);
title('Original Image');

subplot(1, 2, 2);
imshow(Motion_Blured_Image);
title('Motion Blurred Image');

%Get the inverse kernel which will cancel blurring
Horz_blur_Kernel_Freq_Domain = fft2(horz_blur);

Inverse_Horz_blur_Freq_Domain = pinv(Horz_blur_Kernel_Freq_Domain);

Horz_blur_Kernel_Time_domain = ifft2(Inverse_Horz_blur_Freq_Domain);




% Apply convolution to the blurred image to return to the unblurred 
Motion_Blured_Image(:,:,1) = conv2(Motion_Blured_Image(:,:,1), Horz_blur_Kernel_Time_domain, 'same');
Motion_Blured_Image(:,:,2) = conv2(Motion_Blured_Image(:,:,2), Horz_blur_Kernel_Time_domain, 'same');
Motion_Blured_Image(:,:,3) = conv2(Motion_Blured_Image(:,:,3), Horz_blur_Kernel_Time_domain, 'same');
 
%Obtained_unblured_Image = cat(3, Motion_Blured_Image_Red_Comp_SA, Motion_Blured_Image_Green_Comp_SA, Motion_Blured_Image_Blue_Comp_SA);

% Convert the result back to uint16 for display
Motion_Blured_Image = 20*uint16(Motion_Blured_Image);


% Display the original and blurred images
figure();

subplot(1, 2, 1);
imshow(Original_Image);
title('Original Image');

subplot(1, 2, 2);
imshow(Motion_Blured_Image);
title('Unblurred Image');