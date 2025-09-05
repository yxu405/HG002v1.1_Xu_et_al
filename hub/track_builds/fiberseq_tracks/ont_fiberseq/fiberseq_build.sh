#!/bin/bash

# sort bed files
for file in beds/*.bed; do
    sort -k1,1 -k2,2n $file > temp0 && mv temp0 $file
done

for file in beds/*.bedgraph; do
    sort -k1,1 -k2,2n $file > temp1 && mv temp1 $file
done

# fix overlapping blocks in bed12s
conda activate python3
for file in beds/*.bed; do
    python3 fix_ft_extract_bed12.py $file temp_fix.bed && mv temp_fix.bed $file
done
conda deactivate

# convert to bigdata type
conda activate ucsc-browsertools
bedToBigBed \
    -type=bed12 \
    -as=autosql/ONT_Fiberseq_msp_individual.as \
    beds/Fiberseq_6mA_5mhCG_dorado082_HG002v1.1_winnowmap_merged_q10_10kb_ft_extract_msp.bed \
    /public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
    Fiberseq_6mA_5mhCG_dorado082_HG002v1.1_winnowmap_merged_q10_10kb_ft_extract_msp.bb
bedToBigBed \
    -type=bed12 \
    -as=autosql/ONT_Fiberseq_bigmsp_individual.as \
    beds/Fiberseq_6mA_5mhCG_dorado082_HG002v1.1_winnowmap_merged_q10_10kb_ft_extract_bigmsp.bed \
    /public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
    Fiberseq_6mA_5mhCG_dorado082_HG002v1.1_winnowmap_merged_q10_10kb_ft_extract_bigmsp.bb
bedToBigBed \
    -type=bed12 \
    -as=autosql/ONT_Fiberseq_nuc_individual.as \
    beds/Fiberseq_6mA_5mhCG_dorado082_HG002v1.1_winnowmap_merged_q10_10kb_ft_extract_nuc.bed \
    /public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
    Fiberseq_6mA_5mhCG_dorado082_HG002v1.1_winnowmap_merged_q10_10kb_ft_extract_nuc.bb
bedToBigBed \
    -type=bed12 \
    -as=autosql/ONT_Fiberseq_dinuc_individual.as \
    beds/Fiberseq_6mA_5mhCG_dorado082_HG002v1.1_winnowmap_merged_q10_10kb_ft_extract_dinuc.bed \
    /public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
    Fiberseq_6mA_5mhCG_dorado082_HG002v1.1_winnowmap_merged_q10_10kb_ft_extract_dinuc.bb
bedToBigBed \
    -type=bed12 \
    -as=autosql/ONT_Fiberseq_5mC_individual.as \
    beds/Fiberseq_6mA_5mhCG_dorado082_HG002v1.1_winnowmap_merged_q10_10kb_ft_extract_5mC.bed \
    /public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
    Fiberseq_6mA_5mhCG_dorado082_HG002v1.1_winnowmap_merged_q10_10kb_ft_extract_5mC.bb
bedToBigBed \
    -type=bed12 \
    -as=autosql/ONT_Fiberseq_6mA_individual.as \
    beds/Fiberseq_6mA_5mhCG_dorado082_HG002v1.1_winnowmap_merged_q10_10kb_ft_extract_6mA.bed \
    /public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
    Fiberseq_6mA_5mhCG_dorado082_HG002v1.1_winnowmap_merged_q10_10kb_ft_extract_6mA.bb

bedGraphToBigWig \
    beds/Fiberseq_6mA_5mhCG_dorado082_HG002v1.1_winnowmap_merged_q10_10kb_ft_extract_nuc.bedgraph \
    /public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
    Fiberseq_6mA_5mhCG_dorado082_HG002v1.1_winnowmap_merged_q10_10kb_ft_extract_nuc.bigwig
bedGraphToBigWig \
    beds/Fiberseq_6mA_5mhCG_dorado082_HG002v1.1_winnowmap_merged_q10_10kb_ft_extract_msp.bedgraph \
    /public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
    Fiberseq_6mA_5mhCG_dorado082_HG002v1.1_winnowmap_merged_q10_10kb_ft_extract_msp.bigwig
bedGraphToBigWig \
    beds/Fiberseq_6mA_5mhCG_dorado082_HG002v1.1_winnowmap_merged_q10_10kb_ft_extract_dinuc.bedgraph \
    /public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
    Fiberseq_6mA_5mhCG_dorado082_HG002v1.1_winnowmap_merged_q10_10kb_ft_extract_dinuc.bigwig
bedGraphToBigWig \
    beds/Fiberseq_6mA_5mhCG_dorado082_HG002v1.1_winnowmap_merged_q10_10kb_ft_extract_bigmsp.bedgraph \
    /public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
    Fiberseq_6mA_5mhCG_dorado082_HG002v1.1_winnowmap_merged_q10_10kb_ft_extract_bigmsp.bigwig
bedGraphToBigWig \
    beds/Fiberseq_6mA_5mhCG_dorado082_HG002v1.1_winnowmap_merged_ft_q10_10kb.genomecov.bedgraph \
    /public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
    Fiberseq_6mA_5mhCG_dorado082_HG002v1.1_winnowmap_merged_ft_q10_10kb.genomecov.bigwig
conda deactivate