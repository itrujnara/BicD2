from Bio import SeqIO
import matplotlib.pyplot as plt
from collections import Counter

seqs = list(SeqIO.parse("bicd2_lintd.fa", "fasta"))
lengths = dict()

for seq in seqs:
    lengths[seq.id.split('/')[0]] = len(seq.seq) - seq.seq.count('-')

for it in lengths.items():
    print(f"{it[0]}: {it[1]}")

ctr = dict(Counter(lengths.values()))
plt.bar(ctr.keys(), ctr.values())
plt.show()
