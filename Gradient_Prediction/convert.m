function [H,V,S] = convert(path_to_image)
	image = imread(path_to_image);
	R = double(image(:,:,1))/255;
	G = double(image(:,:,2))/255;
	B = double(image(:,:,3))/255;
	[n m] = size(R);
	H = zeros(n,m);
	S = zeros(n,m);
	cmax = max(R,G);
	cmax = max(cmax,B);
	cmin = min(R,G);
	cmin = min(cmin,B);
	delta = cmax.-cmin;

	ind = find(cmax == R & delta != 0);
	H(ind) = 60.*mod(((G(ind).-B(ind))./delta(ind)),6);
	ind = find(cmax == G  & delta != 0);
	H(ind) = 60.*(((B(ind).-R(ind))./delta(ind))+2);
	ind = find(cmax == B  & delta != 0);
	H(ind) = 60.*(((R(ind).-G(ind))./delta(ind))+4);
	H = H/360;
	ind = find(cmax != 0 );
	S(ind) = delta(ind)./cmax(ind);
	V = cmax;
endfunction	