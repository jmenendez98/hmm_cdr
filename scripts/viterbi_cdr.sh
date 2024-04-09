#!/bin/bash

pileup_bed=$1
strict_bed =$2
transition_bed=$3
hmm_bed=$4

# source conda install to be able to activate it later
source "/private/home/jmmenend/anaconda3/etc/profile.d/conda.sh"
# create variable for the bedtools conda install path
numpy="/private/groups/migalab/jmmenend/conda_envs/numpy"

# make output folder
if [ ! -d $output_folder ]; then
  mkdir -p $output_folder
fi

# extract file name prefix
prefix=$(basename -- "${strict_bed%.strictCDR.bed}")
echo "Prefix: $prefix"

# find pileup file
pileup_bed="${pileup_folder}/${prefix}.bed"
transition_bed="${transitions_folder}/${prefix}.transitions.bed"
hmm_bed="${output_folder}/${prefix}.hmmCDR.bed"
cpgProb=$(awk -F'\t' '{print $4}' $pileup_bed | \
	sort -n | \
	awk ' { a[i++]=$1; } END { if (NR % 2 == 1) { print a[int(NR/2)]; } else { print (a[NR/2-1] + a[NR/2])/2; } }')

echo "strict_bed: $strict_bed"
echo "pileup_bed: $pileup_bed"
echo "transition_bed: $transition_bed"
echo "hmm_bed: $hmm_bed"
echo "cpgprob_median: $cpgProb"

conda activate $numpy
python3 /private/home/jmmenend/software/HMMCDRReferenceDetection.v5.py \
	-m -a $pileup_bed \
	-b $strict_bed \
	-t $transition_bed \
	-o $hmm_bed
conda deactivate
sort -k 1,1 -k2,2n $hmm_bed -o "${hmm_bed%.bed}.sort.bed"

echo "Done!"
