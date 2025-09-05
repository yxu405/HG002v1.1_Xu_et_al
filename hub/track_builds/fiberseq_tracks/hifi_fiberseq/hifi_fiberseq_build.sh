cd /public/groups/migalab/HG002v1.1_censat_browser/hub/track_builds/hifi_fiberseq

for file in beds/*.bed; do
    python3 fix_ft_extract_bed12.py $file temp1.bed && \
        mv temp1.bed $file
done

for file in beds/*.bed; do
    sort -k1,1 -k2,2n $file > temp0.bed && \
        mv temp0.bed $file
done

conda activate ucsc-browsertools
bedToBigBed \
    -type=bed12 \
    -as=autosql/HiFi_Fiberseq_5mC_individual.as \
	beds/Fiberseq_HiFi_Stergachis_winnowmap_winnowmap_q10_5kb_ft_5mC.bed \
	/public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
	Fiberseq_HiFi_Stergachis_winnowmap_winnowmap_q10_5kb_ft_5mC.bb
bedToBigBed \
    -type=bed12 \
    -as=autosql/HiFi_Fiberseq_6mA_individual.as \
	beds/Fiberseq_HiFi_Stergachis_winnowmap_winnowmap_q10_5kb_ft_6mA.bed \
	/public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
	Fiberseq_HiFi_Stergachis_winnowmap_winnowmap_q10_5kb_ft_6mA.bb
bedToBigBed \
    -type=bed12 \
    -as=autosql/HiFi_Fiberseq_bigmsp_individual.as \
	beds/Fiberseq_HiFi_Stergachis_winnowmap_winnowmap_q10_5kb_ft_bigmsp.bed \
	/public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
	Fiberseq_HiFi_Stergachis_winnowmap_winnowmap_q10_5kb_ft_bigmsp.bb
bedToBigBed \
    -type=bed12 \
    -as=autosql/HiFi_Fiberseq_dinuc_individual.as \
	beds/Fiberseq_HiFi_Stergachis_winnowmap_winnowmap_q10_5kb_ft_dinuc.bed \
	/public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
	Fiberseq_HiFi_Stergachis_winnowmap_winnowmap_q10_5kb_ft_dinuc.bb
bedToBigBed \
    -type=bed12 \
    -as=autosql/HiFi_Fiberseq_msp_individual.as \
	beds/Fiberseq_HiFi_Stergachis_winnowmap_winnowmap_q10_5kb_ft_dinuc.bed \
	/public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
	Fiberseq_HiFi_Stergachis_winnowmap_winnowmap_q10_5kb_ft_dinuc.bb
bedToBigBed \
    -type=bed12 \
    -as=autosql/HiFi_Fiberseq_msp_individual.as \
	beds/Fiberseq_HiFi_Stergachis_winnowmap_winnowmap_q10_5kb_ft_msp.bed \
	/public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
	Fiberseq_HiFi_Stergachis_winnowmap_winnowmap_q10_5kb_ft_msp.bb
bedToBigBed \
    -type=bed12 \
    -as=autosql/HiFi_Fiberseq_nuc_individual.as \
	beds/Fiberseq_HiFi_Stergachis_winnowmap_winnowmap_q10_5kb_ft_nuc.bed \
	/public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
	Fiberseq_HiFi_Stergachis_winnowmap_winnowmap_q10_5kb_ft_nuc.bb