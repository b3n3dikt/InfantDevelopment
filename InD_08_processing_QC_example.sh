
# Images for MNINonLinear
outdir=/home2/bramirez/projects/InfantDevelopment/analyses/homotopic_InD/processing_images/T1wT2w_deliniations_MNI/
subject=("OOPS")
Sessions=("20190509" "20190618" "20190801" "20191010" "20200310")
for ses in "${Sessions[@]}"; do
  echo ${ses}
  #removing old ciftis to propigate scene file
  rm /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/OOPS.L.pial.32k_fs_LR.surf.gii
  rm /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/OOPS.L.white.32k_fs_LR.surf.gii
  rm /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/OOPS.R.pial.32k_fs_LR.surf.gii
  rm /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/OOPS.R.white.32k_fs_LR.surf.gii
  rm /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/T1w_restore_brain.nii.gz
  rm /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/T2w_restore_brain.nii.gz
  
  cp /projects/bramirez/data/dcanumn_bids_out/priors_usr_template/sub-${subject}/ses-${ses}/files/MNINonLinear/fsaverage_LR32k/OOPS.L.pial.32k_fs_LR.surf.gii /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/OOPS.L.pial.32k_fs_LR.surf.gii
  cp /projects/bramirez/data/dcanumn_bids_out/priors_usr_template/sub-${subject}/ses-${ses}/files/MNINonLinear/fsaverage_LR32k/OOPS.L.white.32k_fs_LR.surf.gii /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/OOPS.L.white.32k_fs_LR.surf.gii
  cp /projects/bramirez/data/dcanumn_bids_out/priors_usr_template/sub-${subject}/ses-${ses}/files/MNINonLinear/fsaverage_LR32k/OOPS.R.pial.32k_fs_LR.surf.gii /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/OOPS.R.pial.32k_fs_LR.surf.gii
  cp /projects/bramirez/data/dcanumn_bids_out/priors_usr_template/sub-${subject}/ses-${ses}/files/MNINonLinear/fsaverage_LR32k/OOPS.R.white.32k_fs_LR.surf.gii /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/OOPS.R.white.32k_fs_LR.surf.gii
  cp /projects/bramirez/data/dcanumn_bids_out/priors_usr_template/sub-${subject}/ses-${ses}/files/MNINonLinear/T1w_restore_brain.nii.gz /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/T1w_restore_brain.nii.gz
  cp /projects/bramirez/data/dcanumn_bids_out/priors_usr_template/sub-${subject}/ses-${ses}/files/MNINonLinear/T2w_restore_brain.nii.gz /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/T2w_restore_brain.nii.gz

  
    wb_command -show-scene /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/Infant_development_struct_images.scene 1 ${outdir}/T1w_T2w_axial_deliniations_sub-${subject}_ses-${ses}.png 350 800
   
done
#




# Images for Native T1w
outdir=/home2/bramirez/projects/InfantDevelopment/analyses/homotopic_InD/processing_images/T1wT2w_deliniations/
subject=("OOPS")
Sessions=("20190509" "20190618" "20190801" "20191010" "20200310")
for ses in "${Sessions[@]}"; do
  echo ${ses}
  #removing old ciftis to propigate scene file
  rm /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/OOPS.L.pial.32k_fs_LR.surf.gii
  rm /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/OOPS.L.white.32k_fs_LR.surf.gii
  rm /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/OOPS.R.pial.32k_fs_LR.surf.gii
  rm /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/OOPS.R.white.32k_fs_LR.surf.gii
  rm /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/T1w_restore_brain.nii.gz
  rm /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/T2w_restore_brain.nii.gz
  
  cp /projects/bramirez/data/dcanumn_bids_out/priors_usr_template/sub-${subject}/ses-${ses}/files/T1w/fsaverage_LR32k/OOPS.L.pial.32k_fs_LR.surf.gii /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/OOPS.L.pial.32k_fs_LR.surf.gii
  cp /projects/bramirez/data/dcanumn_bids_out/priors_usr_template/sub-${subject}/ses-${ses}/files/T1w/fsaverage_LR32k/OOPS.L.white.32k_fs_LR.surf.gii /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/OOPS.L.white.32k_fs_LR.surf.gii
  cp /projects/bramirez/data/dcanumn_bids_out/priors_usr_template/sub-${subject}/ses-${ses}/files/T1w/fsaverage_LR32k/OOPS.R.pial.32k_fs_LR.surf.gii /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/OOPS.R.pial.32k_fs_LR.surf.gii
  cp /projects/bramirez/data/dcanumn_bids_out/priors_usr_template/sub-${subject}/ses-${ses}/files/T1w/fsaverage_LR32k/OOPS.R.white.32k_fs_LR.surf.gii /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/OOPS.R.white.32k_fs_LR.surf.gii
  cp /projects/bramirez/data/dcanumn_bids_out/priors_usr_template/sub-${subject}/ses-${ses}/files/T1w/T1w_acpc_dc_restore_brain.nii.gz /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/T1w_restore_brain.nii.gz
  cp /projects/bramirez/data/dcanumn_bids_out/priors_usr_template/sub-${subject}/ses-${ses}/files/T1w/T2w_acpc_dc_restore_brain.nii.gz /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/T2w_restore_brain.nii.gz


    wb_command -show-scene /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/Infant_development_struct_images.scene 1 ${outdir}/T1w_T2w_axial_deliniations_sub-${subject}_ses-${ses}.png 350 800
   
