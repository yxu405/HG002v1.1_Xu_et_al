
conda activate ucsc-browsertools

bedToBigBed \
    -type=bed3+2 \
    -as=autosql/HG002v1.1.CTCF_ChIP_liftover.as \
	beds/intersection.motifs.chip.formatted.chm13v1.1.sorted.top3k.ctcf.HG002v1.1.liftOver.bed \
	/public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
	intersection.motifs.chip.formatted.chm13v1.1.sorted.top3k.ctcf.HG002v1.1.liftOver.bb

conda deactivate