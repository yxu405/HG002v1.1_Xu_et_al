#!/bin/bash

conda activate /public/home/jmmenend/.conda/envs/biopython

wget https://raw.githubusercontent.com/kmiga/alphaAnnotation/refs/heads/main/tools/scripts/create_cenpb_pjalpha_bed.py
python create_cenpb_pjalpha_bed.py \
    --fasta ../../hg002v1.1.fasta \
    --bed ../cenSat/hg002v1.1.cenSatv2.0.bed \
    --output_prefix hg002v1.1

bedToBigBed \
    -extraIndex=name \
    -type=bed9 \
    -tab \
    -as=asat_cenpb.as \
    -sizesIs2Bit \
    hg002v1.1_cenpb.bed  \
    ../../hg002v1.1.fasta.2bit \
    hg002v1.1_cenpb.bb

bedToBigBed \
    -extraIndex=name \
    -type=bed9 \
    -tab \
    -as=asat_pjalpha.as \
    -sizesIs2Bit \
    hg002v1.1_pjalpha.bed  \
    ../../hg002v1.1.fasta.2bit \
    hg002v1.1_pjalpha.bb