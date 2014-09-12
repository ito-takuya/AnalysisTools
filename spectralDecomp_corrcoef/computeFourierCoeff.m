%Taku Ito
%Spectral Decomposition of the Correlation Coefficient
%Based on Cordes et al., 2000

function [complex, A, B] = computeFourierCoeff(timeseries)
	%%
	%Compute Fourier Coefficients - code is adapted from http://people.uncw.edu/hermanr/signals/Notes/Signals.htm, but with the addition of computing the complex coefficients based off of Euler's formula.
	%
	% DFT in a compact implementation
	%
	N=length(timeseries);
 
	% Compute the matrices of trigonometric functions
	p=1:floor(N/2)+1;
	n=1:N;
	C=cos(2*pi*n'*(p-1)/N);
	S=sin(2*pi*n'*(p-1)/N);
 
	% Compute Fourier Coefficients
	A=2/N*timeseries*C;
	B=2/N*timeseries*S;
	A(floor(N/2)+1)=A(floor(N/2)+1)/2;

	%Compute Complex Coefficients
	complex = (A - sqrt(-1)*B)/2;
 
	% Reconstruct Signal - pmax is number of frequencies used in increasing order
	pmax=p;
	timeseriesnew=A(1)/2+C(:,2:pmax)*A(2:pmax)'+S(:,2:pmax)*B(2:pmax)';
 
	% % Plot Data
	% plot(timeseries,'o')
	%  
	% % Plot reconstruction over data
	% hold on
	% plot(timeseriesnew,'r')
	% hold off  

end