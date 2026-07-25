#!/bin/bash

# Sorting mOTUs output tables


echo "Sorting CONTROL results..."

awk -F'\t' '$1 !~ /^#/ && $2 != 0' \
CONTROL_motus.txt | \
sort -t$'\t' -k2,2nr \
> CONTROL_motus_sorted.txt



echo "Sorting REGEN results..."

awk -F'\t' '$1 !~ /^#/ && $2 != 0' \
REGEN_motus.txt | \
sort -t$'\t' -k2,2nr \
> REGEN_motus_sorted.txt


echo "Sorting completed!"