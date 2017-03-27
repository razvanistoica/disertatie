function [vmfcc] = FeatureSpectralMfccs(X, f_s)

     iNumCoeffs  = 13;
    
    % allocate memory
    vmfcc       = zeros(iNumCoeffs, size(X,2));

    H           = ToolMfccFb(size(X,1), f_s);
    T           = GenerateDctMatrix (size(H,1), iNumCoeffs);
 
    for (n = 1:size(X,2))
        % compute the mel spectrum
        X_Mel       = log10(H * X(:,n)+1e-20);

        % calculate the mfccs
        vmfcc(:,n)  = T * X_Mel;
    end
end
