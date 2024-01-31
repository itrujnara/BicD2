from Bio import SeqIO
import sys

def main():
    if len(sys.argv) < 3:
        raise ValueError("Not enough arguments. Usage: aln2fasta.py [in.aln] [out.fa]")
    aln = SeqIO.parse(sys.argv[1], "clustal")
    SeqIO.write(aln, sys.argv[2], "fasta")

if __name__ == "__main__":
    main()

