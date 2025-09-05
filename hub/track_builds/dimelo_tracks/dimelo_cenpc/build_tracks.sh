#!/bin/bash

# modkit pileup from Q100 data. EXAMPLE: 
modkit pileup \
    -t 32 \
    --ignore h \
    --force-allow-implicit \
    --cpg \
    --ref ${ref_fasta} \
    --combine-strands \
    --filter-threshold C:0.5 --mod-threshold m:0.8 \
    ${input_bam} ${output_5mC}

# awk to make bedgraph of fraction modified with coverage over 10
awk -F "\t" -v OFS="\t" '$10 > 10 {print $1, $2, $3, $11}' "${output_5mC}" > "${output_5mC_bedgraph}"


### DID ABOVE FOR EACH OF THE FOLLOWING FILES

cd /public/groups/migalab/HG002v1.1_censat_browser/hub/track_builds/dimelo_tracks/dimelo_cenpc
awk 'BEGIN{FS=OFS="\t"} { $5=1; print }' beds/DiMeLo_CENPC_AS_5mC_6mA_HG002v1.1_01_09_24.5mC_pileup.centrodip.bed > beds/DiMeLo_CENPC_AS_5mC_6mA_HG002v1.1_01_09_24.5mC_pileup.centrodip.bed.tmp
mv beds/DiMeLo_CENPC_AS_5mC_6mA_HG002v1.1_01_09_24.5mC_pileup.centrodip.bed.tmp beds/DiMeLo_CENPC_AS_5mC_6mA_HG002v1.1_01_09_24.5mC_pileup.centrodip.bed
bedToBigBed \
	-type=bed9 \
	-as=autosql/DiMeLo_CENPC_CDR.as \
	beds/DiMeLo_CENPC_AS_5mC_6mA_HG002v1.1_01_09_24.5mC_pileup.centrodip.bed \
	/public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
	DiMeLo_CENPC_AS_5mC_6mA_HG002v1.1_01_09_24.5mC_pileup.centrodip.bb