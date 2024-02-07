WORKDIR=$(pwd)/../Tcoffee_OMA_seq
nextflow run main.nf -c nextflow.config --input $WORKDIR/seqs_oma_filtered.fa --inputmode direct --mode tcoffee -bg > $WORKDIR/nextflow.log 2> $WORKDIR/nextflow.err.log
