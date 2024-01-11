#!/home/igor/anaconda3/bin/python
from Bio.PDB.DSSP import dssp_dict_from_pdb_file
import sys

if len(sys.argv) < 2:
    print("Input file required")
    exit(1)

dssp_tuple = dssp_dict_from_pdb_file(sys.argv[1], DSSP="dssp", dssp_version="4.0.4")
dssp_dict = dssp_tuple[0]
dssp_entries = [it[1][0:2] for it in list(dssp_dict.items())]
dssp_aas = ''.join(it[0] for it in dssp_entries)
dssp_sec = ''.join(it[1] for it in dssp_entries)
print(dssp_sec)
