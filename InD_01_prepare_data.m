%% Infant Homotopic Connectivity - sprepare data
% Bene
clear clc
%% addpath
addpath(genpath('BED'))
%% setpath
base_dir = '/home/bramirez/projects/InfantDevelopment';
data_dir = [base_dir '/data/10k_GSR_smoothed3mm'];
FD_dir = [base_dir '/data/motionFD_rad30'];
%% parcellation
parcellated=0; %change 1 to run parcel and 0 if runnning vertex wise
fname = [base_dir '/data/Parcellation/MarkovCC12_M132_182-area.10k_fs_LR.dlabel.nii'];
chdr = read_cifti(fname);
parcel = chdr.cdata;
n_cortex = length(parcel);
nparcel = length(unique(parcel(parcel>0)));
%% read in lists
fname = 'InD_lists/scan51_data.list';
scan_list = textread(fname, '%s');
nscan = length(scan_list);

fname = 'InD_lists/scan51_run.list';
run_list = importdata(fname);

% fname = 'InD_lists/scan120_state.list';
% tmp = textread(fname, '%s');
% state_list = zeros(size(tmp));
% state_list(contains(tmp, '000')) = 1;
% state_list(contains(tmp, '075')) = 2;
% state_list(contains(tmp, '100')) = 3;
% state_list(contains(tmp, '150')) = 4;
% state_list(contains(tmp, '200')) = 5;

fname = 'InD_lists/scan51_subject.list';
tmp = textread(fname, '%s');
sub_list = zeros(size(tmp));
sub_list(contains(tmp, 'MILO')) = 1;
sub_list(contains(tmp, 'OOPS')) = 2;
sub_list(contains(tmp, 'PETRA')) = 3;

fname = 'InD_lists/scan51_FD30.list';
FD_list = textread(fname, '%s');
%% load FD
nt = zeros(nscan, 1); % num of timepoint per scan
for i=1:nscan
    fname = [FD_dir '/' FD_list{i}];
    mat = importdata(fname);
    nt(i) = length(mat);
end
%% initiate data structure
clear DAT_ts DAT_in
ntimepoint_all = sum(nt);
if parcellated==1
    disp("running parcellated data")
    DAT_ts.ts = zeros(ntimepoint_all, nparcel);

else
    disp("running vertexwise data")
    fname = [data_dir '/' scan_list{1}];
    chdr = read_cifti(fname);
    DAT_ts.ts = zeros(ntimepoint_all, size(chdr.cdata,1));
end


DAT_in.scan             = scan_list;        % scan list
DAT_in.nscan            = nscan;            % num of scans
DAT_in.nt               = nt;               % num of frames per scan
DAT_in.FD_per_sub       = cell(nscan, 1);
DAT_in.gs_per_sub       = cell(nscan, 1);

% concatenate frames
DAT_in.FD               = zeros(ntimepoint_all, 1);
DAT_in.ts_global        = zeros(ntimepoint_all, 1);
DAT_in.frame_idx        = 1:ntimepoint_all;
DAT_in.frame_to_run     = zeros(ntimepoint_all, 1); % run1 run1 ... run1, run2, run2, ... run2...
DAT_in.frame_to_sub     = zeros(ntimepoint_all, 1); 
%DAT_in.frame_to_state   = zeros(ntimepoint_all, 1); 
DAT_in.frame_idx_to_orig = zeros(ntimepoint_all, 1); 
DAT_in.frame_to_scan_path  = cell(ntimepoint_all, 1);
% timeframe index at each scan, e.g. 1,2,...240, 1,2,...240 ...
%% load zscore and concatenate data

for i=1:nscan
    fname = [data_dir '/' scan_list{i}];
    disp(['running ' num2str(i) '...'])
    chdr = read_cifti(fname);
    ntimepoint = size(chdr.cdata,2);
    %score data
    [Nvox Nvols] = size(chdr.cdata);
    for v = 1:Nvox
        chdr.cdata(v,:) = zscore(chdr.cdata(v,:));
    end


    idx1 = sum(nt(1:i)) - nt(i) + 1;
    idx2 = sum(nt(1:i));
    %%
    %DAT_in.scan_to_state(i) = state_list(i);
    % FD
    fname = [FD_dir '/' FD_list{i}];
    FD = importdata(fname);
    DAT_in.FD(idx1:idx2) = FD;
    % frame info
    DAT_in.frame_to_scan(idx1:idx2) = i*ones(ntimepoint,1);
    DAT_in.frame_to_sub(idx1:idx2) = sub_list(i);
    DAT_in.frame_to_run(idx1:idx2) = run_list(i);
    %DAT_in.frame_to_state(idx1:idx2) = state_list(i);
    DAT_in.frame_idx_to_orig(idx1:idx2) = 1:ntimepoint;
    DAT_in.frame_to_scan_path(idx1:idx2) = repmat({scan_list{i}}, ntimepoint, 1);
    % data
    DAT_in.ts_global(idx1:idx2) = mean(chdr.cdata,1);
    %% only extract the cortex data here for testing - NEED TO WORK ON THIS SECTION 
    if parcellated==1
        for ii=1:nparcel
            idx = find(parcel==ii);
            DAT_ts.ts(idx1:idx2,ii) = mean(chdr.cdata(idx,:), 1);
        end
    else
        % vertex-wise
        data=chdr.cdata;
        DAT_ts.ts(idx1:idx2, :) = data';
    end
    %%
    DAT_in.FD_per_sub{i} = FD;
    DAT_in.gs_per_sub{i} = mean(chdr.cdata,1);
end

%% save mat 

if parcellated==1
    fname = [base_dir '/analyses/homotopic_InD/DAT_ts_parcel.mat'];
    save(fname, 'DAT_ts', '-v7.3');
    fname = [base_dir '/analyses/homotopic_InD/DAT_in_parcel.mat'];
    save(fname, 'DAT_in');
    disp('saved parcellated data!')
else
    fname = [base_dir '/analyses/homotopic_InD/DAT_ts_vertex.mat'];
    save(fname, 'DAT_ts', '-v7.3');
    fname = [base_dir '/analyses/homotopic_InD/DAT_in_vertex.mat'];
    save(fname, 'DAT_in');
    disp('saved vertexwise dense data!')
end


%%