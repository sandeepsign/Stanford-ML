function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feed-forward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the back-propagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing back-propagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%

%Part 1 - Forward Propagation
%============================

y_matrix = eye(num_labels)(y,:); %(5000x10)

%a2 = sigmoid(Theta1*([ones(size(X,1),1) X]')); %  (25 x 401) * (401 x 5000) = 25 x 5000
%z3 = Theta2*[ones(1,m); a2];  %  (10 x 26) * (26 x 5000)  = 10 x 5000
%a3 = sigmoid(z3'); % 5000 x 10

a1 = [ones(size(X,1),1) X]; %(5000x401)
z2 = a1 * Theta1';  %(5000x401)*(401 x 25)
a2 = sigmoid(z2); %(5000x25)

a2 = [ones(size(a2,1),1) a2]; %(5000x26)
z3 = a2 * Theta2'; %(5000x26)*(26x10)

a3 = sigmoid(z3); %(5000x10)

%[m index]= max(a3, [], 2);
%p = index(:,1);


J =  (1/m) * sum(sum( (-y_matrix .* log(a3)) - ((1 - y_matrix) .* log(1-a3))));
				%(5000x10)* (5000x10)   (5000x10) *    (5000x10)

ruglarization_adjustment = (lambda/(2*m)) * ( sum(sum(  Theta1(:,2:end) .^ 2 )) + sum(sum(  Theta2(:,2:end) .^ 2 )) ) ;

J = J + ruglarization_adjustment;

%Part 2 - Back Propagation
%=========================

d3 = a3 - y_matrix; %(5000x10)
z2 = a1 * Theta1'; % (5000x401)*(401 x 25) = (5000x25)

d2 = d3 * Theta2(:,2:end) .* sigmoidGradient(z2);  %(5000x10) * (25x10) = (5000x25)

Delta1 = d2' * a1; % (25x5000) * %(5000x401) = (25x401) 
Delta2 = d3' * a2 ; %  (10x5000) *  %(5000x26) = (10 x 26)

Theta1_grad = (1/m) * Delta1;
Theta2_grad = (1/m) * Delta2;


%Part 2 - Regularization
%=======================

Theta1(:,1) = 0; % Set first column as Zero.
Theta2(:,1) = 0; % Set first column as Zero.

Theta1_grad = Theta1_grad + (lambda/m) * Theta1;
Theta2_grad = Theta2_grad + (lambda/m) * Theta2;


% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:); Theta2_grad(:)];


end