#!/bin/bash -euo pipefail
if [ -d pdb_seqres/pdb_seqres.txt ]; then sed -i "/^\w*0/d" pdb_seqres/pdb_seqres.txt; fi
if [ -d params/alphafold_params_* ]; then ln -r -s params/alphafold_params_*/* params/; fi
python3 /app/alphafold/run_alphafold.py         --fasta_paths=T1024.1.fasta         --max_template_date=2020-05-14         --model_preset=monomer --pdb70_database_path=./pdb70/pdb70_from_mmcif_200916/pdb70          --db_preset=full_dbs --bfd_database_path=./bfd/bfd_metaclust_clu_complete_id30_c90_final_seq.sorted_opt --uniclust30_database_path=./uniclust30/uniclust30_2018_08/uniclust30_2018_08         --output_dir=$PWD         --data_dir=$PWD         --uniref90_database_path=./uniref90/uniref90.fasta         --mgnify_database_path=./mgnify/mgy_clusters_2018_12.fa         --template_mmcif_dir=./pdb_mmcif/mmcif_files         --obsolete_pdbs_path=./pdb_mmcif/obsolete.dat         --random_seed=53343         --use_gpu_relax=false

cp "T1024.1"/ranked_0.pdb ./"T1024.1".alphafold.pdb

cat <<-END_VERSIONS > versions.yml
"NFCORE_PROTEINFOLD:ALPHAFOLD2:RUN_AF2":
    python: $(python3 --version | sed 's/Python //g')
END_VERSIONS
