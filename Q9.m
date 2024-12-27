% Step 1: Load the image
image = imread('image.jpg'); % replace with your image file
image_gray = rgb2gray(image); % Convert to grayscale if the image is RGB

% Step 2: Apply FFT to the image
image_fft = fft2(double(image_gray));  % Compute the 2D Fourier transform

% Step 3: Shift zero frequency component to the center
image_fft_shifted = fftshift(image_fft);

% Step 4: Create low-pass filter
[M, N] = size(image_gray);
[U, V] = meshgrid(-floor(N/2):floor(N/2)-1, -floor(M/2):floor(M/2)-1);
D = sqrt(U.^2 + V.^2);  % Distance matrix

% Low-pass filter with cutoff frequency (example: 30)
cutoff_low = 30;
low_pass_filter = double(D <= cutoff_low);

% Step 5: Apply low-pass filter in frequency domain
image_low_pass_fft = image_fft_shifted .* low_pass_filter;

% Step 6: Perform IFFT to reconstruct the image after low-pass filtering
image_low_pass = ifft2(ifftshift(image_low_pass_fft));
image_low_pass = uint8(abs(image_low_pass)); % Convert to uint8 for display

% Step 7: Create high-pass filter
high_pass_filter = double(D > cutoff_low); % Complementary to low-pass filter

% Step 8: Apply high-pass filter in frequency domain
image_high_pass_fft = image_fft_shifted .* high_pass_filter;

% Step 9: Perform IFFT to reconstruct the image after high-pass filtering
image_high_pass = ifft2(ifftshift(image_high_pass_fft));
image_high_pass = uint8(abs(image_high_pass)); % Convert to uint8 for display

% Step 10: Display the images
subplot(2,2,1), imshow(image_gray), title('Original Image');
subplot(2,2,2), imshow(image_low_pass), title('Low Pass Filtered Image');
subplot(2,2,3), imshow(image_high_pass), title('High Pass Filtered Image');

