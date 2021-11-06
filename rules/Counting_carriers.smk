rule gnomad:
    input:
        "snpfile.txt"
        
    output:
        "case_counts.txt"
    
    shell:
        "python code/count_controls.py -v data/gnomad.genomes.r2.1.1.sites.vcf.bgz.part -s snpfile.txt -o cohort/case_counts.txt [--snpformat --pop --database --pass --maxAC --maxAF --minAN -- popmaxAF 		--homcol --bedfile]"
        
    ###Añadir el resto de filtros
    
    
