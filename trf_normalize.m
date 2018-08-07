function output = trf_normalize(input,byrow)

% When given a matrix of numeric values, TRF_NORMALIZE does
% "standardization" of each datum stacked as either in a row or column
% manner to have zero mean and standard deviation of 1. 
%
%   * USAGE
%       output = TRF_NORMALIZE(input)       sets 'byrow' as TRUE
%       output = TRF_NORMALIZE(input,byrow)
%   * INPUT
%       input      an (m-by-n) matrix of numeric data
%       byrow      a logical; 'true' for row-wise, 'false' for column-wise
%   * OUTPUT
%       output     an (m-by-n) matrix of normalized data
%   * AUTHOR       Kisung You (kyou@nd.edu)
%   * HISTORY
%       0.1. [08/2018] initial implementation.

%% preprocessing
%   1. must be a matrix
if (length(size(input))~=2)
    error("* trf_normalize : an input must be a matrix.");
end
%   2. byrow
if (nargin < 2)
    byrow=true;
end
if (~islogical(byrow))
    error("* trf_normalize : 'byrow' argument must be a logical.");
end

%% main computation
[m,n] = size(input);
output = zeros(m,n);
if (byrow==true)
    for i=1:m
        tgt = input(i,:);
        tgt = tgt-mean(tgt);
        output(i,:) = tgt/std(tgt);
    end
else
    for i=1:n
        tgt = input(:,i);
        tgt = tgt-mean(tgt);
        output(:,i) = tgt/std(tgt);
end

end