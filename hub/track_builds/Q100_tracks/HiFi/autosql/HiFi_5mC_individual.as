table HiFi_5mC_Individual_Reads
"Individual HiFi Reads with 5mC CpG Methylation (ML Threshold: 204). Generated with fibertools extract."
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