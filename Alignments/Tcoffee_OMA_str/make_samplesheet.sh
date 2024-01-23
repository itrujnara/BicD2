echo "sample,fasta" > samplesheet_igor.csv

for seqfile in $(ls seqs)
do
    echo "${seqfile%.*},$(pwd)/seqs/${seqfile}" >> samplesheet_igor.csv
done
