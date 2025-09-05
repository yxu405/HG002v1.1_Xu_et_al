#!/bin/bash

conda activate /public/home/jmmenend/.conda/envs/ucsc-browsertools

# censat annotations
wget https://raw.githubusercontent.com/hloucks/CenSatData/refs/heads/main/HG002/v1.1/hg002v1.1.cenSatv2.0.bed
bedToBigBed \
    -extraIndex=name \
    -type=bed9 \
    -as=censat.as \
    hg002v1.1.cenSatv2.0.bed \
    /public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
    hg002v1.1.cenSatv2.0.bb

# censat strand annotations
wget https://raw.githubusercontent.com/hloucks/CenSatData/refs/heads/main/HG002/v1.1/hg002v1.1.SatelliteStrandv2.0.bed
bedToBigBed \
    -extraIndex=name \
    -type=bed9 \
    -as=censat.as \
    hg002v1.1.SatelliteStrandv2.0.bed \
    /public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
    hg002v1.1.SatelliteStrandv2.0.bb

bedToBigBed \
    -extraIndex=name \
    -type=bed4+6 \
    -as=cenSat_repeat_masker.as \
    hg002v1.1.RepeatMasker.bed \
    /public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
    hg002v1.1.RepeatMasker.bb 