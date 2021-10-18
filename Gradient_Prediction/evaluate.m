function [percentage] = evaluate(path_to_testset, w, histogram, count_bins)
	dir = dir(path_to_testset);
	path_to_cats = [path_to_testset,dir(4).name,"/"];
	path_to_ncats = [path_to_testset,dir(5).name,"/"];
	cats_imgs = getImgNames([path_to_testset,dir(4).name,"/"]);
	not_cats_imgs =getImgNames([path_to_testset,dir(5).name,"/"]);
	n1 = length(cats_imgs);
	n2 = length(not_cats_imgs);
	[X y] = preprocess(path_to_testset,histogram,count_bins);
	[n m] = size(X);
	X(:,1:m) = (X(:,1:m) .- mean(X(:,1:m)))./ std(X(:,1:m));
	X(:,m+1) = 1;
	percentage = 0;
	for i = 1:n1 
		x = X(i,:);
		if(x*w >= 0)
			percentage++;
		endif
	endfor
	for i = (n1+1):(n1+n2)
		x = X(i,:);
		if(x*w < 0)
			percentage++;
		endif
	endfor
	percentage = percentage /(n1+n2);	
endfunction