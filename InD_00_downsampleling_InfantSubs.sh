### setting up and downsampling files for ${subject}

## for GSR files
data_base=/projects/bramirez/data/dcanumn_bids_out/priors_usr_template/
out_base=/home/bramirez/projects/InfantDevelopment/
#mkdir ${out_base}/data/info



#ls ${data_base}/sub-${subject}/ses-${sesh}/files/MNINonLinear/Results/ses-combined_task-*_DCANBOLDProc_v4.0.0_Atlas.dtseries.nii >> ${out_base}/info/32K_GRS_paths.txt

cd ${out_base}/data
#mkdir 32k_GSR
#/home2/bramirez/projects/anes/MAJOM/ciftis/copydtseries.sh ${out_base}/data/info/32K_GRS_paths.txt ${out_base}/data/32k_GSR
#Smooth 32K 
mkdir ${out_base}/data/32k_GSR_smoothed3mm
cp ${out_base}/data/32k_GSR/* ${out_base}/data/32k_GSR_smoothed3mm/
#/home2/bramirez/projects/anes/MAJOM/ciftis/copydtseries.sh ${out_base}/data/info/32K_GRS_paths.txt ${out_base}/data/32k_GSR_smoothed3mm

ls ${out_base}/data/32k_GSR_smoothed3mm/*.dtseries.nii > ${out_base}/info/32K_GSR_smoothed_3mm_dtseries_paths.txt

##
#/home2/bramirez/projects/code/code_OHSU/Smoothing_cifti/smooth_cifti.sh ${out_base}/info/32K_noGSR_smoothed_3mm_dtseries_added_paths.txt 3



#/home2/bramirez/projects/code/code_OHSU/Smoothing_cifti/smooth_cifti.sh ${out_base}/info/32K_GSR_smoothed_3mm_dtseries_paths.txt 3

## testing alternative parallel approach 
cat /home/bramirez/projects/InfantDevelopment/info/32K_GSR_smoothed_3mm_dtseries_paths.txt | parallel -j 14 '/home/bramirez/projects/InfantDevelopment/scripts/smooth_cifti_3_parallel.sh'

	
	
#downsample 32k smoothed to 10 k 
mkdir ${out_base}/data/10k_GSR_smoothed3mm
/home2/bramirez/projects/anes/MAJOM/ciftis/resample32to10k_v2.sh ${out_base}/data/32k_GSR_smoothed3mm/ ${out_base}/data/10k_GSR_smoothed3mm/

#parcellate 10k dtseries 
mkdir ${out_base}/data/10k_GSR_smoothed3mm_HCP
/home2/bramirez/projects/anes/MAJOM/ciftis/parcellate_10k_files.sh ${out_base}/data/10k_GSR_smoothed3mm/ /home/bramirez/projects/ROI_sets/Surface_schemes/Monkey/10k/HCP_MMP_P210.human-to-monkey.10k_fs_LR.dlabel.nii ${out_base}/data/10k_GSR_smoothed3mm_HCP

mkdir ${out_base}/data/10k_GSR_smoothed3mm_Markov

/home2/bramirez/projects/anes/MAJOM/ciftis/parcellate_10k_files.sh ${out_base}/data/10k_GSR_smoothed3mm/ /home/bramirez/projects/ROI_sets/Surface_schemes/Monkey/10k/MarkovCC12_M132_182-area.10k_fs_LR.dlabel.nii ${out_base}/data/10k_GSR_smoothed3mm_Markov


