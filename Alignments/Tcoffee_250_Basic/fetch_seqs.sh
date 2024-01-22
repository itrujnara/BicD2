for acc in $(cat accessions_250.txt)
do
curl https://rest.uniprot.org/uniprotkb/$acc.fasta >> seqs_250.fasta
done