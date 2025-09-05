#!/bin/bash

# GOT THE FILES FROM HAILEY AGAIN

# had to round to an int 
awk 'BEGIN{OFS="\t"} {$5 = int($5); print}' hg002v1.1.as_hor.bed > temp && mv temp hg002v1.1.as_hor.bed
awk 'BEGIN{OFS="\t"} {$5 = int($5); print}' hg002v1.1.as_sf.bed > temp && mv temp hg002v1.1.as_sf.bed

bedToBigBed \
    -extraIndex=name \
    -type=bed9 \
    -as=hg002v1.1.as_hor.as \
    hg002v1.1.as_hor.bed \
    /public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
    hg002v1.1.as_hor.bb

bedToBigBed \
    -extraIndex=name \
    -type=bed9 \
    -as=hg002v1.1.as_sf.as \
    hg002v1.1.as_sf.bed \
    /public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
    hg002v1.1.as_sf.bb

# Error line 35161 of hg002v1.1.as_stv.bed: name [#625:S1C1/5/19H1L.5(_6/4_5){2}_6/4(_6/4_5){7}_6/4(_6/4_5){1}_5(_6/4_5){12}_6/4(_6/4_5){1}_6/4(_6/4_5){9}_6/4(_6/4_5){1}_6/4(_6/4_5){4}_6/4(_6/4_5){1}_6/4(_6/4_5){11}_6/4(_6/4_5){6}_6/4(_6/4_5){1}_6/4(_6/4_5){15}_6/4(_6/4_5){1}_6/4(_6/4_5){3}_6/4(_6/4_5){16}_6/4(_6/4_5){25}-6] is too long (must not exceed 255 characters)
# Changed col4 for in this to "#625:lots_of_hors"
bedToBigBed \
    -extraIndex=name \
    -type=bed9 \
    -as=hg002v1.1.as_stv.as \
    hg002v1.1.as_stv.bed \
    /public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
    hg002v1.1.as_stv.bb