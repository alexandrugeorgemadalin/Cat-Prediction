function [x] = SST(A, b)
	[n m]= size(A);
	x = zeros(m,1);
	x(m) = b(m)/A(m,m);
	for i=m:-1:1
		s=0;
		for j=i+1:m
			s=s+A(i,j)*x(j);
		endfor
		x(i,1)=(b(i)-s)/A(i,i);
   endfor	
endfunction
    
