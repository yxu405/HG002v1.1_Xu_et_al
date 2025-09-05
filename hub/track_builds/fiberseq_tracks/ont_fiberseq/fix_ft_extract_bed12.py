#!/usr/bin/env python3

def fix_bed_blocks(input_line):
    """
    Fix overlapping blocks in a BED12 line by merging overlapping blocks
    and adjusting block sizes and starts accordingly.
    """
    fields = input_line.strip().split('\t')
    
    if len(fields) < 12:
        return input_line
    
    # Extract block information
    chrom_start = int(fields[1])
    block_count = int(fields[9])
    block_sizes = [int(x) for x in fields[10].rstrip(',').split(',')]
    block_starts = [int(x) for x in fields[11].rstrip(',').split(',')]
    
    # Create list of (start, end) tuples
    blocks = []
    for i in range(block_count):
        abs_start = chrom_start + block_starts[i]
        abs_end = abs_start + block_sizes[i]
        blocks.append((abs_start, abs_end))
    
    # Sort blocks by start position
    blocks.sort()
    
    # Merge overlapping blocks
    merged = []
    current_start, current_end = blocks[0]
    
    for block in blocks[1:]:
        if block[0] <= current_end:  # Overlap found
            current_end = max(current_end, block[1])
        else:
            merged.append((current_start, current_end))
            current_start, current_end = block
    merged.append((current_start, current_end))
    
    # Convert back to relative coordinates
    new_starts = []
    new_sizes = []
    for start, end in merged:
        new_starts.append(start - chrom_start)
        new_sizes.append(end - start)
    
    # Update fields
    fields[9] = str(len(merged))
    fields[10] = ','.join(str(x) for x in new_sizes) + ','
    fields[11] = ','.join(str(x) for x in new_starts) + ','
    
    return '\t'.join(fields)

def main():
    import sys
    
    input_file = sys.argv[1]
    output_file = sys.argv[2]
    
    with open(input_file, 'r') as fin, open(output_file, 'w') as fout:
        for line in fin:
            fixed_line = fix_bed_blocks(line)
            fout.write(fixed_line + '\n')

if __name__ == '__main__':
    main()