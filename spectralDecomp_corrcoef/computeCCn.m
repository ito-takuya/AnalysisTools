%Taku Ito
%10/14/13
%MatLab script to compute correlation coefficient in Fourier space given two arrays of complex Fourier coefficients,
%i.e., two complex outputs of 'computeFourierCoeff.m' function 
%Let f and g be the corresponding original time series arrays



function [ccn] = computeCCn(c1, c2, f, g)
	%Compute spectral decomposition of correlation coefficient, given two arrays of complex coefficients of Fourier series
	%PARAMETER DESCRIPTION: Let c1, c2 be the complex coefficients of two distinct Fourier series.  
	%Let f, g be the two original time series from which c1 and c2 were derived from (using computeFourierCoeff.m)

	if (length(c1)==length(c2))
		N = length(f);
	else
		['ERROR: Two input arrays must be of the same length!']
	end
	
	%Create ccn array
	ccn = zeros(1,length(c1));
	
	%compute D (i.e., the denominator for CCn, i.e., the 'D' in equation (15) of Cordes et al., 2000 in the Appendix)
	fsquare = zeros(length(f),1);
	gsquare = zeros(length(g),1);
	
	for i=1:length(f)
		fsquare(i,1) = f(1,i)^2;
		gsquare(i,1) = g(1,i)^2;
	end
	
	fsum = sum(fsquare);
	gsum = sum(gsquare);
	D = sqrt(fsum * gsum);
	
	%compute CCn for each coefficient in the Fourier series (for N coefficients)
	for i = 1:length(ccn)
		ccn(i) = (N * (real(c1(i))*real(c2(i)) + imag(c1(i))*imag(c2(i))))/D; %See equation (15) from Appendix in Cordes et al., 2000.
	end
	
end
	
	