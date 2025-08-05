% Read an example grayscale image
imagePath = 'C:\Users\Ali Mohamed\Downloads\Project\peppers.png';
Orignal_Image = imread(imagePath);

% Define the Laplacian sharpening kernel
laplacianKernel = [0, -1, 0; -1, 5, -1; 0, -1, 0];

Red_Comp_SA = Orignal_Image(:,:,1);
Green_Comp_SA = Orignal_Image(:,:,2);
Blue_Comp_SA = Orignal_Image(:,:,3);



% Apply convolution to sharpen the image
sharpenedImage(:,:,1) = conv2(double(Red_Comp_SA), laplacianKernel, 'same');
sharpenedImage(:,:,2) = conv2(double(Green_Comp_SA), laplacianKernel, 'same');
sharpenedImage(:,:,3) = conv2(double(Blue_Comp_SA), laplacianKernel, 'same');


% Display the original image and the sharpened image
figure;

subplot(1, 2, 1);
imshow(Orignal_Image);
title('Original Grayscale Image');

subplot(1, 2, 2);
imshow(sharpenedImage);
title('Sharpened Image (Laplacian Kernel)');
