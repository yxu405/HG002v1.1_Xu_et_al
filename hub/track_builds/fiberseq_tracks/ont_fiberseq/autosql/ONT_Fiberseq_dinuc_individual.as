table NUC_ONT_Fiberseq_Reads 
"Individual ONT Fiberseq Reads with Dinucleosomes (over 210bp). Generated with fibertools."
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
    int blockCount;   "Number of dinucleosomes mark on a read"
    int[blockCount] blockSizes;   "Sizes of dinucleosome marks"
    int[blockCount] chromStarts;  "Relative position on read of each dinucleosome"
    )