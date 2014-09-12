%Taku Ito
%10/15/13

function ccn_seed = specDecompOfCCn(v1, v2, samplingRate)
	%Construct Main Function for computing spectral decomposition of correlation coefficient from a seed voxel to all other voxels
	%PARAMETERS: v1 and v2 are time series, samplingRate is the samplingRate
	%Output: A 1D array of the spectral decomposition of the correlation coefficient between time series 1 and time series 2
	%(N.B. If you sum over the output, you will compute the correlation coefficient of the two time series.)

	
	%De-mean time series
	v1 = v1 - mean(v1);
	v2 = v2 - mean(v2);
	
	%Compute complex Fourier Coefficients
	c1 = computeFourierCoeff(v1);
	c2 = computeFourierCoeff(v2);
	
	%compute spectral decomposition of correlation coefficient
	ccn_seed = computeCCn(c1, c2, v1, v2);
	
	xaxis = [0:(samplingRate/2)/((length(v1)/2)):(samplingRate/2)];
	length(xaxis)
	%round xaxis decimals
	
	xaxis_plot = linspace(xaxis(1), xaxis(length(xaxis)), 8); %plot 8 points on xaxis
	xaxis_plot = round(xaxis_plot*1000)/1000;
	
    if nargin > 2
        plot(ccn_seed)
        set(gca, 'XTickLabel', xaxis_plot)
        ylabel('CCn')
        xlabel('Frequency (Hz)')
        title('Spectral Decomposition of the Correlation Coefficient')
    end
	
end