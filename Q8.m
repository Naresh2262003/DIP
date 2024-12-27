% Read an image
img = imread('example.jpg');
img = rgb2gray(img);  % Convert to grayscale if it's a color image

% Create a Gaussian filter (low pass filter)
h = fspecial('gaussian', [5 5], 2);  % 5x5 Gaussian kernel with standard deviation 2

% Apply the filter to the image
low_pass_img = imfilter(img, h);

% Display original and filtered images
subplot(1,2,1);
imshow(img);
title('Original Image');

subplot(1,2,2);
imshow(low_pass_img);
title('Low Pass Filtered Image');


% Read an image
img = imread('example.jpg');
img = rgb2gray(img);  % Convert to grayscale if it's a color image

% Create a Gaussian filter (low pass filter)
h = fspecial('gaussian', [5 5], 2);

% Apply the filter to the image (Low Pass filtered image)
low_pass_img = imfilter(img, h);

% High Pass Filter = Original Image - Low Pass Filtered Image
high_pass_img = img - low_pass_img;

% Display original and high pass filtered images
subplot(1,2,1);
imshow(img);
title('Original Image');

subplot(1,2,2);
imshow(high_pass_img);
title('High Pass Filtered Image');
