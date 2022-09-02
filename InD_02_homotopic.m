function [DAT] = InD_02_homotopic(output_prefix, parcellated, FD_thresh)
%% Homotopic Connectivity Analysis
% Bene
clear clc
output_prefix='Fitng_surf_results_n197_runs'
parcellated=0;
FD_thresh=0.2;

%% addpath
addpath(genpath('BED'))
%% stpath
base_dir = '/home/bramirez/projects/InfantDevelopment';
data_dir = [base_dir '/analyses/homotopic_InD/'];

WB_DIR = '/home2/txu/lfcd/workbench/v1.2.3/bin_linux64';
work_dir = pwd;

%load('BED_xt_cmaps.mat');
fname=[base_dir '/data/example_ciftis/FAKEnifti.example_data.10k_fs_LR.nii.gz'];
hdr_example = load_nifti(fname);
fcifti_example = [ base_dir '/data/example_ciftis/cifti.example_data.10k_fs_LR.dscalar.nii'];
%% parcellation
%parcellated=0; %change 1 to run parcel and 0 if runnning vertex wise

fname = [base_dir '/data/Parcellation/MarkovCC12_M132_182-area.10k_fs_LR.dlabel.nii'];
chdr = read_cifti(fname);
parcel = chdr.cdata;
n_cortex = length(parcel);
nparcel = length(unique(parcel(parcel>0)));

%% load in data
if parcellated==1
    disp("running parcellated data")
    fname = [base_dir '/analyses/homotopic_InD/DAT_ts_parcel_runs.mat'];
    load(fname); % load in DAT_ts
    fname = [base_dir '/analyses/homotopic_InD/DAT_in_parcel_runs.mat'];
    load(fname); % load in DAT_in
else
    disp("running vertexwise data")
    fname = [base_dir '/analyses/homotopic_InD/DAT_ts_vertex_runs.mat'];
    load(fname); % load in DAT_ts
    fname = [base_dir '/analyses/homotopic_InD/DAT_in_vertex_runs.mat'];
    load(fname); % load in DAT_in
end


%% ======================================================
%% cluster and output setting
prefix = sprintf('%s_FD-thr-%d_parcellated-%d', output_prefix, FD_thresh, parcellated);
%results_v1 made 04/28/2022 for fit.ng conference before flux. 
fig_dir = [data_dir '/results_v1/' prefix]; mkdir(fig_dir);
%% create tmask (temporal mask)
%FD_thresh=0.3;
tmask = zeros(size(DAT_in.FD));
tmask = DAT_in.FD <FD_thresh;


%% threshold the data and data info ------ need to be finished
%DAT_ts.ts_raw = DAT_ts.ts;
DAT_ts.ts = DAT_ts.ts(tmask>0,:);
%Taking out FD thresh, because only using masked data for clustering, then
%imputing the data
DAT_in.frame_idx = DAT_in.frame_idx(tmask>0);
DAT_in.frame_to_sub = DAT_in.frame_to_sub(tmask>0);
DAT_in.frame_to_scan = DAT_in.frame_to_scan(tmask>0);
DAT_in.ts_global = DAT_in.ts_global(tmask>0);
DAT_in.frame_to_run = DAT_in.frame_to_run(tmask>0);
DAT_in.frame_to_scan_path = DAT_in.frame_to_scan_path(tmask>0);
DAT_in.frame_idx_to_orig = DAT_in.frame_idx_to_orig(tmask>0);
DAT_in.FD = DAT_in.FD(tmask>0);

%% set up hemesphere indices run homotopic connectivity on ever session/subject for parcel or vertex data
%check to see if this needs to be updated when doing parcel data. Probably
%lol add if parcellated flag later
if parcellated==1
    disp("running parcellated data")
    tmp_left=1:1:91; %% hard code warning incase using different parcellation
    ix_left=1:1:91;
    tmp_right=92:1:182;
    ix_right=92:1:182;
    tmp_sub=zeros(1,6603);
    %ix_sub=17795:1:24397;
    tmp_wall=zeros(1,2690);
    %ix_wall=24398:1:27087;
    data_parcel=[ ix_left'; ix_right'];
    data_parcel=zeros(1,length(data_parcel));
    nsubj = length(unique(DAT_in.frame_to_sub));
    n=0;
    % running VMHC
    tic
    for s=1:nsubj
        sub_idx=find(DAT_in.frame_to_sub==s);
        sub_sessions=DAT_in.frame_to_run(DAT_in.frame_to_sub==s);
        n_sess = length(unique(sub_sessions));
        for ss=1:n_sess
            n=n+1;
            ses_ix=find(DAT_in.frame_to_sub == s & DAT_in.frame_to_run == ss);
            data_left=DAT_ts.ts(ses_ix,tmp_left);
            data_right=DAT_ts.ts(ses_ix,tmp_right);
            Hcorr=zeros(1,length(tmp_left));
            data_parcel=zeros(1,length(data_parcel));
            for c=1:length(tmp_left)
                Hcorr(c)=corr(data_left(:,c),data_right(:,c));
            end
            data_parcel=[ Hcorr'; Hcorr'];
            all_VMHC_1hem_results(n,:)=Hcorr';
            %turning parcel into cifti format
            pdata=zeros(length(parcel),1);
            for p = 1:nparcel
                ix_p=find(parcel==p);
                curval=data_parcel(p);
                pdata(ix_p)=curval;
            end
            
            data_cifti=[ pdata;tmp_sub';tmp_wall'];
            
            all_VMHC_2hem_for_cifti(n,:)=data_cifti;
            
            % save to cifti
            cname=char(unique(DAT_in.frame_to_scan_path(ses_ix)));
            cname=[cname(1:end-13) '_HomotopicConn.txt'];
            ftxt = [fig_dir '/' cname];
            data = data_cifti;
            dlmwrite(ftxt, data, 'delimiter', '\t', 'precision', 8);
            cmd = sprintf('%s/wb_command -cifti-convert -from-text %s %s %s', ...
                WB_DIR, ftxt, fcifti_example, [ftxt(1:end-3) 'dscalar.nii']);
            system(cmd)
        end
    end
    toc
    
