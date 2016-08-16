function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label for an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label for X given the 
%   trained weights of a neural network (Theta1, Theta2)
%   here p is a column-vector of same height as X, which has 1 predicted label for each row of X. So total 5000 predictions. 
% size(Theta1) : 25   401
% size(Theta2) : 10   26
% size(X) : 5000    400


% Useful values
m = size(X, 1); % length = 5000
num_labels = size(Theta2, 1); %Number of Labels = 10

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1); % To be returned column-vector of height 5000

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               column-vector of height m=5000, each value is one of the labels between 1 to num_labels=10
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%

a2 = sigmoid(Theta1*([ones(size(X,1),1) X]')); %  (25 x 401) * (401 x 5000) = 25 x 5000
a3 = Theta2*[ones(1,m); a2];  %  (10 x 26) * (26 x 5000)  = 10 x 5000
a3 = sigmoid(a3'); % 5000 x 10

[m index]= max(a3, [], 2);
p = index(:,1)


% =========================================================================


end
