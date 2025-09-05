table CENPA_DiMeLo_OLD_6mA_AS_Individual_Reads
"Individual Read CENP-A DiMeLo (LOW-passage HG002 cells) 6mA Methylation (modkit call-mods -p 0.1). Sequencing done with Adaptive Sampling for Alpha-Sat. BED12 generated with fibertools extract."
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
    int blockCount;   "Number of 6mA marks on a read"
    int[blockCount] blockSizes;   "Size of 6mA marks(always 1)"
    int[blockCount] chromStarts;  "Relative position on read of each 6mA mark"
    )