done


# Images for Native T1w
outdir=/home2/bramirez/projects/InfantDevelopment/analyses/homotopic_InD/processing_images/T1wT2w_deliniations_Native_same_slice/
mkdir ${outdir}
subject=("OOPS")
Sessions=("20190509") # "20190618" "20190801" "20191010" "20200310")
for ses in "${Sessions[@]}"; do
  echo ${ses}
  #removing old ciftis to propigate scene file
  rm /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/OOPS.L.pial.32k_fs_LR.surf.gii
  rm /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/OOPS.L.white.32k_fs_LR.surf.gii
  rm /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/OOPS.R.pial.32k_fs_LR.surf.gii
  rm /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/OOPS.R.white.32k_fs_LR.surf.gii
  rm /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/T1w_restore_brain.nii.gz
  rm /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/T2w_restore_brain.nii.gz
  
  cp /projects/bramirez/data/dcanumn_bids_out/priors_usr_template/sub-${subject}/ses-${ses}/files/T1w/fsaverage_LR32k/OOPS.L.pial.32k_fs_LR.surf.gii /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/OOPS.L.pial.32k_fs_LR.surf.gii
  cp /projects/bramirez/data/dcanumn_bids_out/priors_usr_template/sub-${subject}/ses-${ses}/files/T1w/fsaverage_LR32k/OOPS.L.white.32k_fs_LR.surf.gii /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/OOPS.L.white.32k_fs_LR.surf.gii
  cp /projects/bramirez/data/dcanumn_bids_out/priors_usr_template/sub-${subject}/ses-${ses}/files/T1w/fsaverage_LR32k/OOPS.R.pial.32k_fs_LR.surf.gii /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/OOPS.R.pial.32k_fs_LR.surf.gii
  cp /projects/bramirez/data/dcanumn_bids_out/priors_usr_template/sub-${subject}/ses-${ses}/files/T1w/fsaverage_LR32k/OOPS.R.white.32k_fs_LR.surf.gii /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/OOPS.R.white.32k_fs_LR.surf.gii
  cp /projects/bramirez/data/dcanumn_bids_out/priors_usr_template/sub-${subject}/ses-${ses}/files/T1w/T1w_acpc_dc_restore_brain.nii.gz /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/T1w_restore_brain.nii.gz
  cp /projects/bramirez/data/dcanumn_bids_out/priors_usr_template/sub-${subject}/ses-${ses}/files/T1w/T2w_acpc_dc_restore_brain.nii.gz /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/T2w_restore_brain.nii.gz


    wb_command -show-scene /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/Infant_development_struct_images.scene 2 ${outdir}/T1w_T2w_axial_deliniations_sub-${subject}_ses-${ses}.png 350 800
   
done

