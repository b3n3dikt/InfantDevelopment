#! /bin/bash


inpath=$1
#inpath=/projects/bramirez/data/dcanumn_bids_out/priors_usr_template/sub-OOPS/ses-20190718/files/MNINonLinear/T1w_restore.nii.gz
#inpath=/projects/bramirez/data/dcanumn_bids_out/priors_usr_template/sub-MILO/ses-20210907/files/MNINonLinear/T1w_restore.nii.gz

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


ln -s ${MNINonLinear_path}/wmparc.nii.gz ${outpath}/${sub}_${ses}_wmparc.nii.gz

mri_convert -i ${outpath}/${sub}_${ses}_wmparc.nii.gz -o ${outpath}/${sub}_${ses}_wmparc_flipLR.nii.gz --in_orientation RAS


3dedge3 -input ${outpath}/${sub}_${ses}_wmparc_flipLR.nii.gz -prefix ${outpath}/${sub}_${ses}_wmparc_flipLR_3dedge3.nii.gz


imageout=${outpath}/aseg_on_warped

if [ -d ${imageout} ]; then
  echo "${imageout} exists"
else
  mkdir ${imageout}
fi

head=${outpath}/${sub}_${ses}_T1w_restore_fnirt_orig2flipLR_warp_iout.nii.gz
mask=${outpath}/${sub}_${ses}_wmparc_flipLR_3dedge3.nii.gz
output=${imageout}/${sub}_${ses}_wmparc_3dedge_on_T1w_restore_warp2flip_qc.png


    #overlay 1 1 -c ${undrlay} -a ${overlay} 1 1 outnifti.nii.gz
#rm outnifti.nii.gz
#fslmaths ${mask} -add ${head} outnifti.nii.gz #blank
#fslmaths ${head} -rem ${mask} outnifti.nii.gz #blank
#overlay 1 1 ${mask} -A ${head} ygb 1 outnifti.nii.gz #blank
#overlay 0 1 ${mask} -A ${head} ygb s outnifti.nii.gz #blank
##overlay 1 1 ${mask} -A ${head} ygb s outnifti.nii.gz #just aseg
#overlay 1 0 ${mask} -A ${head} ygb s outnifti.nii.gz #just aseg
#overlay 1 0 ${head} -A ${mask} ygb s outnifti.nii.gz # just head
#overlay 0 0 ${head} -A ${mask} 1 1 outnifti.nii.gz
#overlay 1 1 ${head} -A ${mask} 1 1 outnifti.nii.gz #closest we got, real head, but aseg just outline
#overlay 1 0 ${head} -A ${mask} 0 1 outnifti.nii.gz #just outline
#overlay 1 0 ${head} -A ${mask} 1 1 outnifti.nii.gz #closest we got, real head, but aseg just outline
#overlay 1 0 ${mask} -A ${head} 1 1 outnifti.nii.gz
#overlay 1 1 ${mask} -A ${head} 1 1 outnifti.nii.gz
#overlay 1 1 ${mask} -A ${head} -A 0 1 outnifti.nii.gz #just saved aseg as 1
#overlay 1 1 ${mask} -A ${head} 0 1 outnifti.nii.gz #heas still white, but aseg full range
#overlay 1 1 ${mask} -a ${head} 0 1 outnifti.nii.gz # had both but head was white 
#overlay 1 1 ${mask} -a ${head} 1 0 outnifti.nii.gz # had some head but still in outline
#overlay 1 1 ${mask} -a ${head} 1 1 outnifti.nii.gz # had both but head was white 
        #slicer outnifti.nii.gz -s 2 -x 0.80 slxa1.png -x 0.75 slxa2.png -x 0.70 slxa3.png -x 0.65 slxa4.png -x 0.55 slxa5.png \
#overlay 1 1 ${mask} -a ${head} 0 0 outnifti.nii.gz
#overlay 1 0 ${mask} -a ${head} 1 0 outnifti.nii.gz
# figure generation.
imgcheck (){
    # this overlay one image to another and save 3x3 slices into one figure.
    overlay=$1
    underlay=$2
    figout=$3
    #workdir=`dirname ${figout}`
    workdir=`dirname ${underlay}`
    pushd ${workdir}
    
    #overlay 1 1 ${overlay} -a ${underlay} 0 0 outnifti.nii.gz
    #overlay 2 0 ${underlay} -a ${overlay} 1 0 outnifti.nii.gz
        slicer ${overlay} ${underlay} -s 2 -x 0.80 slxa1.png -x 0.75 slxa2.png -x 0.70 slxa3.png -x 0.65 slxa4.png -x 0.55 slxa5.png \
    -x 0.46 slxb1.png -x 0.40 slxb2.png -x 0.32 slxb3.png -x 0.26 slxb4.png -x 0.20 slxb5.png \
    -y 0.70 slya1.png -y 0.65 slya2.png -y 0.60 slya3.png -y 0.55 slya4.png -y 0.50 slya5.png -y 0.45 slya6.png \
    -y 0.40 slyb1.png -y 0.34 slyb2.png -y 0.30 slyb3.png -y 0.24 slyb4.png -y 0.20 slyb5.png -y 0.15 slyb6.png \
    -z 0.90 slza1.png -z 0.85 slza2.png -z 0.80 slza3.png -z 0.75 slza4.png -z 0.70 slza5.png -z 0.65 slza6.png \
    -z 0.60 slzb1.png -z 0.55 slzb2.png -z 0.50 slzb3.png -z 0.45 slzb4.png -z 0.40 slzb5.png -z 0.35 slzb6.png

    pngappend slxa1.png + slxa2.png + slxa3.png + slxa4.png + slxa5.png Sag1.png
    pngappend slxb1.png + slxb2.png + slxb3.png + slxb4.png + slxb5.png Sag2.png
    pngappend slya1.png + slya2.png + slya3.png + slya4.png + slya5.png + slya6.png Cor1.png
    pngappend slyb1.png + slyb2.png + slyb3.png + slyb4.png + slyb5.png + slyb6.png Cor2.png
    pngappend slza1.png + slza2.png + slza3.png + slza4.png + slza5.png + slza6.png Axi1.png
    pngappend slzb1.png + slzb2.png + slzb3.png + slzb4.png + slzb5.png + slzb6.png Axi2.png
    pngappend Cor1.png - Cor2.png - Axi1.png - Axi2.png - Sag1.png - Sag2.png ${figout}
    rm sl*.png
    rm Ax*.png
    rm Sag*.png
    rm Cor*.png
    rm outnifti.nii.gz

    popd
}

imgcheck ${head} ${mask} ${output}
#imgcheck ${mask} ${head} ${output}




#mri_convert -i ${outpath}/${sub}_${ses}_T1w_restore.nii.gz -o ${outpath}/${sub}_${ses}_T1w_restore_flipLR.nii.gz --in_orientation RAS

#fnirt --in=${outpath}/${sub}_${ses}_T1w_restore.nii.gz --ref=${outpath}/${sub}_${ses}_T1w_restore_flipLR.nii.gz --cout=${outpath}/${sub}_${ses}_T1w_restore_fnirt_orig2flipLR_warp_cout.nii.gz --iout=${outpath}/${sub}_${ses}_T1w_restore_fnirt_orig2flipLR_warp_iout.nii.gz --fout=${outpath}/${sub}_${ses}_T1w_restore_fnirt_orig2flipLR_warp_fout.nii.gz --jout=${outpath}/${sub}_${ses}_T1w_restore_fnirt_orig2flipLR_warp_jout.nii.gz --warpres=5,5,5



