# PLINK (Plink/1.9 or PLINK/2)

> Open-source software used in human genomic analysis and population genetics. The name "PLINK" stands for "PLatform for the anaLysis of INteracting Genes."

* PED file

```hash

Family ID (if unknown use the same id as for the sample id in column two)
Sample ID
Paternal ID (if unknown use 0)
Maternal ID (if unknown use 0)
Sex (if unknown use 0)
Not used, set to 0
Rest of the columns: SNPs

```

* MAP file

```hash

Chromosome ID (e.g. Chr1 for Chromosome 1)
Unique SNP identifier
Genomic distance (if unknown use 0)
SNP Position

```
