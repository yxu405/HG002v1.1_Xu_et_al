#!/bin/bash

# IDK I GOT THEM ALL FROM HAILEY

# manually had to change one line from DR and STR: End coordinate 133573714 bigger than chr12_PATERNAL size of 133573713
# changed 133573714 -> 133573713

conda activate /public/home/jmmenend/.conda/envs/ucsc-browsertools
for file in *.bed; do
    echo $file
    bedToBigBed \
    -extraIndex=name \
    -type=bed9 \
    -as="${file}.as" \
    "${file}" \
    /public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
    "${file%.bed}.bb"
done

# manually had to change many lines from DR STR: End coordinate 133573714 bigger than chr12_PATERNAL size of 133573713
# changed 133573714 -> 133573713 [same issue but like 3 times]
bedToBigBed \
    -extraIndex=name \
    -type=bed9 \
    -as=HG002v1.1_DR.gff.bed.as \
    HG002v1.1_DR.gff.bed \
    /public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
    HG002v1.1_DR.gff.bb

# manually had to change many lines from STR: End coordinate 133573714 bigger than chr12_PATERNAL size of 133573713
# changed 133573714 -> 133573713 [same issue but like 3 times]
bedToBigBed \
    -extraIndex=name \
    -type=bed9 \
    -as=HG002v1.1_DR.gff.bed.as \
    HG002v1.1_STR.gff.bed \
    /public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
    HG002v1.1_STR.gff.bb