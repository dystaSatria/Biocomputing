#clear workspace
rm(list = ls())


# Plink bped to ped
system("plink --bfile fileName --cow --recode --out fileName")

# Plink bped to vcf
system("plink --bfile fileName --cow --recode vcf --out fileName")

# Plink ped to vcf
system("plink --file fileName --cow --recode vcf --out fileName")

