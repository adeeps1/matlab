function val = compute_area(f,x)

% COMPUTE_AREA computes area bounded by the curve. It returns summation of
% results from 'compute_auc' and 'compute_aoc'.
%   * USAGE
%       val = COMPUTE_AREA(f) considers domain to be 0:(length(f)-1).
%       val = COMPUTE_AREA(f,x) does actual computation accordingly.
%   * INPUT
%       f      1-dimensional signal
%       x      (optional) grid for an independent variable
%   * OUTPUT
%       val    computed aoc value
%   * AUTHOR   Kisung You (kyou@nd.edu)
%   * HISTORY
%       0.1. [07/2018] initial implementation.
%
%   See also COMPUTE_AUC, COMPUTE_AOC


%% initialize
if (isvector(f)~=1)
    error('* compute_area : input "f" must be a vector');
end
n = length(f); % length of signal value
if (nargin < 2)
    x = 1:n;
end
if (~isvector(x))
    error('* compute_area : input "x" must be a vector');
end
if (x~=sort(x))
    error('* compute_area : input "x" must be sorted');
end

%% let's iterate over signal
val = 0.0;
for i=1:(n-1)
    %   1. define values
    h = abs(x(i+1)-x(i)); % width
    a = f(i);    % left-end point
    b = f(i+1);  % right-end point
    %   2. case separation
    if ((a>=0)&&(b>=0))
        val = val + ((a+b)*h/2);
    elseif ((a<0)&&(b<0))
        a = abs(a);
        b = abs(b);
        val = val + ((a+b)*h/2);
    elseif ((a>=0)&&(b<0))
        h1 = abs(a)/(abs(a)+abs(b))*h;
        h2 = h-h1;
        val = val + (abs(a)*h1/2) + (abs(b)*h2/2);
    elseif ((a<0)&&(b>=0))
        h1 = abs(a)/(abs(a)+abs(b))*h;
        h2 = h-h1;
        val = val + (abs(a)*h1/2) + (abs(b)*h2/2);
    else
        error('weird');
    end
end