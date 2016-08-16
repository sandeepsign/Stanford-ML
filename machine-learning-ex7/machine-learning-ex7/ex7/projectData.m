function Z = projectData(X, U, K)
%PROJECTDATA Computes the reduced data representation when projecting only 
%on to the top k eigenvectors
%   Z = projectData(X, U, K) computes the projection of 
%   the normalized inputs X into the reduced dimensional space spanned by
%   the first K columns of U. It returns the projected examples in Z.
%

% You need to return the following variables correctly.
Z = zeros(size(X, 1), K);  % (m x K) : Z's for each row with reduced 'K' width.

fprintf('Dimensions of X: ')
size(X)

fprintf('Dimensions of U: ')
size(U)

fprintf('Dimensions of K: ')
size(K)
K

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the projection of the data using only the top K 
%               eigenvectors in U (first K columns). 
%               For the i-th example X(i,:), the projection on to the k-th 
%               eigenvector is given as follows:
%                    x = X(i, :)';
%                    projection_k = x' * U(:, k); (1 x m) * (m x K) = (1 x K)
%

Z = X * U(:, 1:K); % (m x n) * (n x K) = (m x K)


% =============================================================

end
