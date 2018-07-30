function mat = trf_vec2triu(vec)

% TRF_VEC2TRIU assigns elements from the input vector to the upper diagonal
% parts of a matrix accordingly. Note that the function does NOT pertain to
% the main diagonal part.
%   
%   * USAGE
%       mat = TRF_VEC2TRIU(vec)
%   * INPUT
%       vec    a column vector of length n*(n-1)/2
%   * OUTPUT
%       mat    an (n-by-n) symmetric matrix
%   * AUTHOR   Kisung You (kyou@nd.edu)
%   * HISTORY
%       0.1. [07/2018] initial implementation.
%
%   See also TRF_TRIU2VEC

%% initialize
if (~isvector(vec))
    error("* trf_vec2triu : an input must be a vector");
end

k = length(vec);
n = round(sqrt(2*k+0.25) + 0.5);
mat = zeros(n, n);
mat(triu(ones(n),1) == 1) = vec; % only the upper part
mat = mat + (mat');              % symmetrization
end