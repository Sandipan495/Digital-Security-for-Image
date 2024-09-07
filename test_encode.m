close all
clear all
clc
%% Image Preprocessing
%%
% Read the image
a = (imread('lena_col.jpg'));
% Convert to grayscale
b = rgb2gray(a);
figure;imshow(b,[]);
% Convert to double
c = double(b);

% Resize the image to 256x256 and round to nearest integers
d = round(imresize(c, [256, 256]));
% Show the resized (256x256) grayscale image
figure; imshow(d, []);
imwrite(uint8(d),'host.jpg','jpg','Mode','lossless','Quality',100);
% Load the watermark logo
load logo.dat
% Show the logo
figure; imshow(logo, []);

% Reshape the logo matrix into a 1x64 vector
logoVector = reshape(logo, 1, 64);

%position where to hide
load position.mat
r_sorta = sort(r);

%% Hide
%%
% Encode
d_vec = reshape(d,1,65536);
figure;imshow(d_vec,[]);


for i=1:64
    temp_posh = r_sorta(i);
    temp_valh = d_vec(temp_posh);
    
    xx = dec2bin(temp_valh, 8);
    
    yy = zeros(1, 8);
        for ii = 1:8
            yy(ii) = str2num(xx(ii));
        end
    yy(8)= logoVector(i);
    zz = num2str(yy);
    p = bin2dec(zz);
    d_vec(temp_posh)=p;
end

%% File Write
%%
d_vecmod = reshape(d_vec,256,256);
figure;imshow(d_vecmod,[]);

stego = uint8(d_vecmod);

imwrite(stego,'stego.jpg','jpg','Mode','lossless','Quality',100);

%% End of Encoding
%%