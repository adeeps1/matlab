function vec = trf_vech(mat)

% TRF_VECH extracts the upper triangular part as well as the main diagonal
% part of a matrix and gathers the elements as a column vector. The
% function performs a job in correspondance with the wikipedia page.
%   * USAGE
%       vec = TRF_VECH(mat)
%   * INPUT
%       mat    an (n-by-n) matrix
%   * OUTPUT
%       vec    a column vector of length n*(n+1)/2
%   * AUTHOR   Kisung You (kyou@nd.edu)
%   * HISTORY
%       0.1. [08/2018] initial implementation.
%
%   See also TRF_IVECH



%% preprocessing
%   1. should be a matrix
if (~ismatrix(mat))
    error("* trf_vech : an input must be a matrix.");
end
%   2. square matrix
if (size(mat,1)~=size(mat,2))
    error("* trf_vech : an input must be a square matrix.");
end

%% main part
mask = triu(true(size(mat)));
vec  = mat(mask);
end