echo ""
echo "=================================="
echo "Running stringent mOTUs profiling (-g 4)..."
echo "=================================="

for sample in "${samples[@]}"
do

    forward="${sample}_R0.1.fq.gz"
    reverse="${sample}_R0.2.fq.gz"

    output_file="${output_dir}/${sample}_motus_min4.txt"

    motus profile \
        -s "${forward},${reverse}" \
        -o "${output_file}" \
        -l 50 \
        -g 4

    awk -F'\t' '$1 !~ /^#/ && $2 != 0' \
        "${output_file}" \
        | sort -t$'\t' -k2,2nr \
        > "${output_dir}/${sample}_motus_min4_sorted.txt"

    echo "${sample} (min4) completed."

done