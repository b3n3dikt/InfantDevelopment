#! /bin/bash

warpfile=$1


base_atlas=/home/bramirez/projects/ROI_sets/RheMAP/CHARM-SARM_converted2YRK/
pushd ${base_atlas}

data_base=/home/bramirez/projects/InfantDevelopment/data/anat_flip
outpath=/home/bramirez/projects/InfantDevelopment/analyses/homotopic_InD/anat_traject/anat_warp_means
#var=`date +"%FORMAT_STRING"`
#now=`date +"%T_%m_%d_%Y"`
#now=`date +"%Y-%m-%d-%H%M"`
#echo "${now}"
#mv ${outpath} ${outpath}_${now}
#mkdir ${outpath}e


#write_csv_4(){
#  echo \"$1\",\"$2\",\"$3\",\"$4\" >>
#  }
#write_csv_6(){
#  echo \"$1\",\"$2\",\"$3\",\"$4\",\"$5\",\"$6\" >>
#  }
#while read -r warpfile
#do 
    echo ${warpfile}
    warpname=`basename ${warpfile}`
    subses=${warpname::-47}
    sub=${subses::-13}
    outnamefull=SARM-CHARM
    #make ROIs and extract Mean for SARM Levels 1-6
    for l in $(seq 1 6); do
        outname=SARM_level-${l}

        mkdir ${base_atlas}/SARM_level-${l}_ROIs
        cd ${base_atlas}/SARM_level-${l}_ROIs
        inputatlas=${base_atlas}/SARM_${l}_in_YRK_sym_05mm.nii.gz 
        namfile=${base_atlas}/SARM_level-${l}_names.txt
        abrvnamfile=${base_atlas}/SARM_level-${l}_names_abrv.txt

        intfile=${base_atlas}/SARM_level-${l}_intensities.txt

        nROIs=`wc -l < ${namfile}`
        echo ${nROIs}
        for i in $(seq 1 ${nROIs}); do 
            #echo ${i}
            NUM=${i}
            int=`sed "${NUM}q;d" ${intfile}`
            nam=`sed "${NUM}q;d" ${namfile}`
            abrv=`sed "${NUM}q;d" ${abrvnamfile}`
            #taking out making ROI because already made but if need to make uncommment line below
            #fslmaths ${inputatlas} -thr ${int} -uthr ${int} SARM_level-${l}_int-${int}_${abrv}.nii.gz
            fslmaths ${warpfile} -mas SARM_level-${l}_int-${int}_${abrv}.nii.gz ${outpath}/${subses}_${outname}_tmpmasked.nii.gz
            meanROI=`fslstats ${outpath}/${subses}_${outname}_tmpmasked.nii.gz -M`
 #           printf "${int}\t,${nam}\t,${abrv}\t,${meanROI}\n" >> ${outpath}/${subses}_${outname}_mean_jacobian_ROI_values_prinf.csv
 #           printf "${sub}\t,${subses}\t,${int}\t,${nam}\t,${abrv}\t,${meanROI}\n" >> ${outpath}/${outname}_mean_jacobian_ROI_values_printf.csv
 #           printf "${sub}\t${subses}\t,${int}\t,${nam}\t,${abrv}\t,${meanROI}\n" >> ${outpath}/${outnamefull}_level-${l}_mean_jacobian_ROI_values_printf.csv
 
            echo "${outname},${sub},${subses},${int},${nam},${abrv},${meanROI}," >> ${outpath}/${subses}_${outname}_mean_jacobian_ROI_values.csv
            
            echo "${outname},${sub},${subses},${int},${nam},${abrv},${meanROI}," >> ${outpath}/${outname}_mean_jacobian_ROI_values.csv
            
            
            echo "${outname},${sub},${subses},${int},${nam},${abrv},${meanROI}," >> ${outpath}/${outnamefull}_level-${l}_mean_jacobian_ROI_values.csv

            rm ${outpath}/${subses}_${outname}_tmpmasked.nii.gz
        done
    done
    #make ROIs and extract Mean for CHARM Levels 1-6
    for l in $(seq 1 6); do
        outname=CHARM_level-${l}

        mkdir ${base_atlas}/CHARM_level-${l}_ROIs
        cd ${base_atlas}/CHARM_level-${l}_ROIs
        inputatlas=${base_atlas}/CHARM_${l}_in_YRK_sym_05mm.nii.gz 
        namfile=${base_atlas}/CHARM_level-${l}_names.txt
        abrvnamfile=${base_atlas}/CHARM_level-${l}_names_abrv.txt

        intfile=${base_atlas}/CHARM_level-${l}_intensities.txt

        nROIs=`wc -l < ${namfile}`
        echo ${nROIs}
        for i in $(seq 1 ${nROIs}); do 
            #echo ${i}
            NUM=${i}
            int=`sed "${NUM}q;d" ${intfile}`
            nam=`sed "${NUM}q;d" ${namfile}`
            abrv=`sed "${NUM}q;d" ${abrvnamfile}`
            #taking out making ROI because already made but if need to make uncommment line below
            #fslmaths ${inputatlas} -thr ${int} -uthr ${int} CHARM_level-${l}_int-${int}_${abrv}.nii.gz
            fslmaths ${warpfile} -mas CHARM_level-${l}_int-${int}_${abrv}.nii.gz ${outpath}/${subses}_${outname}_tmpmasked.nii.gz
            meanROI=`fslstats ${outpath}/${subses}_${outname}_tmpmasked.nii.gz -M`
            #meanROI=`fslstats tmpmasked.nii.gz -M`
#            printf "${int}\t,${nam}\t,${abrv}\t,${meanROI}\n" >> ${outpath}/${subses}_${outname}_mean_jacobian_ROI_values_prinf.csv
#            printf "${sub}\t,${subses}\t,${int}\t,${nam}\t,${abrv}\t,${meanROI}\n" >> ${outpath}/${outname}_mean_jacobian_ROI_values_printf.csv
#            printf "${sub}\t,${subses}\t,${int}\t,${nam}\t,${abrv}\t,${meanROI}\n" >> ${outpath}/${outnamefull}_level-${l}_mean_jacobian_ROI_values_printf.csv
            
            echo "${outname},${sub},${subses},${int},${nam},${abrv},${meanROI}," >> ${outpath}/${subses}_${outname}_mean_jacobian_ROI_values.csv          
            echo "${outname},${sub},${subses},${int},${nam},${abrv},${meanROI}," >> ${outpath}/${outname}_mean_jacobian_ROI_values.csv                 
            echo "${outname},${sub},${subses},${int},${nam},${abrv},${meanROI}," >> ${outpath}/${outnamefull}_level-${l}_mean_jacobian_ROI_values.csv

            rm ${outpath}/${subses}_${outname}_tmpmasked.nii.gz
        done
    done
#done < /home/bramirez/projects/InfantDevelopment/info/testing_anat_flip_jacobian_warps.txt   
#done < /home/bramirez/projects/InfantDevelopment/info/All_anat_flip_jacobian_warps.txt

popd
#i=1
#NUM=${i}
#infile=/home/bramirez/projects/InfantDevelopment/info/All_anat_flip_jacobian_warps.txt
#warpfile=`sed "${NUM}q;d" ${infile}`

