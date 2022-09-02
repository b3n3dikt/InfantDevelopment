#! /bin/bash
cd /home2/bramirez/projects/InfantDevelopment/scripts

cat /home2/bramirez/projects/InfantDevelopment/info/T1w_restore_paths.txt | parallel -j 15 './InD_04_flip_reg_anat.sh' 

cd /home2/bramirez/projects/InfantDevelopment/scripts

cat /home2/bramirez/projects/InfantDevelopment/info/Native_T1w_acpc_paths.txt | parallel -j 10 './InD_04_flip_reg_anat_native_head.sh' 

cd /home2/bramirez/projects/InfantDevelopment/scripts
sleep 1h
cat /home2/bramirez/projects/InfantDevelopment/info/Native_T1w_acpc_dc_restore_brain_paths.txt | parallel -j 4 './InD_04_flip_reg_anat_native_brain_w-rot.sh' 


while read -r inpath
do
./InD_05_anat_flip_3dedges3.sh ${inpath}

done < /home2/bramirez/projects/InfantDevelopment/info/T1w_restore_paths.txt


/projects/bramirez/data/dcanumn_bids_out/priors_usr_template/sub-MILO/ses-20210907/files/MNINonLinear/T1w_restore.nii.gz



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
