#Setting up data for infant development
# make symlinks to original data.
data_base=/projects/bramirez/data/dcanumn_bids_out/priors_usr_template/
out_base=/home/bramirez/projects/InfantDevelopment/data/
#mkdir ${out_base}/32k_GSR
mkdir ${out_base}/motion_rad50
allsubs=(`cat /projects/bramirez/data/info/InfDev_subs.txt`)
sublen=("${#allsubs[@]}")
#subject=PETRA
for s in $(eval echo "{1..$sublen}-1"); do
  subject=${allsubs[s]}
  echo "${subject}"
  allsesh=(`cat /projects/bramirez/data/info/${subject}_session_dates_complete.txt`)
  slen=("${#allsesh[@]}")
  ((slen=slen-1))
  for a in $(eval echo "{0..$slen}"); do
    sesh=${allsesh[a]}
    #echo "${a}"
    echo "sub-${subject}_ses-${sesh}"
    ln -s ${data_base}/sub-${subject}/ses-${sesh}/files/MNINonLinear/Results/ses-${sesh}_task-REST_DCANBOLDProc_v4.0.0_Atlas.dtseries.nii ${out_base}/32k_GSR/sub-${subject}_ses-${sesh}_task-REST_DCANBOLDProc_v4.0.0_Atlas.dtseries.nii
    #concat motion numbers 
    for m in $(ls ${data_base}/sub-${subject}/ses-${sesh}/files/ses-${sesh}_task-REST*/MotionCorrection_MCFLIRTbased/ses-${sesh}_task-REST*_mc.par); do
      echo ${m}
      cat ${m} >> ${out_base}/motion_rad50/sub-${subject}_ses-${sesh}_task-REST_mc.par
    done
    #cp ${data_base}/sub-${subject}/ses-${sesh}/files/
  done
  echo "$subject"
done


## fixing DeleteMe issue temporarly going to investigate why that exists later. 
data_base=/projects/bramirez/data/dcanumn_bids_out/priors_usr_template/
out_base=/home/bramirez/projects/InfantDevelopment/data/
subject=OOPS
#sesh=20190815
sesh=20190926 
rm ${out_base}/32k_GSR/sub-${subject}_ses-${sesh}_task-REST_DCANBOLDProc_v4.0.0_Atlas.dtseries.nii 

ln -s ${data_base}/sub-${subject}/ses-${sesh}/files/MNINonLinear/Results/ses-${sesh}_task-DeleteMe_DCANBOLDProc_v4.0.0_Atlas.dtseries.nii ${out_base}/32k_GSR/sub-${subject}_ses-${sesh}_task-REST_DCANBOLDProc_v4.0.0_Atlas.dtseries.nii
    #concat motion numbers 
for m in $(ls ${data_base}/sub-${subject}/ses-${sesh}/files/ses-${sesh}_task-*/MotionCorrection_MCFLIRTbased/ses-${sesh}_task-*_mc.par); do
  echo ${m}
  cat ${m} >> ${out_base}/motion_rad50/sub-${subject}_ses-${sesh}_task-REST_mc.par
done
  
  


