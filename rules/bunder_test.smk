
rule burden_testing:
    input:
        "snpfile.txt"
        
    output:
        "burden.out.txt"
    
    shell:
        
        "Rscript code/burden.R --casefile code/casecounts.txt --casesize 100 --controlfile code/controlcounts.txt --controlsize 60000 --output burden.out.txt"
    
