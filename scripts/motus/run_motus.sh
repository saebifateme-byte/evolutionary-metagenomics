#!/bin/bash

# mOTUs taxonomic profiling
# Input: paired-end metagenomic reads
# Output: mOTUs abundance profiles


# Output directory
output_motus="motus_results"

mkdir -p ${output_motus}


echo "Starting mOTUs profiling..."


# Samples to analyze
samples=("CONTROL" "REGEN")


for sample in "${samples[@]}"
do

    echo "Processing sample: ${sample}"

    # Input reads
    forward="${sample}_R0.1.fq.gz"
    reverse="${sample}_R0.2.fq.gz"

    # Output file
    output_file="${output_motus}/${sample}_motus.txt"


    motus profile \
    -s "${forward},${reverse}" \
    -o "${output_file}" \
    -l 50


    echo "${sample} completed"

done


echo "All mOTUs analyses finished!"