else
    disp("running vertex data")
    %setting up variables and hemispheres
    tmp_left=1:1:8897;
    ix_left=1:1:8897;
    tmp_right=8898:1:17794;
    ix_right=8898:1:17794;
    tmp_sub=zeros(1,6603);
    ix_sub=17795:1:24397;
    tmp_wall=zeros(1,2690);
    ix_wall=24398:1:27087;
    data_cifti=[ ix_left'; ix_right';tmp_sub';tmp_wall'];
    data_cifti=zeros(1,length(data_cifti));
    all_VMHC_2hem_for_cifti=zeros(DAT_in.nscan,length(data_cifti));
    all_VMHC_1hem_results=zeros(DAT_in.nscan,length(tmp_left));
    nsubj = length(unique(DAT_in.frame_to_sub));
    n=0;
    % running VMHC
    tic
    for s=1:nsubj
        disp(s)
        sub_idx=find(DAT_in.frame_to_sub==s);
        sub_sessions=DAT_in.frame_to_run(DAT_in.frame_to_sub==s);
        n_sess = length(unique(sub_sessions));
        for ss=1:n_sess
            n=n+1;
            ses_ix=find(DAT_in.frame_to_sub == s & DAT_in.frame_to_run == ss);
            data_left=DAT_ts.ts(ses_ix,tmp_left);
            data_right=DAT_ts.ts(ses_ix,tmp_right);
            Hcorr=zeros(1,length(tmp_left));
            data_cifti=zeros(1,length(data_cifti));
            for c=1:length(tmp_left)
                Hcorr(c)=corr(data_left(:,c),data_right(:,c));
            end
            data_cifti=[ Hcorr'; Hcorr';tmp_sub';tmp_wall'];
            all_VMHC_2hem_for_cifti(n,:)=data_cifti;
            all_VMHC_1hem_results(n,:)=Hcorr';
            % save to cifti
            cname=char(unique(DAT_in.frame_to_scan_path(ses_ix)));
            cname=[cname(1:end-13) '_HomotopicConn.txt'];
            ftxt = [fig_dir '/' cname];
            data = data_cifti;
            dlmwrite(ftxt, data, 'delimiter', '\t', 'precision', 8);
            cmd = sprintf('%s/wb_command -cifti-convert -from-text %s %s %s', ...
                WB_DIR, ftxt, fcifti_example, [ftxt(1:end-3) 'dscalar.nii']);
            system(cmd)
        end
    end
    toc
    
end



%% save outputs
DAT_in.all_VMHC_2hem_for_cifti=all_VMHC_2hem_for_cifti;
DAT_in.all_VMHC_1hem_results=all_VMHC_1hem_results;
fname = [fig_dir '/Results'];
save(fname, 'DAT_in', '-v7.3');
%% Original run homotopic connectivity on every session/subject before parcellated if statement
% all_VMHC_2hem_for_cifti=zeros(DAT_in.nscan,length(data_cifti));
% all_VMHC_1hem_results=zeros(DAT_in.nscan,length(tmp_left));
% nsubj = length(unique(DAT_in.frame_to_sub));
% n=0;
% tic
% for s=1:nsubj
%     disp(s)
%     sub_idx=find(DAT_in.frame_to_sub==s);
%     sub_sessions=DAT_in.frame_to_run(DAT_in.frame_to_sub==s);
%     n_sess = length(unique(sub_sessions));
%     for ss=1:n_sess
%         n=n+1;
%         ses_ix=find(DAT_in.frame_to_sub == s & DAT_in.frame_to_run == ss);
%         data_left=DAT_ts.ts(ses_ix,tmp_left);
%         data_right=DAT_ts.ts(ses_ix,tmp_right);
%         Hcorr=zeros(1,length(tmp_left));
%         data_cifti=zeros(1,length(data_cifti));
%         for c=1:length(tmp_left)
%             Hcorr(c)=corr(data_left(:,c),data_right(:,c));
%         end
%         data_cifti=[ Hcorr'; Hcorr';tmp_sub';tmp_wall'];
%         all_VMHC_2hem_for_cifti(n,:)=data_cifti;
%         all_VMHC_1hem_results(n,:)=Hcorr';
%         % save to cifti
%         cname=char(unique(DAT_in.frame_to_scan_path(ses_ix)));
%         cname=[cname(1:end-13) '_HomotopicConn.txt'];
%         ftxt = [fig_dir '/' cname];
%         data = data_cifti;
%         dlmwrite(ftxt, data, 'delimiter', '\t', 'precision', 8);
%         cmd = sprintf('%s/wb_command -cifti-convert -from-text %s %s %s', ...
%             WB_DIR, ftxt, fcifti_example, [ftxt(1:end-3) 'dscalar.nii']);
%         system(cmd)
%     end
% end
% toc
