% MATLAB Code for Image Noise Models and Restoration

% Read the input image
originalImage = imread('cameraman.tif'); % Replace with your image file
figure, imshow(originalImage), title('Original Image');

%% Adding Noise Models
% Add Salt and Pepper Noise
spNoiseImage = imnoise(originalImage, 'salt & pepper', 0.02); % 2% noise
figure, imshow(spNoiseImage), title('Image with Salt and Pepper Noise');

% Add Gaussian Noise
gaussianNoiseImage = imnoise(originalImage, 'gaussian', 0, 0.01); % Mean=0, Variance=0.01
figure, imshow(gaussianNoiseImage), title('Image with Gaussian Noise');

%% a. Image Restoration (Simple Example)
% For demonstration, apply a basic low-pass filter
h = fspecial('average', [3, 3]); % 3x3 average filter
restoredImage = imfilter(originalImage, h);
figure, imshow(restoredImage), title('Restored Image (Low-Pass Filter)');

%% b. Remove Salt and Pepper Noise
% Apply a Median Filter
spNoiseRemoved = medfilt2(spNoiseImage, [3, 3]); % 3x3 median filter
figure, imshow(spNoiseRemoved), title('Salt and Pepper Noise Removed');

%% c. Minimize Gaussian Noise
% Apply a Gaussian Filter
gaussianFilter = fspecial('gaussian', [3, 3], 0.5); % 3x3 filter, sigma=0.5
gaussianNoiseReduced = imfilter(gaussianNoiseImage, gaussianFilter);
figure, imshow(gaussianNoiseReduced), title('Gaussian Noise Minimized');

%% d. Median Filter Application
% Median Filter on Gaussian Noise Image
medianFiltered = medfilt2(gaussianNoiseImage, [3, 3]); % 3x3 median filter
figure, imshow(medianFiltered), title('Median Filter Applied');

% End of Code
