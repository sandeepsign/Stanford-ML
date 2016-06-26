function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

lambda = 0;

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

J = (1/m)*( sum( (-y .* (log(sigmoid(X*theta)))) - ((1-y) .* (log(1-sigmoid(X*theta)))) ))   + (lambda/(2*m)) * sum(theta(2:length(theta)) .^ 2) 

%These gradient values gets used in fminunc calls during optimal minimization operations. 
grad = (1/m) * (sum((sigmoid(X*theta) .- y) .* X))  + [ 0; (lambda/m) * theta(2:size(theta,1)) ]' % '0;' is to avoid regularization for theta(0)




% =============================================================

end