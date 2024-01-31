from ete3 import PhyloTree, PhyloNode, TreeStyle, NodeStyle, faces, SeqMotifFace
from Bio import AlignIO


def main() -> None:
    # reading data
    t = PhyloTree("../seqs_250.dnd")
    # aln = AlignIO.read("../seqs_250.aln", "clustal")

    # reading names
    code2name = {}
    with open("../uniprot_names.tsv") as f:
        for line in f:
            code, name = line.split('\t')
            code2name[code] = name 

    def get_species(node_name):
        spcode = node_name.split("_")[-1]
        spname = code2name[spcode]
        return spname

    # tree style
    ts = TreeStyle()
    ts.show_leaf_name = False
    ts.scale = 50000  # You can adjust the scale as needed
    # ts.layout_fn = mylayout
    
    # linking
    t.link_to_alignment("../seqs_250_aligned.fa", "fasta")
    t.ladderize()
    t.set_species_naming_function(get_species)

    # some style magic
    # seq_face = SeqMotifFace('seq', seq_format='seq', gap_format='_')
    # ts.aligned_header.add_face(seq_face, column = 0)

    # node style
    for l in t.iter_leaves():
        # create a new label with a color attribute
        N = faces.AttrFace("name", fgcolor = "Red")
        # label margins
        N.margin_top = N.margin_bottom = N.margin_left = 4.0
        # labels aligned to the same level
        l.add_face(N, 1, position='aligned')
        # optionally colorize nodes too
        ns = NodeStyle()
        ns["fgcolor"] = "Red"
        l.img_style = ns


    # rendering to file
    t.render("tree.png", tree_style = ts)


if __name__ == "__main__":
    main() 
