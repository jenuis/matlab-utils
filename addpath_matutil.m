function addpath_matutil(sub_module, operation)
%% check argument
if nargin < 2
    operation = 'add';
end
if nargin < 1
    sub_module = '';
end
%% get current repo path
curr_dir = fileparts(mfilename('fullpath'));
%% add sub module
if ~isempty(sub_module)
    repopathctrl(curr_dir, sub_module, operation);
    return
end
%% get sub dirs
subdirs = dir(curr_dir);
subdirs(~[subdirs.isdir]) = [];
subdirs = {subdirs.name};
subdirs(startsWith(subdirs, '.')) = [];
%% add all sub dirs
repopathctrl(curr_dir, subdirs, operation);