ImagePath = 'C:\Users\Ali Mohamed\Downloads\Project\peppers.png';
Original_Image = imread(ImagePath);
Gray_Scale_Image_Version = rgb2gray(Original_Image);

sobelHorizontal = [-1, -2, -1; 0, 0, 0; 1, 2, 1];
sobelVertical = [-1, 0, 1; -2, 0, 2; -1, 0, 1];

edgesHorizontal = conv2(double(Gray_Scale_Image_Version), sobelHorizontal, 'same');
edgesVertical = conv2(double(Gray_Scale_Image_Version), sobelVertical, 'same');

edgeMagnitude = sqrt(edgesHorizontal.^2 + edgesVertical.^2);

edgeMagnitude = edgeMagnitude / max(edgeMagnitude(:));

% Display the original image and the detected edges
figure;

subplot(1, 3, 1);
imshow(Original_Image);
title('Original Image');

subplot(1, 3, 2);
imshow(Gray_Scale_Image_Version);
title('Original Grayscale Image');

subplot(1, 3, 3);
imshow(edgeMagnitude);
title('Detected Edges (Sobel Operator)');
