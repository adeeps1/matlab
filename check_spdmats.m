function output = check_spdmats(input)

% CHECK_SPDMATS returns a 3d array of square matrices stacked in the 3rd
% dimension. If each slice is neither symmetric nor positive definite, it
% symmetrizes and finds the nearest positive semidefinite matrix. 
%   * USAGE
%       output = CHECK_SPDMATS(input)
%   * INPUT
%       input  a (p-p-N) 3-dimensional array of matrices
%   * OUTPUT
%       output a (p-p-N) 3-dimensional array of matrices
%   * AUTHOR   Kisung You (kyou@nd.edu)
%   * HISTORY
%       0.1. [08/2018] initial implementation.

%% preprocessing
%   1. check 3d array
if (length(size(input))~=3)
    error('* check_spdmats : an input must be an 3d array');
end
%   2. check if symmetric
if (size(input,1)~=size(input,2))
    error('* check_spdmats : each slice must be a square matrix');
end
%   3. parameters and get ready
nslices = size(input,3); % number of slices
p       = size(input,1); % dimension
output  = zeros(p,p,nslices);

%% main part
for i=1:nslices
    %   select
    tgt = input(:,:,i); 
    %   symmetrization
    if (~issymmetric(tgt))
        tgt = (tgt + tgt')/2;
    end
    %   eigen decomposition
    [V,D] = eig(tgt);
    if (sum(diag(D)<=0)>0)
        diagD = diag(D);
        diagD(diagD<=0)=0;
        output(:,:,i) = V*diag(diagD)*V';
    else
        output(:,:,i) = tgt;
    end
end
        



end