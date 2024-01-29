from ete3 import PhyloTree, TreeStyle, faces, SeqMotifFace
from Bio import AlignIO


def main() -> None:
    # reading data
    t = PhyloTree("../seqs_250.dnd")
    # aln = AlignIO.read("../seqs_250.aln", "clustal")

    # tree style
    ts = TreeStyle()
    ts.show_leaf_name = True
    ts.scale = 50  # You can adjust the scale as needed

    # linking
    t.link_to_alignment("../seqs_250_aligned.fa", "fasta")

    # some style magic
    seq_face = SeqMotifFace('seq', seq_format='seq', gap_format='_')
    ts.aligned_header.add_face(seq_face, column=0)

    # rendering to file
    t.render("tree2.png", tree_style = ts)
    # t.show()


if __name__ == "__main__":
    main() 
