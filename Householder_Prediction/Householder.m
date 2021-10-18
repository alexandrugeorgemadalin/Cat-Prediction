function [Q, R] = Householder(A)
	[m n] = size(A);
	Q = eye(m);
	for i = 1 : min(n,m-1)
        sigma = -norm(A(i:m,i));
		if( A(i,i) < 0)
			sigma = -sigma;
		endif
		vp(1:m,1) = 0;
		vp(i) = A(i,i) + sigma;
		vp(i+1:m) = A(i + 1:m,i);
		beta = sigma * vp(i);
		if beta ~= 0
			A(i,i) = -sigma;
			A(i+1:m,i) = 0;
			for j = i+1:n
				t = vp(i:m)' * A(i:m,j)/beta;
				A(i:m,j) = A(i:m,j) - t*vp(i:m);
			endfor
			
			for j = 1:m
				t = vp(i:m)' * Q(i:m, j) / beta;
				Q(i:m, j) = Q(i:m, j) - t * vp(i:m);
			endfor
		endif
	endfor
   R = A;
   Q = Q';
endfunction