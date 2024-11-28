table Fiberseq_HiFi_Coverage
"Read Coverage from HiFi Fiberseq Reads. Filtered out MAPQ<10 and aligned length<10kb."
    ( 
    string chrom;    "Genomic sequence name"
    uint chromStart;     "Start in genomic sequence"
    uint chromEnd;       "End in genomic sequence"
    string name;     "Read Coverage"
    )