# Images for Native T1w
outdir=/home2/bramirez/projects/InfantDevelopment/analyses/homotopic_InD/processing_images/T1wT2w_deliniations_Native_same_slice/
mkdir ${outdir}
subject=("OOPS")
Sessions=("20190618") # "20190618" "20190801" "20191010" "20200310")
for ses in "${Sessions[@]}"; do
  echo ${ses}
  #removing old ciftis to propigate scene file
  rm /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/OOPS.L.pial.32k_fs_LR.surf.gii
  rm /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/OOPS.L.white.32k_fs_LR.surf.gii
  rm /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/OOPS.R.pial.32k_fs_LR.surf.gii
  rm /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/OOPS.R.white.32k_fs_LR.surf.gii
  rm /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/T1w_restore_brain.nii.gz
  rm /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/T2w_restore_brain.nii.gz
  
  cp /projects/bramirez/data/dcanumn_bids_out/priors_usr_template/sub-${subject}/ses-${ses}/files/T1w/fsaverage_LR32k/OOPS.L.pial.32k_fs_LR.surf.gii /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/OOPS.L.pial.32k_fs_LR.surf.gii
  cp /projects/bramirez/data/dcanumn_bids_out/priors_usr_template/sub-${subject}/ses-${ses}/files/T1w/fsaverage_LR32k/OOPS.L.white.32k_fs_LR.surf.gii /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/OOPS.L.white.32k_fs_LR.surf.gii
  cp /projects/bramirez/data/dcanumn_bids_out/priors_usr_template/sub-${subject}/ses-${ses}/files/T1w/fsaverage_LR32k/OOPS.R.pial.32k_fs_LR.surf.gii /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/OOPS.R.pial.32k_fs_LR.surf.gii
  cp /projects/bramirez/data/dcanumn_bids_out/priors_usr_template/sub-${subject}/ses-${ses}/files/T1w/fsaverage_LR32k/OOPS.R.white.32k_fs_LR.surf.gii /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/OOPS.R.white.32k_fs_LR.surf.gii
  cp /projects/bramirez/data/dcanumn_bids_out/priors_usr_template/sub-${subject}/ses-${ses}/files/T1w/T1w_acpc_dc_restore_brain.nii.gz /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/T1w_restore_brain.nii.gz
  cp /projects/bramirez/data/dcanumn_bids_out/priors_usr_template/sub-${subject}/ses-${ses}/files/T1w/T2w_acpc_dc_restore_brain.nii.gz /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/T2w_restore_brain.nii.gz


    wb_command -show-scene /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/Infant_development_struct_images.scene 3 ${outdir}/T1w_T2w_axial_deliniations_sub-${subject}_ses-${ses}.png 350 800
   
done

outdir=/home2/bramirez/projects/InfantDevelopment/analyses/homotopic_InD/processing_images/T1wT2w_deliniations_Native_same_slice/
mkdir ${outdir}
subject=("OOPS")
Sessions=("20190801") # "20190618" "20190801" "20191010" "20200310")
for ses in "${Sessions[@]}"; do
  echo ${ses}
  #removing old ciftis to propigate scene file
  rm /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/OOPS.L.pial.32k_fs_LR.surf.gii
  rm /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/OOPS.L.white.32k_fs_LR.surf.gii
  rm /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/OOPS.R.pial.32k_fs_LR.surf.gii
  rm /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/OOPS.R.white.32k_fs_LR.surf.gii
  rm /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/T1w_restore_brain.nii.gz
  rm /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/T2w_restore_brain.nii.gz
  
  cp /projects/bramirez/data/dcanumn_bids_out/priors_usr_template/sub-${subject}/ses-${ses}/files/T1w/fsaverage_LR32k/OOPS.L.pial.32k_fs_LR.surf.gii /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/OOPS.L.pial.32k_fs_LR.surf.gii
  cp /projects/bramirez/data/dcanumn_bids_out/priors_usr_template/sub-${subject}/ses-${ses}/files/T1w/fsaverage_LR32k/OOPS.L.white.32k_fs_LR.surf.gii /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/OOPS.L.white.32k_fs_LR.surf.gii
  cp /projects/bramirez/data/dcanumn_bids_out/priors_usr_template/sub-${subject}/ses-${ses}/files/T1w/fsaverage_LR32k/OOPS.R.pial.32k_fs_LR.surf.gii /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/OOPS.R.pial.32k_fs_LR.surf.gii
  cp /projects/bramirez/data/dcanumn_bids_out/priors_usr_template/sub-${subject}/ses-${ses}/files/T1w/fsaverage_LR32k/OOPS.R.white.32k_fs_LR.surf.gii /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/OOPS.R.white.32k_fs_LR.surf.gii
  cp /projects/bramirez/data/dcanumn_bids_out/priors_usr_template/sub-${subject}/ses-${ses}/files/T1w/T1w_acpc_dc_restore_brain.nii.gz /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/T1w_restore_brain.nii.gz
  cp /projects/bramirez/data/dcanumn_bids_out/priors_usr_template/sub-${subject}/ses-${ses}/files/T1w/T2w_acpc_dc_restore_brain.nii.gz /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/T2w_restore_brain.nii.gz


    wb_command -show-scene /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/Infant_development_struct_images.scene 4 ${outdir}/T1w_T2w_axial_deliniations_sub-${subject}_ses-${ses}.png 350 800
   
done


