rm seqs_1000.fa

for acc in $(cat accessions_1000.txt)
do
curl https://rest.uniprot.org/uniprotkb/$acc.fasta >> seqs_1000.fa
done
