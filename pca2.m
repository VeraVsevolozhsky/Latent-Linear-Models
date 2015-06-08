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






% [pc,score,latent] = princomp(data');
% scatter(score(:,1:1),score(:,2))

% biplot(PC(:,1:2), 'scores',signals(:,1:2), 'varlabels',{});
% biplot(PC(:,1:2), 'scores',score(:,1:2), 'varlabels',{});

% idx = (res ==1);
% fCl1 = score(idx,1);
% fCl2 = score(idx,2);
% 
% idx = (res ==0);
% sCl1 = score(idx,1);
% sCl2 = score(idx,2);
% 
% 
% 
% 
% % plot(score(:,1),score(:,2),'r.') 
% plot(fCl1,fCl2,'r.',sCl1,sCl2,'b.')
% xlabel('Principal component 1')
% ylabel('Principal component 2')
% title('Data projection onto 1st two princ. comp')

% 
% 
% figure;
% idx = (res ==1);
% fCl1 = data(5,idx);
% fCl2 = data(30,idx);
% idx = (res ==0);
% sCl1 = data(5,idx);
% sCl2 = data(30,idx);
% size(fCl1)
% size(sCl2)
% 
% plot(fCl1,fCl2,'r.',sCl1,sCl2,'b.')
% xlabel('feature 5')
% ylabel('feature 30')
% title('2D scatterograms')

% biplot(PC(:,1:2), 'scores',score(:,1:2), 'varlabels',{});
% [pc,score,latent,tsquare] = princomp(data');
% cumsum(latent)./sum(latent)
% pc(:,1:2)
% biplot(pc(:,1:3),'Scores',score(:,1:3),'VarLabels',{})
	