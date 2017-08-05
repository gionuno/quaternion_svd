function [U,S,V] = qsvd(X)
    N = size(X,1);
    M = size(X,2);

    X1 = complex(zeros(N,M), X(:,:,1));
    X2 = complex(  X(:,:,2), X(:,:,3));

    [U,S,V] = svd([X1,X2;-conj(X2),conj(X1)]);
end