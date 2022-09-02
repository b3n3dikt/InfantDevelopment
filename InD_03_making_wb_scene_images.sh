inputfolder=/home2/bramirez/projects/InfantDevelopment/analyses/homotopic_InD/results_v1/Fitng_results_n51_FD-thr-2.000000e-01_parcellated-0
outfolder=${inputfolder}/scene_images
mkdir ${outfolder}
for a in $(ls ${inputfolder}/*dscalar.nii); do
  #echo $a
  fname=`basename ${a::-12}`
  echo $fname
  rm -r /home/bramirez/projects/InfantDevelopment/analyses/homotopic_InD/scene_file/example_data/example_VMHC_10k_cifti.dscalar.nii
  cp ${a} /home/bramirez/projects/InfantDevelopment/analyses/homotopic_InD/scene_file/example_data/example_VMHC_10k_cifti.dscalar.nii
  wb_command -show-scene  -use-window-size /home/bramirez/projects/InfantDevelopment/analyses/homotopic_InD/scene_file/VMHC_dense_surf_leftHem.scene 1 ${outfolder}/${fname}.png 1000 800
done

##making cifti scene png images for parcellated results. 

inputfolder=/home2/bramirez/projects/InfantDevelopment/analyses/homotopic_InD/results_v1/Fitng_results_n51_FD-thr-2.000000e-01_parcellated-1
outfolder=${inputfolder}/scene_images
mkdir ${outfolder}
for a in $(ls ${inputfolder}/*dscalar.nii); do
  #echo $a
  fname=`basename ${a::-12}`
  echo $fname
  rm -r /home/bramirez/projects/InfantDevelopment/analyses/homotopic_InD/scene_file/example_data/example_VMHC_10k_cifti.dscalar.nii
  cp ${a} /home/bramirez/projects/InfantDevelopment/analyses/homotopic_InD/scene_file/example_data/example_VMHC_10k_cifti.dscalar.nii
  wb_command -show-scene  -use-window-size /home/bramirez/projects/InfantDevelopment/analyses/homotopic_InD/scene_file/VMHC_dense_surf_leftHem.scene 1 ${outfolder}/${fname}.png 1000 800
done


##making cifti scene png images for volumetric parcellated results. 

inputfolder=/home2/bramirez/projects/InfantDevelopment/analyses/homotopic_InD/results_v1/Fitng_volumetric_results_FD-thr-0_parcellated-1
outfolder=${inputfolder}/scene_images
mkdir ${outfolder}
for a in $(ls ${inputfolder}/*dscalar.nii); do
  #echo $a
  fname=`basename ${a::-12}`
  echo $fname
  rm -r /home/bramirez/projects/InfantDevelopment/analyses/homotopic_InD/scene_file/example_data/example_VMHC_10k_cifti.dscalar.nii
  cp ${a} /home/bramirez/projects/InfantDevelopment/analyses/homotopic_InD/scene_file/example_data/example_VMHC_10k_cifti.dscalar.nii
  wb_command -show-scene  -use-window-size /home/bramirez/projects/InfantDevelopment/analyses/homotopic_InD/scene_file/VMHC_dense_surf_leftHem.scene 1 ${outfolder}/${fname}.png 1000 800
done


##making cifti scene png images for scrubbed volumetric parcellated results. 

inputfolder=/home2/bramirez/projects/InfantDevelopment/analyses/homotopic_InD/results_v1/Fitng_volumetric_runs_results_FD-thr-2.000000e-01_parcellated-1
outfolder=${inputfolder}/scene_images
mkdir ${outfolder}
for a in $(ls ${inputfolder}/*dscalar.nii); do
  #echo $a
  fname=`basename ${a::-12}`
  echo $fname
  rm -r /home/bramirez/projects/InfantDevelopment/analyses/homotopic_InD/scene_file/example_data/example_VMHC_10k_cifti.dscalar.nii
  cp ${a} /home/bramirez/projects/InfantDevelopment/analyses/homotopic_InD/scene_file/example_data/example_VMHC_10k_cifti.dscalar.nii
  wb_command -show-scene  -use-window-size /home/bramirez/projects/InfantDevelopment/analyses/homotopic_InD/scene_file/VMHC_dense_surf_leftHem.scene 1 ${outfolder}/${fname}.png 1000 800
done



##making cifti scene png images for scrubbed surface parcellated by runs results. 



inputfolder=/home2/bramirez/projects/InfantDevelopment/analyses/homotopic_InD/results_v1/Fitng_surf_results_n197_runs_FD-thr-2.000000e-01_parcellated-1
outfolder=${inputfolder}/scene_images
mkdir ${outfolder}
for a in $(ls ${inputfolder}/*dscalar.nii); do
  #echo $a
  fname=`basename ${a::-12}`
  echo $fname
  rm -r /home/bramirez/projects/InfantDevelopment/analyses/homotopic_InD/scene_file/example_data/example_VMHC_10k_cifti.dscalar.nii
  cp ${a} /home/bramirez/projects/InfantDevelopment/analyses/homotopic_InD/scene_file/example_data/example_VMHC_10k_cifti.dscalar.nii
  wb_command -show-scene  -use-window-size /home/bramirez/projects/InfantDevelopment/analyses/homotopic_InD/scene_file/VMHC_dense_surf_leftHem.scene 1 ${outfolder}/${fname}.png 1000 800
done


##making cifti scene png images for scrubbed surface parcellated by runs results. 



inputfolder=/home2/bramirez/projects/InfantDevelopment/analyses/homotopic_InD/results_v1/Fitng_surf_results_n197_runs_FD-thr-2.000000e-01_parcellated-0
outfolder=${inputfolder}/scene_images
mkdir ${outfolder}
for a in $(ls ${inputfolder}/*dscalar.nii); do
  #echo $a
  fname=`basename ${a::-12}`
  echo $fname
  rm -r /home/bramirez/projects/InfantDevelopment/analyses/homotopic_InD/scene_file/example_data/example_VMHC_10k_cifti.dscalar.nii
  cp ${a} /home/bramirez/projects/InfantDevelopment/analyses/homotopic_InD/scene_file/example_data/example_VMHC_10k_cifti.dscalar.nii
  wb_command -show-scene  -use-window-size /home/bramirez/projects/InfantDevelopment/analyses/homotopic_InD/scene_file/VMHC_dense_surf_leftHem.scene 1 ${outfolder}/${fname}.png 1000 800
done




inputfolder=/home2/bramirez/projects/InfantDevelopment/analyses/homotopic_InD/results_v1/Fitng_volumetric_runs_results_FD-thr-2.000000e-01_parcellated-1
outfolder=${inputfolder}/scene_images
##mkdir ${outfolder}
#for a in $(ls ${inputfolder}/*dscalar.nii); do
  #echo $a        
  a=${inputfolder}/Mean_HomotopicConn.dscalar.nii
  fname=`basename ${a::-12}`
  echo $fname
  rm -r /home/bramirez/projects/InfantDevelopment/analyses/homotopic_InD/scene_file/example_data/example_VMHC_10k_cifti.dscalar.nii
  cp ${a} /home/bramirez/projects/InfantDevelopment/analyses/homotopic_InD/scene_file/example_data/example_VMHC_10k_cifti.dscalar.nii
  wb_command -show-scene  -use-window-size /home/bramirez/projects/InfantDevelopment/analyses/homotopic_InD/scene_file/VMHC_dense_surf_leftHem.scene 1 ${outfolder}/${fname}.png 1000 800
#done
