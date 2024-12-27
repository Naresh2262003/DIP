clc;
clear;
close all;

% Read the input image
img = imread('peppers.png'); % Replace 'peppers.png' with your image file
img = im2double(img); % Convert to double for better handling

% Display the original image
figure;
subplot(2, 3, 1);
imshow(img);
title('Original Image');

%% a. Translation
% Define translation distances
Tx = 50; % Translate 50 pixels right
Ty = 30; % Translate 30 pixels down

% Create translation matrix
tform_translate = affine2d([1 0 0; 0 1 0; Tx Ty 1]);
translated_img = imwarp(img, tform_translate);

% Display translated image
subplot(2, 3, 2);
imshow(translated_img);
title('Translated Image');

%% b. Scaling
% Define scaling factors
scale_x = 1.5; % Scale 1.5 times in x
scale_y = 1.5; % Scale 1.5 times in y

% Create scaling matrix
tform_scale = affine2d([scale_x 0 0; 0 scale_y 0; 0 0 1]);
scaled_img = imwarp(img, tform_scale);

% Display scaled image
subplot(2, 3, 3);
imshow(scaled_img);
title('Scaled Image');

%% c. Rotation
% Define rotation angle
rotation_angle = 45; % Rotate by 45 degrees

% Create rotation matrix
tform_rotate = affine2d([cosd(rotation_angle) -sind(rotation_angle) 0; 
                         sind(rotation_angle) cosd(rotation_angle) 0; 
                         0 0 1]);
rotated_img = imwarp(img, tform_rotate);

% Display rotated image
subplot(2, 3, 4);
imshow(rotated_img);
title('Rotated Image');

%% d. Shrinking
% Define shrinking factors
shrink_x = 0.5; % Shrink to half in x\shrink_y = 0.5; % Shrink to half in y

% Create shrinking matrix
tform_shrink = affine2d([shrink_x 0 0; 0 shrink_y 0; 0 0 1]);
shrunk_img = imwarp(img, tform_shrink);

% Display shrunk image
subplot(2, 3, 5);
imshow(shrunk_img);
title('Shrunk Image');

%% e. Zooming
% Define zoom factors
zoom_x = 2; % Zoom 2 times in x
zoom_y = 2; % Zoom 2 times in y

% Create zoom matrix
tform_zoom = affine2d([zoom_x 0 0; 0 zoom_y 0; 0 0 1]);
zoomed_img = imwarp(img, tform_zoom);

% Display zoomed image
subplot(2, 3, 6);
imshow(zoomed_img);
title('Zoomed Image');
