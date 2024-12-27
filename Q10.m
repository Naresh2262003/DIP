// matlab
% Read the image
img = imread('image.jpg');  % Load your image here
gray_img = rgb2gray(img);  % Convert the image to grayscale

% Apply Sobel edge detection
sobel_edges = edge(gray_img, 'Sobel');
figure, imshow(sobel_edges), title('Sobel Edge Detection');

% Apply Prewitt edge detection
prewitt_edges = edge(gray_img, 'Prewitt');
figure, imshow(prewitt_edges), title('Prewitt Edge Detection');

% Apply Laplacian of Gaussian (LoG) edge detection
log_edges = edge(gray_img, 'log');
figure, imshow(log_edges), title('Laplacian of Gaussian (LoG) Edge Detection');

% Apply custom masks (Sobel, Prewitt) using convolution

% Sobel mask for edge detection
sobel_mask_x = [-1 0 1; -2 0 2; -1 0 1];
sobel_mask_y = [-1 -2 -1; 0 0 0; 1 2 1];
sobel_filtered_x = conv2(double(gray_img), sobel_mask_x, 'same');
sobel_filtered_y = conv2(double(gray_img), sobel_mask_y, 'same');
sobel_edges_custom = sqrt(sobel_filtered_x.^2 + sobel_filtered_y.^2);
figure, imshow(sobel_edges_custom, []), title('Custom Sobel Edge Detection');

% Prewitt mask for edge detection
prewitt_mask_x = [-1 0 1; -1 0 1; -1 0 1];
prewitt_mask_y = [-1 -1 -1; 0 0 0; 1 1 1];
prewitt_filtered_x = conv2(double(gray_img), prewitt_mask_x, 'same');
prewitt_filtered_y = conv2(double(gray_img), prewitt_mask_y, 'same');
prewitt_edges_custom = sqrt(prewitt_filtered_x.^2 + prewitt_filtered_y.^2);
figure, imshow(prewitt_edges_custom, []), title('Custom Prewitt Edge Detection');


// C
#include <opencv2/opencv.hpp>
#include <iostream>

using namespace cv;
using namespace std;

int main() {
    // Load the image
    Mat img = imread("image.jpg");  // Load your image here
    if (img.empty()) {
        cout << "Error: Image not found!" << endl;
        return -1;
    }

    // Convert the image to grayscale
    Mat gray_img;
    cvtColor(img, gray_img, COLOR_BGR2GRAY);

    // Apply Sobel edge detection
    Mat sobel_x, sobel_y, sobel_edges;
    Sobel(gray_img, sobel_x, CV_64F, 1, 0, 3);  // Sobel in x direction
    Sobel(gray_img, sobel_y, CV_64F, 0, 1, 3);  // Sobel in y direction
    magnitude(sobel_x, sobel_y, sobel_edges);   // Combine the results

    // Convert the result to uint8 and display it
    Mat sobel_edges_uint8;
    sobel_edges.convertTo(sobel_edges_uint8, CV_8U);
    imshow("Sobel Edge Detection", sobel_edges_uint8);
    waitKey(0);

    return 0;
}
