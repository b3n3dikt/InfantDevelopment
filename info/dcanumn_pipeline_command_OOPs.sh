sesh=$1
cores=1
echo ${sesh}

echo "START" > /projects/bramirez/data/dcanumn_bids_out/run_w_prior_masks/proc_times/OOPS_${sesh}.txt
date >> /projects/bramirez/data/dcanumn_bids_out/run_w_prior_masks/proc_times/OOPS_${sesh}.txt



echo "docker run -i --rm -v /projects/bramirez/data/monkey_bids_in:/input -v /projects/bramirez/data/dcanumn_bids_out/run_w_prior_masks:/output -v /home/bramirez/projects/ROI_sets/templates_all/:/atlases -v /home/bramirez/code/ROI_sets/Surface_schemes/Monkey/:/opt/dcan-tools/dcan_bold_proc/templates/parcellations -v /projects/bramirez/data/UNet_masks/regular_masks/monkey_bids_in/:/mask_priors -v /home/bramirez/pipelines/dcan-macaque-pipeline-jsbr/fMRIVolume:/opt/pipeline/fMRIVolume -v /home/bramirez/pipelines/freesurfer/license.txt:/license dcanumn/nhp-abcd-bids-pipeline /input /output --participant-label OOPS --session-id [ ${sesh} ] --ncpus 1 --t1-brain-mask /mask_priors/sub-OOPS/ses-${sesh}/anat/sub-OOPS_ses-${ses}_T1w_pre_mask.nii.gz --multi-template-dir /atlases/JointLabelCouncil_HFDLuteinOOPs --hyper-normalization-method ROI_IPS --max-cortical-thickness 30 --freesurfer-license=/license" >> /projects/bramirez/data/dcanumn_bids_out/proc_times/OOPS_${sesh}.txt

#sesh=20201015
#cores=1
echo "DELETE THIS WHEN YOU HAVE ADDED THE PATHS TO THE NEWLY MADE ASEG FILES"
docker run -i --rm -v /projects/bramirez/data/monkey_bids_in:/input -v /projects/bramirez/data/dcanumn_bids_out/run_w_prior_masks:/output -v /home/bramirez/projects/ROI_sets/templates_all/:/atlases -v /home/bramirez/code/ROI_sets/Surface_schemes/Monkey/:/opt/dcan-tools/dcan_bold_proc/templates/parcellations -v /projects/bramirez/data/UNet_masks/regular_masks/monkey_bids_in/:/mask_priors -v /home/bramirez/pipelines/dcan-macaque-pipeline-jsbr/fMRIVolume:/opt/pipeline/fMRIVolume -v /home/bramirez/pipelines/freesurfer/license.txt:/license dcanumn/nhp-abcd-bids-pipeline /input /output --participant-label OOPS --session-id [ ${sesh} ] --ncpus ${cores} --t1-brain-mask /mask_priors/sub-OOPS/ses-${sesh}/anat/sub-OOPS_ses-${sesh}_T1w_pre_mask.nii.gz --multi-template-dir /atlases/JointLabelCouncil_HFDLuteinOOPs --hyper-normalization-method ROI_IPS --max-cortical-thickness 30 --freesurfer-license=/license 
#--print-commands-only

echo "END" >> /projects/bramirez/data/dcanumn_bids_out/proc_times/OOPS_${sesh}.txt

date >> /projects/bramirez/data/dcanumn_bids_out/proc_times/OOPS_${sesh}.txt



#docker run -i --rm -v /projects/bramirez/data/monkey_bids_in:/input -v /projects/bramirez/data/dcanumn_bids_out/run_w_prior_masks:/output -v /home/bramirez/projects/ROI_sets/templates_all/:/atlases -v /home/bramirez/code/ROI_sets/Surface_schemes/Monkey/:/opt/dcan-tools/dcan_bold_proc/templates/parcellations -v /projects/bramirez/data/UNet_masks/regular_masks/monkey_bids_in/:/mask_priors -v /home/bramirez/pipelines/dcan-macaque-pipeline-jsbr/fMRIVolume:/opt/pipeline/fMRIVolume -v /home/bramirez/pipelines/freesurfer/license.txt:/license dcanumn/nhp-abcd-bids-pipeline /input /output --participant-label OOPS --session-id [ ${sesh} ] --ncpus ${cores} --t1-brain-mask /mask_priors/sub-OOPS/ses-${sesh}/anat/sub-OOPS_ses-${sesh}_T1w_pre_mask.nii.gz --multi-template-dir /atlases/JointLabelCouncil_HFDLuteinOOPs --hyper-normalization-method ROI_IPS --make-white-from-norm-t1 --max-cortical-thickness 30 --freesurfer-license=/license 

#docker run -it --rm -v /projects/bramirez/data/monkey_bids_in:/input -v /projects/bramirez/data/dcanumn_bids_out/run_w_prior_masks:/output -v /home/bramirez/pipelines/dcan-macaque-pipeline-jsbr/fMRIVolume:/opt/pipeline/fMRIVolume -v /home/bramirez/projects/ROI_sets/templates_all/:/atlases -v /home/bramirez/code/ROI_sets/Surface_schemes/Monkey/:/opt/dcan-tools/dcan_bold_proc/templates/parcellations -v /projects/bramirez/data/UNet_masks/regular_masks/monkey_bids_in/:/mask_priors -v /home/bramirez/pipelines/freesurfer/license.txt:/license --entrypoint bash dcanumn/nhp-abcd-bids-pipeline 

#docker run -it --rm -v /projects/bramirez/data/monkey_bids_in:/input -v /projects/bramirez/data/dcanumn_bids_out/run_w_prior_masks:/output -v /home/bramirez/pipelines/dcan-macaque-pipeline-jsbr/fMRIVolume:/opt/pipeline/fMRIVolume -v /home/bramirez/projects/ROI_sets/templates_all/:/atlases -v /projects/bramirez/data/UNet_masks/regular_masks/monkey_bids_in/:/mask_priors -v /home/bramirez/pipelines/freesurfer/license.txt:/license --entrypoint bash dcanumn/nhp-abcd-bids-pipeline 
