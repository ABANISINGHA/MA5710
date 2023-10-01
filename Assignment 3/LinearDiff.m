
% Assignment 3 (Q-3)

% we input here a black and white image
inputimage = imread('f1.jpg');

 %showing of input image
subplot(1, 3, 1);
imshow(inputimage);
title('inputmage');

% we add Gaussian noise to the original image by using imnoise function
noisetype = 'gaussian'; 
noisemean = 0;          
spnoisevar = 0.5;
%noisyimage=imnoise(inputimage,'salt & pepper',spnoisevar);
%noisyimage=imnoise(inputimage,'poisson');
noisyimage=imnoise(inputimage,'speckle',spnoisevar);

%noisyimage = imnoise(inputimage, noisetype, noisemean, spnoisevar);

% showing of noisy image
subplot(1, 3, 2);
imshow(noisyimage);
title(['Speckle noisevar =' num2str(spnoisevar)]);
%title('Image with Gaussian Noise');

% for processing of the image we use the inbuilt im2double function
convertedimage = im2double(noisyimage);

% Sigma is smoothing parameter
% Consider sigma = 0.1, 0.5, 0.9, 1.2, 1.5, 2, 2.5, 3, 3.5, 4, 5
% By taking of different values of sigma
sigma = 0.5     

% Filter the noisy image by inbuilt Gaussian filter function
filteredimage = imgaussfilt(convertedimage, sigma); 

PSNRValue = psnr( filteredimage, convertedimage);
PSNRValue

% showing of filtered image
subplot(1, 3, 3);
imshow(filteredimage);
title(['LD,PSNR =' num2str(PSNRValue)]);











