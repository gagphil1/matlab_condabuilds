%ENV_SETUP Manage the conda/Matlab environment.
%   ENV_SETUP (without arguments) will setup paths of included Matlab packages.
%
%   ENV_SETUP(N1, N2, ...) will only add paths of the pachages N1, N2, etc. 
%
%   ENV_SETUP can also be called with option-arguments:
%      ENV_SETUP -pwd: print base path of libs.
%      ENV_SETUP -cd: change working directory to the env.
%      ENV_SETUP -list: list of libraries.
%      ENV_SETUP -conda: activate the conda environement.
%      ENV_SETUP -setup: prepare paths of packages. Same as ENV_SETUP alone.

function out = env_setup(varargin)
    % Basepath of lib.
    basedir = fileparts(mfilename('fullpath'));

    % Configurable options.
    config_file = fullfile(basedir, 'env_config.json');
    if exist(config_file, 'file')
        params = loadjson(config_file);
    else
        params = struct();
    end

    % List of libs.
    libs = list_libs(basedir);
        
    % Parse options.
    if nargin==1 && strcmpi(varargin{1}, '-pwd')
        out = basedir;
    elseif nargin==1 && strcmpi(varargin{1}, '-cd')
        cd(basedir);
    elseif nargin==1 && strcmpi(varargin{1}, '-conda')
        activate_conda(basedir, params);
    elseif nargin==1 && strcmpi(varargin{1}, '-list')
        if nargout
            out = libs;
        else
            fprintf('List of Matlab packages:\n');
            for i=1:length(libs)
                fprintf('   %s\n', libs{i});
            end
        end
    elseif (nargin==0) || strcmpi(varargin{1}, '-setup')
        for i=1:length(libs)
            activate(libs{i}, basedir, params);
        end
    else
        error('Bad argument');
    end
end

function libs = list_libs(current_dir)
    dir_contents = dir(current_dir);
    sel = ~strcmp('.', {dir_contents.name}) ...
          & ~strcmp('..', {dir_contents.name}) ...
          & ~strcmpi('private', {dir_contents.name}) ...
          & [dir_contents.isdir];
      
    libs = {dir_contents(sel).name};
end

function activate(lib, basedir, params)
    setup_script = fullfile(basedir, [lib, '_setup.m']);
    if exist(setup_script, 'file')
        run(setup_script);
    else
        lib_path = fullfile(basedir, lib);
        addpath(lib_path);
    end
end

function activate_conda(basedir, params)
    if isfield(params, 'conda') && isfield(params.conda, 'path') ...
        && ~isempty(params.conda.path)
        env_dir = params.conda.path;
    else
        env_dir = fileparts(basedir);
    end
    
    if isfield(params, 'conda') && isfield(params, 'conda.env') ...
        && ~isempty(params.conda.env)
        env_name = params.conda.path;
    else
        env_name = fileparts(basedir);
    end
    
    if ispc
        prev_path = getenv('PATH');
        prev_parts = split(prev_path, ';');
        if ~any(strcmpi(fullfile(env_dir, 'Scripts'), prev_parts))
            new_path = [...             %env_dir, ';', ...
                fullfile(env_dir, 'Library\usr\bin'), ';', ...
                fullfile(env_dir, 'Library\bin'), ';', ...
                fullfile(env_dir, 'Scripts'), ';', ...
                fullfile(env_dir, 'bin'), ';'];

            setenv('PATH', [new_path, getenv('PATH')]);
        end
    else isunix || ismac
        disp('Not supported yet.');
    end
    
    if ~isempty(env_name)
        system(sprintf('conda activate %s', env_name));
    end
end

% After startconda
%CONDA_DEFAULT_ENV=base
%CONDA_EXE=C:\Users\gagphil1\anaconda\Scripts\conda.exe
%CONDA_PREFIX=C:\Users\gagphil1\anaconda
%CONDA_PROMPT_MODIFIER=(base)
%CONDA_PYTHON_EXE=C:\Users\gagphil1\anaconda\python.exe
%CONDA_SHLVL=1
%PATH=/cygdrive/c/Users/gagphil1/anaconda:/cygdrive/c/Users/gagphil1/anaconda/Library/mingw-w64/bin:/cygdrive/c/Users/gagphil1/anaconda/Library/usr/bin:/cygdrive/c/Users/gagphil1/anaconda/Library/bin:/cygdrive/c/Users/gagphil1/anaconda/Scripts:/cygdrive/c/Users/gagphil1/anaconda/bin:/cygdrive/c/Users/gagphil1/anaconda/Scripts
%
% After activate science_env
%CONDA_DEFAULT_ENV=science_env
%CONDA_EXE=C:\Users\gagphil1\anaconda\Scripts\conda.exe
%CONDA_PREFIX=C:\Users\gagphil1\anaconda\envs\science_env
%CONDA_PREFIX_1=C:\Users\gagphil1\anaconda
%CONDA_PROMPT_MODIFIER=(science_env)
%CONDA_PYTHON_EXE=C:\Users\gagphil1\anaconda\python.exe
%CONDA_SHLVL=2
%PATH=/c/Users/gagphil1/anaconda/envs/science_env:/mingw-w64/bin:/usr/bin:/bin:/c/Users/gagphil1/anaconda/envs/science_env/Scripts:/c/Users/gagphil1/anaconda/envs/science_env/bin:/c/Users/gagphil1/anaconda:/c/Users/gagphil1/anaconda/Library/mingw-w64/bin:/c/Users/gagphil1/anaconda/Library/usr/bin:/c/Users/gagphil1/anaconda/Library/bin:/c/Users/gagphil1/anaconda/Scripts:/c/Users/gagphil1/anaconda/bin:/c/Users/gagphil1/anaconda/Scripts:

