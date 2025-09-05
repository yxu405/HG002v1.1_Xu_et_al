table MSP_ONT_Fiberseq_Reads 
"Individual ONT Fiberseq Reads with large MSPs (over 150bp) called using Fibertools(modkit call-mods -p 0.1). Generated with fibertools extract."
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
    int blockCount;   "Number of large MSPs marks on a read"
    int[blockCount] blockSizes;   "Size of large MSP marks"
    int[blockCount] chromStarts;  "Relative position on read of each MSP mark"
    )