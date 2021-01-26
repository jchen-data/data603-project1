function[X_pca,V,colmean] = myPCA(X,d)
    %d = number of dimensions to output
    %X_pca = output data after PCA
    %X = input data
    n1 = size(X,1);
    
%    %Centering data:
    colmean = mean(X,1);
    X_center = X-repmat(colmean,[n1,1]);

    %Singular value decomp:
    [U,S,V] = svd(X_center);
    X_pca = X_center*V(:,1:d);
end