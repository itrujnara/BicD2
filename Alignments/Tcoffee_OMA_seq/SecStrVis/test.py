from Bio import SeqIO
from p5 import *

amino_acid_colors = {
    'A': '#80C7E8',  # Alanine
    'R': '#FF5050',  # Arginine
    'N': '#FFD966',  # Asparagine
    'D': '#FF8080',  # Aspartic Acid
    'C': '#FFD700',  # Cysteine
    'Q': '#FFA07A',  # Glutamine
    'E': '#FF4500',  # Glutamic Acid
    'G': '#98FB98',  # Glycine
    'H': '#9400D3',  # Histidine
    'I': '#00CED1',  # Isoleucine
    'L': '#00FF00',  # Leucine
    'K': '#1E90FF',  # Lysine
    'M': '#8A2BE2',  # Methionine
    'F': '#DC143C',  # Phenylalanine
    'P': '#FF69B4',  # Proline
    'S': '#87CEEB',  # Serine
    'T': '#D8BFD8',  # Threonine
    'W': '#800080',  # Tryptophan
    'Y': '#FFFF00',  # Tyrosine
    'V': '#228B22',  # Valine
    '-': '#C0C0C0'   # Gap (Hyphen)
}

seqs = SeqIO.to_dict(SeqIO.parse("seqs_aligned.fa", "fasta"))

human_seq = str(seqs["HUMAN97600"].seq)

def setup():
    size(10 * len(human_seq), 10)
    background(0)

def draw():
    for i, entry in enumerate(human_seq):
        fill(amino_acid_colors[entry])
        rect((10 * i, 0), 10, 10)

if __name__ == "__main__":
    run()
