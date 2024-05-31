function addpath_matutil(sub_dir)
%% get current repo path
curr_dir = fileparts(mfilename('fullpath'));
%% add sub module
if nargin > 0
    addpathchk('matlab-utils', sub_dir, curr_dir);
    return
end
%% get sub dirs
subdirs = dir(curr_dir);
subdirs(~[subdirs.isdir]) = [];
subdirs = {subdirs.name};
subdirs(startsWith(subdirs, '.')) = [];
%% add all sub dirs
addpathchk('matlab-utils', subdirs, curr_dir);