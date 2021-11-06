#snakefile

import pandas as pd

if not config:
    raise ValueError("A config file must be provided using --configfile")
    
    
 ####setup report ##############3   
    
configfile: "config/config.yaml"


def get_samples():
    """Returns list of all samples."""
    return list(config["samples"].keys())


def get_samples_for_group(wildcards):
    """Returns list of samples in given group."""
    return config["groups"][wildcards.group]

################################################################################
# Rules                                                                        #
################################################################################

def all_inputs(wildcards):
    inputs = ["qdnaseq/logratios.txt", "qc/multiqc_report.html"]

    samples = get_samples()
    inputs += expand("bam/final/{sample}.bam", sample=samples)
    inputs += expand("bam/final/{sample}.bam.bai", sample=samples)

    if config["options"]["TAPD"]["annotate"]:
        datatypes = ["calls", "logratios", "probs", "segmented"]	..............
        inputs += expand("TAPD/{datatype}.ann.txt", datatype=datatypes)

    return inputs




include: "rules/bunder_test.smk"
include: "rules/Counting_carriers.smk"
include: "rules/pre-procesing.smk"




rule all:
    input: all_inputs
    output: get_final_output()
            "results/"


