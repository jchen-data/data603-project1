function[y_pred]=myKNN(x_train,y_train,x_test,K,l)
    %K = neighbors
    %l = norm

    N_tr = size(x_train,1);
    N_ts = size(x_test,1);
    y_pred = zeros(N_ts,1);
    for i = 1:N_ts
       tempdiffs = repmat(x_test(i,:),[N_tr,1]) - x_train;
       tempdists = vecnorm(tempdiffs,l,2);
       [tempdists,I] = sort(tempdists,1,'ascend');
       y_pred(i) = mode(y_train(I(1:K)));
    end

end