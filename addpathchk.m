function addpathchk(repo_name, sub_folder, repo_root)
%% check argument
if ischar(sub_folder)
    sub_folder = {sub_folder};
else
    sub_folder = sort(sub_folder);
end
%% check if env_name is set
env_name = strjoin(sub_folder, '-');
env_name = [upper(repo_name) '-' upper(env_name) '-SET'];
if ~isempty(getenv(env_name))
    return
end
%% check sub folder
sub_paths = cellfun(@(p) genpath(fullfile(repo_root, p)), sub_folder, 'UniformOutput', false);
inds_empty = strcmpi(sub_paths, '');
assert(all(~inds_empty), ['"' strjoin(sub_folder(inds_empty), ',') '" not exist in "' repo_name '"!'])
%% add to path
addpath(sub_paths{:});
setenv(env_name, 'true')