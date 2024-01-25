WORKDIR=../Tcoffee_1000_Better
nextflow run main.nf -c nextflow.config --input $WORKDIR/seqs_1000.fa --inputmode direct --mode famsa > $WORKDIR/nextflow.log.2 2> $WORKDIR/nextflow.err.log.2