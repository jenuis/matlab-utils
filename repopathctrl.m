function repopathctrl(repo_path, sub_module, operation)
%% check argument
is_op_add = strcmpi(operation, 'add');
assert( is_op_add || ...
    strcmpi(operation, 'rm'), ...
    '"operation" should be "add" or "rm"!')
[repo_top, repo_name] = fileparts(repo_path);
if ischar(sub_module)
    sub_module = {sub_module};
else
    sub_module = sort(sub_module);
end
%% get the value of env_name
env_name = strjoin(sub_module, '-');
env_name = [upper(repo_name) '-' upper(env_name) '-SET'];
env_value = getenv(env_name);
if isempty(env_value) && ~is_op_add
    return
end
%% check if it is necessary to continue
if is_op_add 
    path_fun = @addpath;
    env_set_value = 'true';
else
    path_fun = @rmpath;
    env_set_value = 'false';
end

if strcmpi(env_value, env_set_value)
    return
end
%% check if the sub_module exists
sub_paths = cellfun(@(p) genpath(fullfile(repo_top, repo_name, p)), sub_module, 'UniformOutput', false);
inds_empty = strcmpi(sub_paths, '');
assert(all(~inds_empty), ['"' strjoin(sub_module(inds_empty), ',') '" not exist in "' repo_name '"!'])
%% add or remove path
path_fun(sub_paths{:});
setenv(env_name, env_set_value)