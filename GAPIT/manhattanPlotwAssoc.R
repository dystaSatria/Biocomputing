library(qqman)

plink_command <- "plink"
plink_args <- c("--bfile", "toy", "--assoc", "--out", "output_path/output_prefix")
system2(plink_command, args = plink_args, stdout = TRUE)

assoc_results <- read.table("assoc_path/prefixAssoc.assoc", header = TRUE)

manhattan_plot <- manhattan(assoc_results, col = c("blue", "orange"), suggestiveline = -log10(1e-5), genomewideline = -log10(5e-8))

print(manhattan_plot)