##########Next session
outdir=/home2/bramirez/projects/InfantDevelopment/analyses/homotopic_InD/processing_images/T1wT2w_deliniations_Native_same_slice/
mkdir ${outdir}
subject=("OOPS")
Sessions=("20191010") # "20190618" "20190801" "20191010" "20200310")
for ses in "${Sessions[@]}"; do
  echo ${ses}
  #removing old ciftis to propigate scene file
  rm /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/OOPS.L.pial.32k_fs_LR.surf.gii
  rm /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/OOPS.L.white.32k_fs_LR.surf.gii
  rm /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/OOPS.R.pial.32k_fs_LR.surf.gii
  rm /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/OOPS.R.white.32k_fs_LR.surf.gii
  rm /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/T1w_restore_brain.nii.gz
  rm /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/T2w_restore_brain.nii.gz
  
  cp /projects/bramirez/data/dcanumn_bids_out/priors_usr_template/sub-${subject}/ses-${ses}/files/T1w/fsaverage_LR32k/OOPS.L.pial.32k_fs_LR.surf.gii /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/OOPS.L.pial.32k_fs_LR.surf.gii
  cp /projects/bramirez/data/dcanumn_bids_out/priors_usr_template/sub-${subject}/ses-${ses}/files/T1w/fsaverage_LR32k/OOPS.L.white.32k_fs_LR.surf.gii /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/OOPS.L.white.32k_fs_LR.surf.gii
  cp /projects/bramirez/data/dcanumn_bids_out/priors_usr_template/sub-${subject}/ses-${ses}/files/T1w/fsaverage_LR32k/OOPS.R.pial.32k_fs_LR.surf.gii /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/OOPS.R.pial.32k_fs_LR.surf.gii
  cp /projects/bramirez/data/dcanumn_bids_out/priors_usr_template/sub-${subject}/ses-${ses}/files/T1w/fsaverage_LR32k/OOPS.R.white.32k_fs_LR.surf.gii /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/OOPS.R.white.32k_fs_LR.surf.gii
  cp /projects/bramirez/data/dcanumn_bids_out/priors_usr_template/sub-${subject}/ses-${ses}/files/T1w/T1w_acpc_dc_restore_brain.nii.gz /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/T1w_restore_brain.nii.gz
  cp /projects/bramirez/data/dcanumn_bids_out/priors_usr_template/sub-${subject}/ses-${ses}/files/T1w/T2w_acpc_dc_restore_brain.nii.gz /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/T2w_restore_brain.nii.gz


    wb_command -show-scene /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/Infant_development_struct_images.scene 5 ${outdir}/T1w_T2w_axial_deliniations_sub-${subject}_ses-${ses}.png 350 800
   
done



##########Next session
outdir=/home2/bramirez/projects/InfantDevelopment/analyses/homotopic_InD/processing_images/T1wT2w_deliniations_Native_same_slice/
mkdir ${outdir}
subject=("OOPS")
Sessions=("20200310") # "20190618" "20190801" "20191010" "20200310")
for ses in "${Sessions[@]}"; do
  echo ${ses}
  #removing old ciftis to propigate scene file
  rm /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/OOPS.L.pial.32k_fs_LR.surf.gii
  rm /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/OOPS.L.white.32k_fs_LR.surf.gii
  rm /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/OOPS.R.pial.32k_fs_LR.surf.gii
  rm /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/OOPS.R.white.32k_fs_LR.surf.gii
  rm /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/T1w_restore_brain.nii.gz
  rm /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/T2w_restore_brain.nii.gz
  
  cp /projects/bramirez/data/dcanumn_bids_out/priors_usr_template/sub-${subject}/ses-${ses}/files/T1w/fsaverage_LR32k/OOPS.L.pial.32k_fs_LR.surf.gii /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/OOPS.L.pial.32k_fs_LR.surf.gii
  cp /projects/bramirez/data/dcanumn_bids_out/priors_usr_template/sub-${subject}/ses-${ses}/files/T1w/fsaverage_LR32k/OOPS.L.white.32k_fs_LR.surf.gii /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/OOPS.L.white.32k_fs_LR.surf.gii
  cp /projects/bramirez/data/dcanumn_bids_out/priors_usr_template/sub-${subject}/ses-${ses}/files/T1w/fsaverage_LR32k/OOPS.R.pial.32k_fs_LR.surf.gii /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/OOPS.R.pial.32k_fs_LR.surf.gii
  cp /projects/bramirez/data/dcanumn_bids_out/priors_usr_template/sub-${subject}/ses-${ses}/files/T1w/fsaverage_LR32k/OOPS.R.white.32k_fs_LR.surf.gii /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/OOPS.R.white.32k_fs_LR.surf.gii
  cp /projects/bramirez/data/dcanumn_bids_out/priors_usr_template/sub-${subject}/ses-${ses}/files/T1w/T1w_acpc_dc_restore_brain.nii.gz /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/T1w_restore_brain.nii.gz
  cp /projects/bramirez/data/dcanumn_bids_out/priors_usr_template/sub-${subject}/ses-${ses}/files/T1w/T2w_acpc_dc_restore_brain.nii.gz /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/example_files/T2w_restore_brain.nii.gz


    wb_command -show-scene /home/bramirez/projects/InfantDevelopment/data/processing_QC_scene_images/Infant_development_struct_images.scene 6 ${outdir}/T1w_T2w_axial_deliniations_sub-${subject}_ses-${ses}.png 350 800
   
done
