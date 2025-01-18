# Principal Component Analysis on Multispectral Satellite Image


This Project on Eigensystem and Principal Component Analysis (PCA) delves into the implementation and understanding of the PCA algorithm applied to multispectral satellite images. The project employs an 8-band image from Adelaide, Australia, representing various geographical features through different wavelength intervals.

# [Image file used for this project](https://drive.google.com/file/d/1Hn9E-rHKMXCBU-_Oc-f1hX3mplu3OwIU/view?usp=drive_link)

The procedure involves constructing a matrix from the spectral bands, computing the covariance matrix, determining eigenvalues and eigenvectors, and using inverse PCA to reconstruct the original image. Notably, PCA aids in reducing the dimensionality of multispectral satellite images, capturing essential information in fewer dimensions.

The covariance matrix, central to PCA, identifies principal components and their corresponding eigenvalues. These components represent directions of maximum variance, crucial for image analysis. The project explores reconstructing the image using different sets of principal components, demonstrating the power of PCA in compressing and enhancing image data.

The results showcase the subtracted images obtained from the highest and lowest eigenvalues, revealing the significance of the principal components in preserving image information. The discussion emphasizes that a small subset of eigenvectors can capture a significant portion of the image data, illustrating the efficacy of PCA in dimensionality reduction.

Overall, the project demonstrates how PCA can be a powerful tool for analyzing and compressing multispectral satellite images, providing insights into the importance of different spectral components and their impact on image reconstruction. The project findings enhance understanding of eigensystems, PCA, and their practical applications in image processing.

## Results and Analysis
For detailed results and analyses of satellite images, please refer to [Results and Report.pdf](results_and_report.pdf).


