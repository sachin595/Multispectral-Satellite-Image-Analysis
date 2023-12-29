% Specify the file path and name of the image
filename = '14NOV27004452-M2AS-054191978040_01_P001.tif';

% Read the image from the specified location
multi = imread(filename);
multi = double(multi);
multi = imresize(multi,[4096, 4096]);
[h,w,c] = size(multi);

wavelength = [0.425, 0.480, 0.545, 0.605, 0.660, 0.725, 0.8325, 0.950];

hCube = hypercube(multi, wavelength);
rgbImg = colorize(hCube, 'method', 'rgb', 'ContrastStretching', true);
figure; imshow(rgbImg)
title('sachin');



c1 = multi(:,:,1);
c2 = multi(:,:,2);
c3 = multi(:,:,3);
c4 = multi(:,:,4);
c5 = multi(:,:,5);
c6 = multi(:,:,6);
c7 = multi(:,:,7);
c8 = multi(:,:,8);

imgVector = [reshape(c1,1,[])',reshape(c2,1,[])',reshape(c3,1,[])',reshape(c4,1,[])',reshape(c5,1,[])',reshape(c6,1,[])',reshape(c7,1,[])',reshape(c8,1,[])'];

%Computing the covariance matrix 
cov_Matrix = (cov(imgVector));
disp(cov_Matrix);

