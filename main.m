I = double(imread('lena.jpg'))/255.0;
w = 2;
X = zeros([size(I,1)/w,size(I,2)/w,size(I,3)]);
for i = 0:size(X,1)-1
    for j = 0:size(X,2)-1
        X(i+1,j+1,:)=mean(mean(I(w*i+1:w*i+w,w*j+1:w*j+w,:)));
    end
end

[U,S,V] = qsvd(X);
S = diag(S);
St = sum(S);

D = 4;

Y = zeros(N,M,3,D*D);

p = 3;
for d = 1:D*D
    S_ = S;
    S_(p*d:end) = 0.0;
    Z = U*diag(S_)*V';
    
    Y(:,:,1,d) = imag(Z(1:N,1:M));
    Y(:,:,2,d) = real(Z(1:N,(M+1):(2*M)));
    Y(:,:,3,d) = imag(Z(1:N,(M+1):(2*M)));
end

figure;
for d = 1:D*D
    subplot(D,D,d)
    imshow(Y(:,:,:,d));
end