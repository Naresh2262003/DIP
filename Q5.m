// a

% Read the input image
inputImage = imread('cameraman.tif'); % Replace 'cameraman.tif' with your image file
grayImage = rgb2gray(inputImage); % Convert to grayscale if not already

% Histogram calculation
[counts, binLocations] = imhist(grayImage);

% Histogram equalization
equalizedImage = histeq(grayImage);

% Display results
figure;
subplot(2, 2, 1); imshow(grayImage); title('Original Image');
subplot(2, 2, 2); bar(binLocations, counts); title('Histogram');
subplot(2, 2, 3); imshow(equalizedImage); title('Equalized Image');
subplot(2, 2, 4); imhist(equalizedImage); title('Equalized Histogram');


// b
% Read the input image
inputImage = imread('cameraman.tif'); % Replace 'cameraman.tif' with your image file
grayImage = rgb2gray(inputImage); % Convert to grayscale if not already

% Step 1: Calculate histogram
[rows, cols] = size(grayImage);
histogram = zeros(1, 256); % Initialize histogram

for i = 1:rows
    for j = 1:cols
        pixelValue = grayImage(i, j);
        histogram(pixelValue + 1) = histogram(pixelValue + 1) + 1;
    end
end

% Step 2: Normalize histogram to calculate PDF
totalPixels = rows * cols;
pdf = histogram / totalPixels;

% Step 3: Compute CDF
cdf = cumsum(pdf);

% Step 4: Map CDF to range [0, 255]
equalizedValues = round(cdf * 255);

% Step 5: Create equalized image
equalizedImage = zeros(rows, cols, 'uint8');
for i = 1:rows
    for j = 1:cols
        equalizedImage(i, j) = equalizedValues(grayImage(i, j) + 1);
    end
end

% Display results
figure;
subplot(2, 2, 1); imshow(grayImage); title('Original Image');
subplot(2, 2, 2); bar(0:255, histogram); title('Histogram');
subplot(2, 2, 3); imshow(equalizedImage); title('Equalized Image');
subplot(2, 2, 4); bar(0:255, histcounts(equalizedImage, 256)); title('Equalized Histogram');

