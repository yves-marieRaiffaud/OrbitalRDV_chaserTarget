function AddSubfoldersFilePaths()
    % Make functions in sub-folders available
    currentFolderContents = dir(pwd);
    currentFolderContents (~[currentFolderContents.isdir]) = [];
    for i = 3:length(currentFolderContents)
       addpath(['./' currentFolderContents(i).name]);
    end
    clear i
end