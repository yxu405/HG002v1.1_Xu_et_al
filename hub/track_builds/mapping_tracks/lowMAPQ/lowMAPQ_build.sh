#!/bin/bash


sort -k1,1 -k2,2n HG002v1.1_HiFi_winnowmap_lowMAPQ.bedgraph > temp && 
	mv temp HG002v1.1_HiFi_winnowmap_lowMAPQ.bedgraph
sort -k1,1 -k2,2n HG002v1.1_ONT_winnowmap_lowMAPQ.bedgraph > temp && 
	mv temp HG002v1.1_ONT_winnowmap_lowMAPQ.bedgraph

conda activate ucsc-bedgraphtobigwig
bedGraphToBigWig \
	HG002v1.1_HiFi_winnowmap_lowMAPQ.bedgraph \
	/public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
	HG002v1.1_HiFi_winnowmap_lowMAPQ.bigwig
bedGraphToBigWig \
	HG002v1.1_ONT_winnowmap_lowMAPQ.bedgraph \
	/public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
	HG002v1.1_ONT_winnowmap_lowMAPQ.bigwig
conda deactivate