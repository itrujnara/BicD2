#!/bin/bash -ue
famsa -gt import null \
     \
    -t 1 \
    seqs_1000.fa \
    bicd2.aln

cat <<-END_VERSIONS > versions.yml
"TALIGN:FAMSA_ALIGN":
    famsa: $( famsa -help 2>&1 | head -n 2 | tail -n 1 | sed 's/ version //g' )
END_VERSIONS
