function [w] = learn(X, y)
	[n m] = size(X);
	X(:,m+1) = 1;
	[Q,R] = Householder(X);
	w = SST(R,Q'*y);
endfunction
