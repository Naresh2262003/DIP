% Load the image
image = imread('example.jpg');
gray_image = rgb2gray(image); % Convert to grayscale if it's a color image

% a. Obtain Negative Image
negative_image = 255 - gray_image;

% b. Obtain Flip Image
flip_image = fliplr(gray_image); % Flip horizontally

% c. Thresholding
threshold = 127;
thresholded_image = gray_image > threshold;
thresholded_image = uint8(thresholded_image) * 255; % Convert logical to binary (0, 255)

% d. Contrast Stretching
min_val = double(min(gray_image(:)));
max_val = double(max(gray_image(:)));
contrast_stretched_image = uint8((double(gray_image) - min_val) / (max_val - min_val) * 255);

% Display the results figure;

subplot(2, 3, 1), imshow(gray_image), title('Original Image');
subplot(2, 3, 2), imshow(negative_image), title('Negative Image');
subplot(2, 3, 3), imshow(flip_image), title('Flipped Image');
subplot(2, 3, 4), imshow(thresholded_image), title('Thresholded Image');
subplot(2, 3, 5), imshow(contrast_stretched_image), title('Contrast Stretched');
