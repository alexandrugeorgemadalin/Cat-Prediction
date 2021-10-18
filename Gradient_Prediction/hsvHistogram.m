function [sol] = hsvHistogram(path_to_image, count_bins)
	[H,V,S] = convert(path_to_image);
	[n m] = size(H);
	H = reshape(H,1,m*n);
	S = reshape(S,1,m*n);
	V = reshape(V,1,m*n);
	ranges = 0:1.01/count_bins:1.01;
	h = histc(H,ranges);
	s = histc(S,ranges);
	v = histc(V,ranges);
	sol = [ h(1,1:count_bins) s(1,1:count_bins) v(1,1:count_bins)];
end