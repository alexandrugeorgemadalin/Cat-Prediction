function [X, y] = preprocess(path_to_dataset, histogram, count_bins)
	dir = dir(path_to_dataset);
	path_to_cats = [path_to_dataset,dir(4).name,"/"];
	path_to_ncats = [path_to_dataset,dir(5).name,"/"];
	cats_imgs = getImgNames([path_to_dataset,dir(4).name,"/"]);
	not_cats_imgs =getImgNames([path_to_dataset,dir(5).name,"/"]);
	n1 = length(cats_imgs);
	n2 = length(not_cats_imgs);
	N = n1+n2;
	X = zeros(N,3*count_bins);
	y = zeros(N,1);
	y(1:n1,1) = 1;
	y(n1+1:n1+n2,1) = -1;
	if(histogram == "RGB")
		index = 1;
		for i = 1:n1
			X(index,:) = rgbHistogram([path_to_cats, cats_imgs(i,:)],count_bins);
			index++;
		endfor
		for j = 1:n2
			X(index,:) = rgbHistogram([path_to_ncats,not_cats_imgs(i,:)],count_bins);
			index++;
		endfor	
	elseif (histogram == "HSV")
		index = 1;
		for i = 1:n1
			X(index,:) = hsvHistogram([path_to_cats, cats_imgs(i,:)],count_bins);
			index++;
		endfor
		for j = 1:n2
			X(index,:) =  hsvHistogram([path_to_ncats,not_cats_imgs(i,:)],count_bins);
			index++;
		endfor
	end	
endfunction