%Determining the eigen values & eigen vectors(Principal Components of the
%covariance matrix
[eVectors1, eValues1] = eig(cov_Matrix);
disp('Eigen Values: ');
disp(eValues1);
disp('Eigenvectors: ');
disp(eVectors1);

[eVectors, ~, eValues, ~, explained, mu] = pca(double(imgVector));
disp(eValues);
pcaComp = double(imgVector-mu)*eVectors;
pc1 = uint8((pcaComp(:,1)-min(pcaComp(:,1)))*255/(max(pcaComp(:,1))-min(pcaComp(:,1))));
pc2 = uint8((pcaComp(:,2)-min(pcaComp(:,2)))*255/(max(pcaComp(:,2))-min(pcaComp(:,2))));
pc3 = uint8((pcaComp(:,3)-min(pcaComp(:,3)))*255/(max(pcaComp(:,3))-min(pcaComp(:,3))));
pc4 = uint8((pcaComp(:,4)-min(pcaComp(:,4)))*255/(max(pcaComp(:,4))-min(pcaComp(:,4))));
pc5 = uint8((pcaComp(:,5)-min(pcaComp(:,5)))*255/(max(pcaComp(:,5))-min(pcaComp(:,5))));
pc6 = uint8((pcaComp(:,6)-min(pcaComp(:,6)))*255/(max(pcaComp(:,6))-min(pcaComp(:,6))));
pc7 = uint8((pcaComp(:,7)-min(pcaComp(:,7)))*255/(max(pcaComp(:,7))-min(pcaComp(:,7))));
pc8 = uint8((pcaComp(:,8)-min(pcaComp(:,8)))*255/(max(pcaComp(:,8))-min(pcaComp(:,8))));
pc(:,1) = pc1;
pc(:,2) = pc2;
pc(:,3) = pc3;
pc(:,4) = pc4;
pc(:,5) = pc5;
pc(:,6) = pc6;
pc(:,7) = pc7;
pc(:,8) = pc8;
pc = reshape(pc,h,w,[]);
pchCube = hypercube(pc,wavelength);
pcRGBImg = colorize(pchCube, 'method','rgb','ContrastStretching',true);
figure; imshow(pcRGBImg)


pc1 = reshape(pc1,h,w);
pc2 = reshape(pc2,h,w);
pc3 = reshape(pc3,h,w);
pc4 = reshape(pc4,h,w);
pc5 = reshape(pc5,h,w);
pc6 = reshape(pc6,h,w);
pc7 = reshape(pc7,h,w);
pc8 = reshape(pc8,h,w);
figure; imshow(pc1);title("PC1")
figure; imshow(pc2);title("PC2")
figure; imshow(pc3);title("PC3")
figure; imshow(pc4);title("PC4")
figure; imshow(pc5);title("PC5")
figure; imshow(pc6);title("PC6")
figure; imshow(pc7);title("PC7")
figure; imshow(pc8);title("PC8")


%(a)Through the inverse PCA, reconstructing the original image by keeping each
%of the principal component starting from the first to the eight PC.
reconVec = eVectors(:,[1,2,3,4,5,6,7,8]);
reconComp = pcaComp(:,[1,2,3,4,5,6,7,8]);
reconImg0 = reconComp * reconVec;
reconstruction = reconImg0 + mu;
reconstruction(:,1) = unit8((reconstruction(:,1)-min(reconstruction(:,1)))*255/(max(reconstruction(:,1))-min(reconstruction(:,1))));
reconstruction(:,2) = unit8((reconstruction(:,2)-min(reconstruction(:,2)))*255/(max(reconstruction(:,2))-min(reconstruction(:,2))));
reconstruction(:,3) = unit8((reconstruction(:,3)-min(reconstruction(:,3)))*255/(max(reconstruction(:,3))-min(reconstruction(:,3))));
reconstruction(:,4) = unit8((reconstruction(:,4)-min(reconstruction(:,4)))*255/(max(reconstruction(:,4))-min(reconstruction(:,4))));
reconstruction(:,5) = unit8((reconstruction(:,5)-min(reconstruction(:,5)))*255/(max(reconstruction(:,5))-min(reconstruction(:,5))));
reconstruction(:,6) = unit8((reconstruction(:,6)-min(reconstruction(:,6)))*255/(max(reconstruction(:,6))-min(reconstruction(:,6))));
reconstruction(:,7) = unit8((reconstruction(:,7)-min(reconstruction(:,7)))*255/(max(reconstruction(:,7))-min(reconstruction(:,7))));
reconstruction(:,8) = unit8((reconstruction(:,8)-min(reconstruction(:,8)))*255/(max(reconstruction(:,8))-min(reconstruction(:,8))));
reconstruction = unit8(reconstruction);
reconstruction = reshape(reconstruction,h,w,[]);
ReconstructionHcube = hypercube(reconstruction, wavelength);
ReconstructionRGBImg = colorize(ReconstructionHcube, 'Method','rgb','ContrastStretching',true);
figure; imshow(ReconstructionRGBImg)
title('Fully reconstruced image');

%(b)Reconstructing the input image from the eigen vectors of the highest 4
%eigen values.
reconVec = eVectors(:,[1,2,3,4]);
reconComp = pcaComp(:,[1,2,3,4]);
ReconImg0 = reconComp * reconVec';
reconstruction = ReconImg0 + mu;
reconstruction(:,1) = uint8((reconstruction(:,1)-min(reconstruction(:,1)))*255/(max
(reconstruction(:,1))-min(reconstruction(:,1))));
reconstruction(:,2) = uint8((reconstruction(:,2)-min(reconstruction(:,2)))*255/(max
(reconstruction(:,2))-min(reconstruction(:,2))));
reconstruction(:,3) = uint8((reconstruction(:,3)-min(reconstruction(:,3)))*255/(max
(reconstruction(:,3))-min(reconstruction(:,3))));
reconstruction(:,4) = uint8((reconstruction(:,4)-min(reconstruction(:,4)))*255/(max
(reconstruction(:,4))-min(reconstruction(:,4))));
reconstruction(:,5) = uint8((reconstruction(:,5)-min(reconstruction(:,5)))*255/(max
(reconstruction(:,5))-min(reconstruction(:,5))));
reconstruction(:,6) = uint8((reconstruction(:,6)-min(reconstruction(:,6)))*255/(max
(reconstruction(:,6))-min(reconstruction(:,6))));
reconstruction(:,7) = uint8((reconstruction(:,7)-min(reconstruction(:,7)))*255/(max
(reconstruction(:,7))-min(reconstruction(:,7))));
reconstruction(:,8) = uint8((reconstruction(:,8)-min(reconstruction(:,8)))*255/(max
(reconstruction(:,8))-min(reconstruction(:,8))));
reconstruction = uint8(reconstruction);
reconstruction = reshape(reconstruction,h,w,[]);
ReconstructionHcube = hypercube(reconstruction, wavelength);
ReconstructionRGBImg1 = colorize(ReconstructionHcube, 'Method','rgb','ContrastStretching',true);
figure; imshow(ReconstructionRGBImg1)
title('Reconstructed img with highest 4 eigen values');


%(c)Reconstructing the input image from the eigen vectors of the lowest 4
%eigen values.
reconVec = eVectors(:,[5,6,7,8]);
reconComp = pcaComp(:,[5,6,7,8]);
ReconImg0 = reconComp * reconVec';
reconstruction = ReconImg0 + mu;
reconstruction(:,1) = uint8((reconstruction(:,1)-min(reconstruction(:,1)))*255/(max
(reconstruction(:,1))-min(reconstruction(:,1))));
reconstruction(:,2) = uint8((reconstruction(:,2)-min(reconstruction(:,2)))*255/(max
(reconstruction(:,2))-min(reconstruction(:,2))));
reconstruction(:,3) = uint8((reconstruction(:,3)-min(reconstruction(:,3)))*255/(max
(reconstruction(:,3))-min(reconstruction(:,3))));
reconstruction(:,4) = uint8((reconstruction(:,4)-min(reconstruction(:,4)))*255/(max
(reconstruction(:,4))-min(reconstruction(:,4))));
reconstruction(:,5) = uint8((reconstruction(:,5)-min(reconstruction(:,5)))*255/(max
(reconstruction(:,5))-min(reconstruction(:,5))));
reconstruction(:,6) = uint8((reconstruction(:,6)-min(reconstruction(:,6)))*255/(max
(reconstruction(:,6))-min(reconstruction(:,6))));
reconstruction(:,7) = uint8((reconstruction(:,7)-min(reconstruction(:,7)))*255/(max
(reconstruction(:,7))-min(reconstruction(:,7))));
reconstruction(:,8) = uint8((reconstruction(:,8)-min(reconstruction(:,8)))*255/(max
(reconstruction(:,8))-min(reconstruction(:,8))));
reconstruction = uint8(reconstruction);
reconstruction = reshape(reconstruction,h,w,[]);
ReconstructionHcube = hypercube(reconstruction, wavelength);
ReconstructionRGBImg2 = colorize(ReconstructionHcube, 'Method','rgb','ContrastStretching',true);
figure; imshow(ReconstructionRGBImg2)
title('Reconstructed img with lowest 4 eigen values');

%(d)Subtracting the original image from the reconstructed image from the
%highest 4 eigen values.
Subtracted_img1 = ReconstructionRGBImg1 - rgbImg;
figure; imshow(Subtracted_img1)
title('Subtracted img (d)');

%(e)Subtracting the original image from the reconstructed image from the
%lowest 4 eigen values.
Subtracted_img2 = ReconstructionRGBImg2 - rgbImg;
figure; imshow(Subtracted_img2)
title('Subtracted img (e)');





















































