#! /bin/bash


inpath=$1



#inpath=/projects/bramirez/data/dcanumn_bids_out/priors_usr_template/sub-MILO/ses-20210907/files/T1w/T1w_acpc.nii.gz

outpath=/home/bramirez/projects/InfantDevelopment/data/anat_flip_native_head/
#ln -s ${inpath} ${outpath}/T1w_acpc.nii.gz
#mri_convert -i ${outpath}/T1w_acpc.nii.gz -o ${outpath}/T1w_acpc_flipLR.nii.gz --in_orientation RAS




#mkdir ${outpath}
filename=`basename ${inpath}`

MNINonLinear_path=`dirname ${inpath}`
files_path=`dirname ${MNINonLinear_path}`
ses_path=`dirname ${files_path}`
ses=`basename ${ses_path}` 
sub_path=`dirname ${ses_path}`
sub=`basename ${sub_path}` 

echo $sub
echo $ses

#ln -s ${inpath} ${outpath}/T1w_acpc.nii.gz

ln -s ${inpath} ${outpath}/${sub}_${ses}_T1w_acpc.nii.gz
mri_convert -i ${outpath}/${sub}_${ses}_T1w_acpc.nii.gz -o ${outpath}/${sub}_${ses}_T1w_acpc_flipLR.nii.gz --in_orientation RAS

#mri_convert -i ${outpath}/${sub}_${ses}_T1w_acpc.nii.gz -o ${outpath}/${sub}_${ses}_T1w_acpc_flipLR.nii.gz --in_orientation RAS

fnirt --in=${outpath}/${sub}_${ses}_T1w_acpc.nii.gz --ref=${outpath}/${sub}_${ses}_T1w_acpc_flipLR.nii.gz --cout=${outpath}/${sub}_${ses}_T1w_acpc_fnirt_orig2flipLR_warp_cout.nii.gz --iout=${outpath}/${sub}_${ses}_T1w_acpc_fnirt_orig2flipLR_warp_iout.nii.gz --fout=${outpath}/${sub}_${ses}_T1w_acpc_fnirt_orig2flipLR_warp_fout.nii.gz --jout=${outpath}/${sub}_${ses}_T1w_acpc_fnirt_orig2flipLR_warp_jout.nii.gz --warpres=5,5,5
