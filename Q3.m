% Digital Image Processing Practical Exam Solution

% Load two sample images (Ensure they are of the same size for arithmetic operations)
image1 = imread('image1.jpg'); % Replace 'image1.jpg' with your first image filename
image2 = imread('image2.jpg'); % Replace 'image2.jpg' with your second image filename

% Convert images to grayscale if they are RGB (optional, depending on requirement)
if size(image1, 3) == 3
    image1 = rgb2gray(image1);
end
if size(image2, 3) == 3
    image2 = rgb2gray(image2);
end

% a. Addition of two images
addedImage = imadd(image1, image2); % MATLAB's built-in function for image addition

% b. Subtraction of one image from the other
subtractedImage = imsubtract(image1, image2); % MATLAB's built-in function for image subtraction

% c. Calculate the mean value of an image
meanValueImage1 = mean(image1(:)); % Compute mean value of all pixels in image1

% Display results
figure;
subplot(2, 2, 1);
imshow(image1);
title('Image 1');

subplot(2, 2, 2);
imshow(image2);
title('Image 2');

subplot(2, 2, 3);
imshow(addedImage);
title('Added Image');

subplot(2, 2, 4);
imshow(subtractedImage);
title('Subtracted Image');

% Print mean value to console
disp(['Mean value of Image 1: ', num2str(meanValueImage1)]);