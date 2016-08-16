function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%	K: No of centroids, m: No of training examples
%   Note the size of centroids : K x n (No of centroids x no of features in each row of X), 
%   So, Note that: EACH CENTROID IS OF SAME WIDTH AS EACH ROW OF X.

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1); % m x 1 : index of the centroid, which has minimumn distance for this m'th row of X

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%

distance = zeros(size(X,1), K);

%Here instead of looping through X's each row, we loop through each centroid. 
for i=1:K
		diffs = bsxfun(@minus, X, centroids(i, :)); % Also, diffs = X -  centroids(i, :) ;  works fine, but bsxfun() has much more capabilities, which can be used.
		distance(: , i) = sum(diffs.^2, 2);
end

[smallesValueInEachRow , indexOfSmallestValueInEachRow] = min(distance, [], 2); % Find the smallest values row-wise. 'indexOfSmallestValueInEachRow' is row-vector.

idx = indexOfSmallestValueInEachRow;

% =============================================================

end

