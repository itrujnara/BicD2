cat seqs_oma.fa | awk '{
        if (substr($0, 1, 1)==">") {filename=("seqs/" substr($1,2) ".fasta")}
        print $1 > filename
        close(filename)
}'
