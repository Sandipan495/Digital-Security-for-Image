close all
clear
clc

%% Image Preprocessing
%%
% Read the image
a = double(imread('stego.jpg'));
figure; imshow(a, []);

% Resize the image to 256x256 and round to nearest integers
b = reshape(a,1,65536);
% Show the resized (256x256) grayscale image
figure; imshow(b, []);

%position where to decode
load position.mat
r_sorta = sort(r);

%% Decode
%% 
% logo_recover = zeros(1,64);
for ii=1:64
    temp_posh = r_sorta(ii);
    temp_valh = b(temp_posh);
    
    xx = dec2bin(temp_valh, 8);
    yy = zeros(1, 8);
        for i = 1:8
            yy(i) = str2num(xx(i));
        end
        
        logo_recover(ii)= yy(8);
end
        
 %% File Write
 logo_rec = reshape(logo_recover,8,8);
 figure;imshow(logo_rec,[])
 
 fid = fopen('rec_logo.dat','wt');
 
 for i=1:8
     for j=1:8
        fprintf(fid, '%1.0f ', logo_rec(i,j));
     end
     fprintf(fid, '\n');
 end
        
        
        
        
        
        