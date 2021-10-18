function [sol] = rgbHistogram(path_to_image, count_bins)
	image = imread(path_to_image);
	Red = image(:,:,1);
	Green = image(:,:,2);
	Blue = image(:,:,3);
	[n m] = size(Red);
	Red = reshape(Red,1,m*n);
	Green = reshape(Green,1,m*n);
	Blue = reshape(Blue,1,m*n);
	binranges = 0:256/count_bins:256;
	r = histc(Red,binranges);
	g = histc(Green,binranges);
	b = histc(Blue,binranges);
	sol = [ r(1,1:count_bins) g(1,1:count_bins) b(1,1:count_bins)];
endfunction