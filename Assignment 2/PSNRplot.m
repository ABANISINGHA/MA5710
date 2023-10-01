
% Assignment 2 (Q-3)

inputimage = imread('baby.jpg'); 

% we add Gaussian noise to the original image by using imnoise function.
noisetype = 'gaussian'; 
noisemean = 0.2;          
noisevar = 0.1;   

noisyImage = imnoise(inputimage, noisetype, noisemean, noisevar);

% for processing of the image we use the inbuilt im2double function
convertedimage = im2double(noisyImage);

sigma = 0.6:0.5:10.6;    % Sigma is smoothing parameter
                        % we creat an array of values of sigma
for i= 1:length(sigma)

    % Filter the noisy image by inbuilt Gaussian filter function
    filteredimg = imgaussfilt(convertedimage, sigma(i)); 
    
    % calculate the PSNR Value by using in built psnr function
    PSNRValue(i) = psnr( filteredimg, convertedimage);
    
    fprintf('sigma : %.2f \n', sigma(i));
    fprintf('psnr : %.2f \n', PSNRValue(i));
end
% plot the graph of smoothing parameter sigma vs PSNR
plot(sigma,PSNRValue,'-O')
xlabel('Sigma')
ylabel('PSNR ')
title(' Plot: Sigma - PSNR')


