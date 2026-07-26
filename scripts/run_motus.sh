#!/bin/bash

# ==========================================================
# mOTUs taxonomic profiling
# Input : Paired-end metagenomic reads
# Output: Sorted mOTUs abundance tables
# ==========================================================

# Output directory
output_dir="motus_results"

mkdir -p "${output_dir}"

echo "=================================="
echo "Starting mOTUs profiling..."
echo "=================================="

# Samples
samples=("CONTROL" "REGEN")

for sample in "${samples[@]}"
do
    echo ""
    echo "Processing ${sample}..."

    # Input reads
    forward="${sample}_R0.1.fq.gz"
    reverse="${sample}_R0.2.fq.gz"

    # Output file
    output_file="${output_dir}/${sample}_motus.txt"

    # Run mOTUs
    motus profile \
        -s "${forward},${reverse}" \
        -o "${output_file}" \
        -l 50

    echo "Sorting ${sample} results..."

    awk -F'\t' '$1 !~ /^#/ && $2 != 0' \
        "${output_file}" \
        | sort -t$'\t' -k2,2nr \
        > "${output_dir}/${sample}_motus_sorted.txt"

    echo "${sample} completed."

done

echo ""
echo "=================================="
echo "All analyses completed successfully!"
echo "Results are stored in: ${output_dir}"
echo "=================================="