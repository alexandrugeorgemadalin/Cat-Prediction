function [w] = learn(X, y, lr, epochs)
	[n m] = size(X);
	X(:,1:m) = (X(:,1:m) .- mean(X(:,1:m)))./ std(X(:,1:m));
	X(:,m+1) = 1;
	w = zeros(m+1,1);
	w = -0.1.+((0.2).*rand(m+1,1));
	for epoch = 1: epochs
		idxrand = randi([1,n],1,64);
		Xbatch = X(idxrand,:);
		ybatch = y(idxrand);
		for i = 1:m+1
			s = 0;	
			for j = 1:64
				s = s + (Xbatch(j,:)*w - ybatch(j))*X(j,i);
			endfor
			w(i) = w(i) - s*lr/n;
		endfor
	endfor	
endfunction
