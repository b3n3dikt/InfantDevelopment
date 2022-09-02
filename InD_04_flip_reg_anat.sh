#! /bin/bash


inpath=$1

outpath=/home/bramirez/projects/InfantDevelopment/data/anat_flip/

filename=`basename ${inpath}`

MNINonLinear_path=`dirname ${inpath}`
files_path=`dirname ${MNINonLinear_path}`
ses_path=`dirname ${files_path}`
ses=`basename ${ses_path}` 
sub_path=`dirname ${ses_path}`
sub=`basename ${sub_path}` 

echo $sub
echo $ses


ln -s ${inpath} ${outpath}/${sub}_${ses}_T1w_restore.nii.gz

mri_convert -i ${outpath}/${sub}_${ses}_T1w_restore.nii.gz -o ${outpath}/${sub}_${ses}_T1w_restore_flipLR.nii.gz --in_orientation RAS

fnirt --in=${outpath}/${sub}_${ses}_T1w_restore.nii.gz --ref=${outpath}/${sub}_${ses}_T1w_restore_flipLR.nii.gz --cout=${outpath}/${sub}_${ses}_T1w_restore_fnirt_orig2flipLR_warp_cout.nii.gz --iout=${outpath}/${sub}_${ses}_T1w_restore_fnirt_orig2flipLR_warp_iout.nii.gz --fout=${outpath}/${sub}_${ses}_T1w_restore_fnirt_orig2flipLR_warp_fout.nii.gz --jout=${outpath}/${sub}_${ses}_T1w_restore_fnirt_orig2flipLR_warp_jout.nii.gz --warpres=5,5,5
