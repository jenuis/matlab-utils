function matutil_addpath(module_name)
%% check arguments
if nargin < 1
    module_name = '';
end
%% get sub dirs
curr_file = mfilename('fullpath');

curr_dir = fileparts(curr_file);

subdirs = dir(curr_dir);
%% add path
if ~isempty(module_name)
    assert(any(strcmpi({subdirs(:).name}, module_name)), ['"matlab-utils. ' module_name '" not exist!'])
end

for i=1:length(subdirs)
    subfolder = subdirs(i).name;
    if subfolder(1) == '.' || ...
            ~subdirs(i).isdir || ...
            strcmpi(subfolder, 'license')
        continue
    end
    if ~isempty(module_name) && ~strcmpi(module_name, subfolder)
        continue
    end
    addpath(genpath(fullfile(curr_dir ,subfolder)))
end