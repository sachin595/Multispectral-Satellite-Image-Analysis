# Principal Component Analysis on Multispectral Satellite Image

![Image Processing](https://img.shields.io/badge/Image%20Processing-blue?style=for-the-badge&logo=imagej&logoColor=white)
![MATLAB](https://img.shields.io/badge/MATLAB-orange?style=for-the-badge&logo=mathworks&logoColor=white)
![PCA](https://img.shields.io/badge/PCA-green?style=for-the-badge&logo=google-analytics&logoColor=white)
![Linear Algebra](https://img.shields.io/badge/Linear%20Algebra-yellow?style=for-the-badge&logo=matrix&logoColor=white)
![Data Analysis](https://img.shields.io/badge/Data%20Analysis-red?style=for-the-badge&logo=databricks&logoColor=white)



This project applies Principal Component Analysis (PCA) to an 8-band multispectral satellite image of Adelaide, Australia, to extract key spectral features and reduce dimensionality. Results include eigenvalue computations, image reconstruction, and comparisons of original and reconstructed images

# [Image file used for this project](https://drive.google.com/file/d/1Hn9E-rHKMXCBU-_Oc-f1hX3mplu3OwIU/view?usp=drive_link)

The procedure involves constructing a matrix from the spectral bands, computing the covariance matrix, determining eigenvalues and eigenvectors, and using inverse PCA to reconstruct the original image. Notably, PCA aids in reducing the dimensionality of multispectral satellite images, capturing essential information in fewer dimensions.

The covariance matrix, central to PCA, identifies principal components and their corresponding eigenvalues. These components represent directions of maximum variance, crucial for image analysis. The project explores reconstructing the image using different sets of principal components, demonstrating the power of PCA in compressing and enhancing image data.

The results showcase the subtracted images obtained from the highest and lowest eigenvalues, revealing the significance of the principal components in preserving image information. The discussion emphasizes that a small subset of eigenvectors can capture a significant portion of the image data, illustrating the efficacy of PCA in dimensionality reduction.

Overall, the project demonstrates how PCA can be a powerful tool for analyzing and compressing multispectral satellite images, providing insights into the importance of different spectral components and their impact on image reconstruction. The project findings enhance understanding of eigensystems, PCA, and their practical applications in image processing.

## Results and Analysis
For detailed results and analyses of satellite images, please refer to [Results and Report.pdf](report_and_results.pdf).


