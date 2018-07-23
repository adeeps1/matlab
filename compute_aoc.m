function val = compute_aoc(f,x)

% COMPUTE_AOC computes Area Over Curve for a single-variable signal. The
% function requires an m-file of 'compute_auc' for computation.
%   * USAGE
%       val = COMPUTE_AOC(f) considers domain to be 0:(length(f)-1).
%       val = COMPUTE_AOC(f,x) does actual computation accordingly.
%   * INPUT
%       f      1-dimensional signal
%       x      (optional) grid for an independent variable
%   * OUTPUT
%       val    computed aoc value
%   * AUTHOR   Kisung You (kyou@nd.edu)
%   * HISTORY
%       0.1. [07/2018] initial implementation.
%
%   See also COMPUTE_AUC.

%% initialize
if (isvector(f)~=1)
    error('* compute_aoc : input "f" must be a vector');
end
n = length(f); % length of signal value
if (nargin < 2)
    x = 1:n;
end
if (~isvector(x))
    error('* compute_aoc : input "x" must be a vector');
end
if (x~=sort(x))
    error('* compute_aoc : input "x" must be sorted');
end
ff = -f;

%% main function utilizing 'compute_auc'
val = compute_auc(ff,x);
end

