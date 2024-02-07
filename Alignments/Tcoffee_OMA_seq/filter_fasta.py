from Bio import SeqIO

seqs = SeqIO.parse("seqs_oma.fa", "fasta")

with open("offenders.txt") as f:
    offenders = [line.strip() for line in f]

seqs_filtered = [s for s in seqs if s.name not in offenders]

SeqIO.write(seqs_filtered, "seqs_oma_filtered.fa", "fasta")
