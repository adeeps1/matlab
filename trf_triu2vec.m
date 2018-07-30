function vec = trf_triu2vec(mat)

% TRF_TRIU2VEC extracts the upper triangular part of a symmetric square
% matrix and gathers the elements as a column vector.
%   * USAGE
%       vec = TRF_TRIU2VEC(mat)
%   * INPUT
%       mat    an (n-by-n) symmetric matrix
%   * OUTPUT
%       vec    a column vector of length n*(n-1)/2
%   * AUTHOR   Kisung You (kyou@nd.edu)
%   * HISTORY
%       0.1. [07/2018] initial implementation.
%
%   See also TRF_VEC2TRIU

%% initialize
%   1. should be a matrix
if (~ismatrix(mat))
    error("* trf_triu2vec : an input must be a matrix.");
end
%   2. square matrix
if (size(mat,1)~=size(mat,2))
    error("* trf_triu2vec : an input must be a square matrix.");
end
%   3. symmetric matrix
if (~issymmetric(mat))
    error("* trf_triu2vec : an input must be a symmetric matrix.");
end

%% main part
mask = triu(true(size(mat)),1);
vec = mat(mask);

end