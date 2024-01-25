#!/usr/bin/env nextflow
include { FAMSA_ALIGN } from './modules/nf-core/famsa/align/main'

nextflow.enable.dsl = 2

params.input = "samplesheet.csv"
params.outdir = "out"
params.mode = "tcoffee"
params.strdir = "."
params.inputmode = "samplesheet"

process APPEND {
    input:
    path content

    script:
    """
    cat $content >> target
    """

    output:
    path "target"
}

process TCOFFEE_ALIGN_SEQ {
    publishDir params.outdir, mode: "copy"
    
    input:
    path seqfile

    script:
    """
    t_coffee $seqfile
    """
}

process TCOFFE_ALIGN_STR {
    publishDir params.outdir, mode "copy"

    input:
    path seqfile

    script:
    """
    t_coffee $seqfile --mode tmalign_pair
    """
}

workflow READ_SAMPLES {
    take:
    samplesheet

    main:
    Channel
        .fromPath(samplesheet)
        .splitCsv( header:true, sep:',' )
        .set { sample_list }

    emit:
    sample_list
}

workflow TALIGN {
    if (params.inputmode == "samplesheet") {
        READ_SAMPLES(params.input)
        .map { it -> it.fasta }
        .set { files }

        APPEND(files)
        .collectFile(name: "seqs.fa")
        .set { seqfile }
    } else if (params.inputmode == "direct") {
        Channel
        .fromPath(params.input)
        .set { seqfile }
    }

    seqfile_meta = seqfile
        .map { it -> [[id: "bicd2"], it] }

    if (params.mode == "tcoffee") {
        TCOFFEE_ALIGN_SEQ(seqfile)
    } else if (params.mode == "famsa") {
        FAMSA_ALIGN(seqfile_meta, [[:],[]])
    }
}

workflow {
  TALIGN()
}