
from os import path


rule bwa_index:
    input:
        "{genome}.vcf"
        
    output:
        "{genome}.vcf.gz"
    
    shell:
        "bcftools norm -m -any -f Homo_sapiens_assembly19.fasta {genome}.vcf.gz | bgzip > {genome}.vcf.gz"




rule vep:
    input:
        "{genome}.vcf.gz"
        
    output:
        "{genome}.txt"
    
    shell:
        "python make_snp_file.py --vcffile $vcffilename --outfile $outfilename --genecolname $genecol [--includeinfo --excludeinfo --includevep --excludevep --snpformat --bedfile --pass --genenull --vep --snponly --indelonly]"

###incluir criterios de filtracion

##otra forma simple de ponerlo:  ./vep -i input.vcf.gz -o output.txt



rule filter:
    input:
        ""
        
    output:
        ".bed"
    
    shell:
