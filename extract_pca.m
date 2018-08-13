function output = extract_pca(input,nmodes)

% EXTRACT_PCA computes mean signals from a given input matrix of stacked
% signals. It takes principal components as representative signals. Because
% of this, each mean signal has l2 norm of 1. 
%   * USAGE
%       output = EXTRACT_PCA(input)        extracts a single mean signal.
%       output = EXTRACT_PCA(input,nmodes) extracts (nmodes) mean signals.
%   * INPUT
%       input   (time x nsignal) matrix of input signals.
%       nmodes  number of mean signals to be extract; default is 1.
%   * OUTPUT
%       output  (time x nmodes) matrix of mean signals. 
%   * AUTHOR    Kisung You (kyou@nd.edu)
%   * HISTORY
%       0.1. [08/2018] initial implementation.

%% preprocessing
if (length(size(input))~=2)
    error("* extract_pca : an input must be a matrix.");
end
if (nargin < 2)
    nmodes = 1;
end
[~, nsignal] = size(input);
if ((nmodes<1)||(nmodes>=nsignal))
    error("* extract_pca : 'nmodes' must be in [1,nsignal).");
end

%% compute eigen
[V,~] = eig(cov(input'));
output = V(:,1:nmodes);
end