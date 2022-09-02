#Setting up data for infant development
# make symlinks to original data.
data_base=/projects/bramirez/data/dcanumn_bids_out/priors_usr_template/
out_base=/home/bramirez/projects/InfantDevelopment/data/
#mkdir ${out_base}/32k_GSR
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
    echo "${a}"
    echo "sub-${subject}_ses-${sesh}"
  done
  echo "$subject"
done



  stat --printf="%s" /projects/bramirez/data/info/${subject}_session_dates_complete.txt
  sesh=${allsesh[a]}
  
#orig_dir=/projects/bids_warehouse_monkey/
orig_dir=/projects/bramirez/data/dcanumn_bids_out/priors_usr_template/
new_dir=/projects/bramirez/data/UNet_masks/regular_masks/yrk_masked/
out_dir=/projects/bramirez/data/dcanumn_bids_in/
varn=`echo ${#allsesh[*]}`
echo $varn

T1modelfolder=/home/bramirez/projects/OOPs/UNet/models/OOPs_3masks_v1/
T1modelname=model-29-epoch
T2modelfolder=/home/bramirez/projects/OOPs/UNet/models/T2w_model/
T2modelname=model-31-epoch
b=0
#mkdir ${new_dir}/sub-${subject}
for a in {0..17}; do
  b=$((b+1))
  #a=1 #testing delete before
  sesh=${allsesh[a]}
  echo ${sesh}
#done
  #mkdir ${new_dir}/sub-${subject}/ses-${sesh}
  #mkdir ${new_dir}/sub-${subject}/ses-${sesh}/anat

  for rn in `ls  ${orig_dir}/sub-${subject}/ses-${sesh}/files/masks/T1w_average.nii.gz` ; do
    echo ${rn: : -7}
    oanat=`basename ${rn}`
    rm -f ${new_dir}/sub-${subject}/ses-${sesh}/anat/${oanat}
    cp ${rn} ${new_dir}/sub-${subject}/ses-${sesh}/anat/${oanat}
    rm -f ${new_dir}/sub-${subject}/ses-${sesh}/anat/${oanat: : -7}_pre_mask.nii.gz

    docker run \
    -v ${new_dir}/sub-${subject}/ses-${sesh}/anat/:/input \
    -v ${new_dir}/sub-${subject}/ses-${sesh}/anat/:/output \
    -v ${orig_dir}:${orig_dir} \
    -v ${T1modelfolder}/:/models \
    sandywangrest/deepbet \
    muSkullStrip.py \
    -in /input/${oanat} \
    -model /models/${T1modelname} \
    -out /output
    rm ${out_dir}/sub-${subject}/ses-${sesh}/anat/sub-${subject}_ses-${sesh}_T1w.nii.gz
    cp  ${new_dir}/sub-${subject}/ses-${sesh}/anat/${oanat} ${out_dir}/sub-${subject}/ses-${sesh}/anat/sub-${subject}_ses-${sesh}_T1w.nii.gz

    #${rn: : -7}.json ${new_dir}/sub-${subject}/ses-${sesh}/anat/${oanat: : -7}.json
   # echo ${oanat: : -7}
  done

done

