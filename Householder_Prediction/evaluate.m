function [percentage] = evaluate(path_to_testset, w, histogram, count_bins)
	dir = dir(path_to_testset);
	path_to_cats = [path_to_testset,dir(4).name,"/"];
	path_to_ncats = [path_to_testset,dir(5).name,"/"];
	cats_imgs = getImgNames([path_to_testset,dir(4).name,"/"]);
	not_cats_imgs =getImgNames([path_to_testset,dir(5).name,"/"]);
	n1 = length(cats_imgs);
	n2 = length(not_cats_imgs);
	percentage = 0;
	if(histogram == "RGB")
		for i = 1:n1
			x = rgbHistogram([path_to_cats, cats_imgs(i,:)],count_bins);
			x(1,length(x)+1) = 1;
			if(w'*x' >= 0)
				percentage++;
			endif
		endfor
		for i = 1:n2
			x = rgbHistogram([path_to_ncats,not_cats_imgs(i,:)],count_bins);
			x(1,length(x)+1) = 1;
			if(w'*x' < 0)
				percentage++;
			endif
		endfor
	elseif ( histogram == "HSV")
		for i = 1:n1
			x = hsvHistogram([path_to_cats, cats_imgs(i,:)],count_bins);
			x(1,length(x)+1) = 1;
			if(w'*x' >= 0)
				percentage++;
			endif
		endfor
		for i = 1:n2
			x = hsvHistogram([path_to_ncats,not_cats_imgs(i,:)],count_bins);
			x(1,length(x)+1) = 1;
			if(w'*x' < 0)
				percentage++;
			endif
		endfor
	end
	percentage = percentage /(n1+n2);
endfunction