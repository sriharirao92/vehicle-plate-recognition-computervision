function output = meanthresh(image, varargin)
% Initialization
numvarargs = length(varargin);      % Only want 3 optional inputs at most
if numvarargs > 3
    error('myfuns:somefun2Alt:TooManyInputs', ...
     'Possible parameters are: (image, [m n], threshold, padding)');
end
 
optargs = {[15 15] 0.1 'replicate'};  % Set defaults
 
optargs(1:numvarargs) = varargin;   % Use memorable variable names
[window, c, padding] = optargs{:};
 
 
% Convert to grayscale double in range 0..1
image = mat2gray(image(:,:,1));
 
% Mean value
mean = averagefilter(image, window, padding);
 
% Set pixel to white if brightnes is above the local neighbourhood
output = zeros(size(image));
output(image >= mean-c) = 1;


