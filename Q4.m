% Read two grayscale images
img1 = imread('image1.png'); % Replace with your image file
img2 = imread('image2.png'); % Replace with your image file

% Convert images to binary for logical operations
bin1 = im2bw(img1, 0.5); % Convert to binary with threshold 0.5
bin2 = im2bw(img2, 0.5); % Convert to binary with threshold 0.5

% Logical AND operation
andImage = bin1 & bin2;

% Logical OR operation
orImage = bin1 | bin2;

% Intersection (same as AND for binary images)
intersectionImage = andImage;

% NOT operation (Negative of the first image)
notImage = ~bin1;

% Display results
figure;
subplot(3, 2, 1), imshow(img1), title('Image 1');
subplot(3, 2, 2), imshow(img2), title('Image 2');
subplot(3, 2, 3), imshow(andImage), title('AND Operation');
subplot(3, 2, 4), imshow(orImage), title('OR Operation');
subplot(3, 2, 5), imshow(intersectionImage), title('Intersection');
subplot(3, 2, 6), imshow(notImage), title('NOT Operation');
