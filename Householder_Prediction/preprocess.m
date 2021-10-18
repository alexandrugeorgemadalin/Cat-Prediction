function [X, y] = preprocess(path_to_dataset, histogram, count_bins)
	director = dir(path_to_dataset);
	cats_path = [ path_to_dataset , director(4).name];
	not_cats_path = [ path_to_dataset , director(5).name];
	cats = dir(cats_path);
	not_cats = dir(not_cats_path);
	n1 = length(cats) -3;
	n2 = length(not_cats) -3;
	N = n1+n2;
	X = zeros(N,3*count_bins);
	y = zeros(N,1);
	y(1:n1,1) = 1;
	y(n1+1:n1+n2,1) = -1;
	if(histogram == "RGB")
		index = 1;
		for i = 3:length(cats)-1
			path_image = [ cats_path ,"/", cats(i).name];
			X(index,:) = rgbHistogram(path_image,count_bins);
			index++;
		endfor
		for j = 3:length(not_cats)-1
			path_image = [ not_cats_path ,"/", not_cats(j).name];
			X(index,:) = rgbHistogram(path_image,count_bins);
			index++;
		endfor	
	elseif (histogram == "HSV")
		index = 1;
		for i = 3:length(cats)-1
			path_image = [ cats_path ,"/", cats(i).name];
			X(index,:) = hsvHistogram(path_image,count_bins);
			index++;
		endfor
		for j = 3:length(not_cats)-1
			path_image = [ not_cats_path ,"/", not_cats(j).name];
			X(index,:) = hsvHistogram(path_image,count_bins);
			index++;
		endfor
	end	
endfunction
