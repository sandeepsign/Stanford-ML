function [lambda_vec, error_train, error_val] = ...
    validationCurve(X, y, Xval, yval)
%VALIDATIONCURVE Generate the training and validation errors needed to
%plot a validation curve that we can use to select lambda
%   [lambda_vec, error_train, error_val] = ...
%       VALIDATIONCURVE(X, y, Xval, yval) returns the train
%       and validation errors (in error_train, error_val)
%       for different values of lambda. You are given the training set (X,
%       y) and validation set (Xval, yval).
%

% Selected values of lambda (you should not change this)
lambda_vec = [0 0.001 0.003 0.01 0.03 0.1 0.3 1 3 10]';

% You need to return these variables correctly.
error_train = zeros(length(lambda_vec), 1);
error_val = zeros(length(lambda_vec), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return training errors in 
%               error_train and the validation errors in error_val. The 
%               vector lambda_vec contains the different lambda parameters 
%               to use for each calculation of the errors, i.e, 
%               error_train(i), and error_val(i) should give 
%               you the errors obtained after training with 
%               lambda = lambda_vec(i)
%
% Note: You can loop over lambda_vec with the following:
%
       for i = 1:length(lambda_vec)
           lambda = lambda_vec(i);
           % Compute train / val errors when training linear 
           % regression with regularization parameter lambda
           % You should store the result in error_train(i)
           % and error_val(i)
		   
			theta = trainLinearReg(X, y, lambda);	

			%Compute train/cross validation errors using training examples
			[error_train(i),grad_train]=linearRegCostFunction(X,y,theta,0); 
			[error_val(i),grad_val]=linearRegCostFunction(Xval,yval,theta,0);
          
       end
	   
   
%
%	Some Notes: 
%   The submit grader doesn't care what is in your plot. It uses a different test case, with a different data set.
%   
%   train using the whole training set and a value for lambda
%   measure Jtrain and Jcv using the entire training and validation sets, with lambda set to 0
%   Here are my validation curve data results running ex5.m
%   
%   lambda          Train Error     Validation Error
%    0.000000       0.096879        7.402780
%    0.001000       0.159985        17.399495
%    0.003000       0.176925        17.347999
%    0.010000       0.221821        17.033886
%    0.030000       0.281850        12.829462
%    0.100000       0.459318        7.587013
%    0.300000       0.921760        4.636833
%    1.000000       2.076188        4.260626
%    3.000000       4.901351        3.822907		%%%% This is the lowest validation error for lambda = 3.0 
%    10.000000      16.092213       9.945509


% =========================================================================

end
