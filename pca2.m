%This function performs PCA
%Input:  Data matrix(d x n), where d-dim and n -#of vectors 
%Output: PC - principle components(eigenvectors of covariance matrix)
%        V  - eigenvales
%        projData - orig. data projected onto principle components
function [projData,PC,V,v] = pca2(data)
close all
[~,N] = size(data);
% subtract off the mean for each dimension
mn = mean(data,2);
data = data - repmat(mn,1,N);
%normalize matrix
Y = data' / sqrt(N-1);
%SVD
[~,S1,PC] = svd(Y,'econ');
% calculate the variances
S = diag(S1);
V = S .* S;
% project the original data
projData = data' * PC;

%display variance
figure(1)
v = cumsum(V)./sum(V);
x = 1:1:30;
bar(x,v,'g')
ylabel('% of the variance')
xlabel('PCs')
title('Cumulative Variance')
figure(2)
%display eigenvales
plot(V)
ylabel('lamda')
xlabel('PCs')

	
