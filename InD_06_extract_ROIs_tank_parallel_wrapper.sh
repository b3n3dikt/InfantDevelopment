


base_atlas=/home/bramirez/projects/ROI_sets/RheMAP/CHARM-SARM_converted2YRK/
#pushd ${base_atlas}

data_base=/home/bramirez/projects/InfantDevelopment/data/anat_flip
outpath=/home/bramirez/projects/InfantDevelopment/analyses/homotopic_InD/anat_traject/anat_warp_means

var=`date +"%FORMAT_STRING"`
now=`date +"%T_%m_%d_%Y"`
now=`date +"%Y-%m-%d-%H%M"`
echo "${now}"
mv ${outpath} ${outpath}_${now}
mkdir ${outpath}

cd /home2/bramirez/projects/InfantDevelopment/scripts

cat /home/bramirez/projects/InfantDevelopment/info/All_anat_flip_jacobian_warps.txt | parallel -j 12 './InD_06_extract_ROIs_tank_parallel.sh' 
