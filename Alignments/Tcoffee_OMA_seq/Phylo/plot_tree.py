from ete3 import PhyloTree, PhyloNode, TreeStyle, NodeStyle, faces
from Bio import AlignIO


def main() -> None:
    # reading data
    t = PhyloTree("seqs_oma_filtered.aln.treefile")
    # aln = AlignIO.read("../seqs_250.aln", "clustal")

    # reading names
    code2name = {}
    with open("../uniprot_names.tsv") as f:
        for line in f:
            code, name = line.split('\t')
            code2name[code] = name

    def get_species(node: PhyloNode):
        spcode = node.name.split("_")[-1][0:5]
        spname = code2name[spcode]
        return spname

    # tree style
    ts = TreeStyle()
    ts.show_leaf_name = False
    ts.scale = 1000  # You can adjust the scale as needed
    # ts.layout_fn = mylayout
    
    # linking
    t.link_to_alignment("../seqs_oma_filtered_aligned.fa", "fasta")
    t.ladderize()
    t.set_species_naming_function(get_species)

    # some style magic
    # seq_face = SeqMotifFace('seq', seq_format='seq', gap_format='_')
    # ts.aligned_header.add_face(seq_face, column = 0)

    # node style
    for l in t.iter_leaves():
        # create a new label with a color attribute
        # N = faces.AttrFace("name", fgcolor = "Red")
        S = faces.AttrFace("species", fgcolor = "Blue", fstyle = "italic")
        # label margins
        # N.margin_top = N.margin_bottom = N.margin_left = 4.0
        S.margin_top = S.margin_bottom = S.margin_left = 4.0
        # labels aligned to the same level
        # l.add_face(N, 0)
        l.add_face(S, 0)
        # optionally colorize nodes too
        ns = NodeStyle()
        ns["fgcolor"] = "Red"
        l.img_style = ns


    # rendering to file
    t.render("tree.png", tree_style = ts)
    # t.show()


if __name__ == "__main__":
    main() 
