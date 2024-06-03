function file_path = file_location(file_name)
file_path = fileparts(which(file_name));
warning('Deprecated! Use "which" instead.')
return
sp = path;
sp = strsplit(sp, ':');

found = 0;
for i=1:length(sp)
    file_path = sp{i};
    if exist(fullfile(file_path, file_name), 'file')
        found = 1;
        break
    end
end

if ~found
    file_path = [];
end
