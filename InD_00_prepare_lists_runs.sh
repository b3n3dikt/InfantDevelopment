info_dir=/home/bramirez/projects/InfantDevelopment/info
list_dir=/home/bramirez/projects/InfantDevelopment/scripts/InD_lists
FD_dir=/home/bramirez/projects/InfantDevelopment/data/motionFD_rad30_runs

macaque_names="MILO OOPS PETRA"


data_list=${list_dir}/scan197_runs_data.list
monkey_list=${list_dir}/scan197_runs_subject.list

run_list=${list_dir}/scan197_run.list
run_orig_list=${list_dir}/scan197_run_orig.list
sesh_list=${list_dir}/scan197_run_sesh.list
FD_list=${list_dir}/scan197_FD30.list

rm -f ${data_list} ${monkey_list} ${run_list} ${run_orig_list} ${FD_list}

for sub in ${macaque_names}; do
  scans=`cat ${info_dir}/sub-${sub}_10k_GSR_runs_smooth3mm_paths.txt`
    k=1
    for fname in ${scans}; do
       echo ${fname}
       echo ${fname} >> ${data_list}
       echo ${sub} >> ${monkey_list}
       echo ${k} >> ${run_list}
       echo $fname | cut -d '_' -f 4 >> ${run_orig_list}
       echo $fname | cut -d '_' -f 2 >> ${sesh_list}
       prefix=`echo $fname | cut -d '_' -f 1-4`
       #prefix=`echo $fname | cut -d '_' -f 4-4`
       f=`ls ${FD_dir}/*${prefix}*_mc.txt`
       fFD=`basename ${f}`
       echo ${fFD} >> ${FD_list}
       let k=$k+1
    done
done


## Volumetric parcel lists
info_dir=/home/bramirez/projects/InfantDevelopment/info
list_dir=/home/bramirez/projects/InfantDevelopment/scripts/Vol_lists
FD_dir=/home/bramirez/projects/InfantDevelopment/data/motionFD_rad30

macaque_names="MILO OOPS PETRA"


data_list=${list_dir}/scan51_data.list
monkey_list=${list_dir}/scan51_subject.list

run_list=${list_dir}/scan51_run.list
run_orig_list=${list_dir}/scan51_run_orig.list
sesh_list=${list_dir}/scan51_run_sesh.list
FD_list=${list_dir}/scan51_FD30.list

rm -f ${data_list} ${monkey_list} ${run_list} ${run_orig_list} ${FD_list}

for sub in ${macaque_names}; do
  scans=`cat ${info_dir}/sub-${sub}_10k_GSR_smooth3mm_paths_QCed.txt`
    k=1
    for fname in ${scans}; do
       echo ${fname}
       echo ${fname} >> ${data_list}
       echo ${sub} >> ${monkey_list}
       echo ${k} >> ${run_list}
       echo $fname | cut -d '_' -f 2 >> ${run_orig_list}
       echo $fname | cut -d '_' -f 2 >> ${sesh_list}
       prefix=`echo $fname | cut -d '_' -f 1-3`
       #prefix=`echo $fname | cut -d '_' -f 4-4`
       f=`ls ${FD_dir}/*${prefix}*_mc.txt`
       fFD=`basename ${f}`
       echo ${fFD} >> ${FD_list}
       let k=$k+1
    done
done

