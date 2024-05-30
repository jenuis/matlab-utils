function matutil_addpath(module_name)
%% get current repo path
curr_file = mfilename('fullpath');
curr_dir = fileparts(curr_file);
%% get sub dirs
subdirs = dir(curr_dir);
subdirs(~[subdirs.isdir]) = [];
subdirs = {subdirs.name};
subdirs(startsWith(subdirs, '.')) = [];
%% add all sub dirs
if nargin < 1
    subdirs = cellfun(@(p) genpath(fullfile(curr_dir, p)), subdirs, 'UniformOutput', false);
    addpath(subdirs{:})
    return
end
%% add module
assert(any(strcmpi(subdirs, module_name)), ['"matlab-utils.' module_name '" not exist!'])
addpath(genpath(fullfile(curr_dir, module_name)))