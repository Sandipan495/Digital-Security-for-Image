xx=input('Enter the Original Host Image Name: ');
yy=input('Enter the Watermarked Stego Image Name: ');

InputImage=double(imread(xx));
ReconstructedImage=double(imread(yy));
n=size(InputImage);
M=n(1);
N=n(2);
MSE = sum(sum((InputImage-ReconstructedImage).^2))/(M*N);
PSNR = 10*log10(256*256/MSE);
fprintf('\nMSE: %7.7f ', MSE);
fprintf('\nPSNR: %9.7f dB', PSNR);
