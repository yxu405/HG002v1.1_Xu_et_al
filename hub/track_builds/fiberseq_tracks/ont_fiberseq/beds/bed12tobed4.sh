#!/bin/bash

input=$1
output=$2

awk 'BEGIN{OFS="\t"}{split($11,sizes,",");split($12,starts,",");n=split($11,sizes,",")-1;for(i=2;i<n;i++){s=$2+starts[i];e=s+sizes[i];print $1,s,e,$4}}' $input > $output