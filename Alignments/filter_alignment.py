from Bio import SeqIO
import sys

def filter_gap_positions(input_file, output_file, gap_threshold=0.95):
    sequences = SeqIO.parse(input_file, "fasta")

    # Get the length of the alignment
    alignment_length = len(next(sequences).seq)

    # Initialize a list to store positions with less than the gap threshold
    valid_positions = []

    # Count the number of gaps at each position
    gap_counts = [0] * alignment_length

    # Iterate through the sequences and count gaps
    for record in sequences:
        sequence = str(record.seq)
        gap_counts = [count + (base == '-') for count, base in zip(gap_counts, sequence)]

    # Identify positions with less than the gap threshold
    for position, gap_count in enumerate(gap_counts):
        if gap_count / len(gap_counts) <= gap_threshold:
            valid_positions.append(position)

    # Filter out positions with more than the gap threshold
    filtered_sequences = []
    sequences = SeqIO.parse(input_file, "fasta")
    for record in sequences:
        filtered_sequence = ''.join([record.seq[pos] for pos in valid_positions])
        filtered_record = record
        filtered_record.seq = filtered_sequence
        filtered_sequences.append(filtered_record)

    # Write the filtered sequences to the output file
    with open(output_file, "w") as output_handle:
        SeqIO.write(filtered_sequences, output_handle, "fasta")


def main() -> None:
    if len(sys.argv) < 3:
        raise ValueError("Not enough arguments. Usage: filter_alignment.py [input] [output] [threshold?]")
    threshold = sys.argv[3] if len(sys.argv) > 3 else 0.95
    filter_gap_positions(sys.argv[1], sys.argv[2])

if __name__ == "__main__":
    main()
