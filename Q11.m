% Read the image
img = imread('image.jpg');  % Load your image here

% Convert the image to grayscale
gray_img = rgb2gray(img);  % Convert the image to grayscale if it's a color image

% Convert the image to binary (0s and 1s)
binary_img = imbinarize(gray_img);  % Convert the grayscale image to binary

% Display the original binary image
figure, imshow(binary_img), title('Original Binary Image');

% Erosion operation
se = strel('square', 3);  % Create a 3x3 square structuring element
eroded_img = imerode(binary_img, se);  % Apply erosion
figure, imshow(eroded_img), title('Eroded Image');

% Dilation operation
dilated_img = imdilate(binary_img, se);  % Apply dilation
figure, imshow(dilated_img), title('Dilated Image');
