table CENPA_DiMeLo_OLD_5mC_AS_Individual_Reads
"Individual Read CENP-A DiMeLo (HIGH-passage HG002 cells) 5mC Methylation (modkit call-mods -p 0.1). Sequencing done with Adaptive Sampling for Alpha-Sat. BED12 generated with fibertools extract."
   ( 
    string chrom;    "chromosome name"
    uint chromStart;     "Start in genomic sequence"
    uint chromEnd;       "End in genomic sequence"
    string name;     "read id"
    uint score;       "always 0"
    char[1] strand;     "always ."
    uint thickStart;   "Start of where display should be thick"
    uint thickEnd;     "End of where display should be thick"
    uint reserved;     "color"
    int blockCount;   "Number of 5mC marks on a read"
    int[blockCount] blockSizes;   "Size of 5mC marks(always 1)"
    int[blockCount] chromStarts;  "Relative position on read of each 5mC mark"
    )