# GAPIT - Genomic Association and Prediction Integrated Tool
# Designed by Zhiwu Zhang
# Written by Zhiwu Zhang, Alex Lipka, Feng Tian, You Tang and Jiabo Wang
# Last update: Mar 27, 2022 for version 3
install.packages("httr")
library(httr)
set_config(config(ssl_verifypeer = 0L))

#install.packages("BiocManager")
#library(BiocManager)

if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install(version = "3.17")
#BiocManager::available()
#Install packages (Do this section only for new installation of R)
#-------------------------------------------------------------------------------
source("http://www.bioconductor.org/biocLite.R")
BiocManager::valid()
BiocManager("multtest")
install.packages("gplots")
install.packages("scatterplot3d")#The downloaded link at: http://cran.r-project.org/package=scatterplot3d

#Step 0: Import library and GAPIT functions run this section each time to start R)
#######################################################################################


source("http://www.zzlab.net/GAPIT/emma.txt")
source("http://www.zzlab.net/GAPIT/gapit_functions.txt")

source("/Users/Zhiwu/Dropbox/Current/revolutionr/gapit/gapit_functions.txt")
#############################################################################################

#download tutorial data and save them in myGAPIT directory under C drive and  run tutorials
setwd("/myGAPIT")


#Tutorial 1: Basic Scenario of Compressed MLM by Zhang and et. al. (Nature Genetics, 2010) 
#----------------------------------------------------------------------------------------
#Step 1: Set data directory and import files
myY  <- read.table("mdp_traits.txt", head = TRUE)
myG <- read.delim("mdp_genotype.hmp.txt", head = FALSE)

#Step 2: Run GAPIT
myGAPIT <- GAPIT(
  Y=myY,
  G=myG,
  PCA.total=3
)

#Tutorial 2: Using MLM 
#----------------------------------------------------------------------------------------
#Step 1: Set data directory and import files
myY  <- read.table("mdp_traits.txt", head = TRUE)
myG <- read.table("mdp_genotype.hmp.txt", head = FALSE)

#Step 2: Run GAPIT
myGAPIT <- GAPIT(
  Y=myY[,1:2],
  G=myG,
  PCA.total=3,
  model="MLM"
)

#Tutorial 3: User defined Kinship and PCs
#----------------------------------------------------------------------------------------
#Step 1: Set data directory and import files
myY  <- read.table("mdp_traits.txt", head = TRUE)
myG <- read.table("mdp_genotype_test.hmp.txt", head = FALSE)
myKI <- read.table("KSN.txt", head = FALSE)
myCV <- read.table("Copy of Q_First_Three_Principal_Components.txt", head = TRUE)

#Step 2: Run GAPIT
myGAPIT <- GAPIT(
  Y=myY[,1:2],
  G=myG,
  KI=myKI,
  CV=myCV,
)

#Tutorial 4: Genome Prediction
#----------------------------------------------------------------------------------------
#Step 1: Set data directory and import files
myY  <- read.table("mdp_traits.txt", head = TRUE)
myKI <- read.table("KSN.txt", head = FALSE)

#Step 2: Run GAPIT
myGAPIT <- GAPIT(
  Y=myY[,1:2],
  G=myG,
  KI=myKI,
  PCA.total=3,
  model=c("gBLUP")
)

#Tutorial 5: Numeric Genotype Format
#----------------------------------------------------------------------------------------
#Step 1: Set data directory and import files
myY  <- read.table("mdp_traits.txt", head = TRUE)
myGD <- read.table("mdp_numeric.txt", head = TRUE)
myGM <- read.table("mdp_SNP_information.txt" , head = TRUE)

#Step 2: Run GAPIT
myGAPIT <- GAPIT(
  Y=myY[,1:2],
  GD=myGD,
  GM=myGM,
  PCA.total=3
)

#Tutorial 6: SUPER GWAS method by Wang and et. al. (PLoS One, 2014)
#----------------------------------------------------------------------------------------
#Step 1: Set data directory and import files
myCV <- read.table("Copy of Q_First_Three_Principal_Components.txt", head = TRUE)
myY  <- read.table("mdp_traits.txt", head = TRUE)
myG <- read.table("mdp_genotype.hmp.txt" , head = FALSE)

#Step 2: Run GAPIT
myGAPIT_SUPER <- GAPIT(
  Y=myY[,1:2],			
  G=myG,				
  CV=myCV,
  #PCA.total=3,				
  model="SUPER" #options are GLM,MLM,CMLM, FaST and SUPER 
)


#Tutorial 7: Compare to Power against FDR for GLM,MLM,CMLM,ECMLM,SUPER
#Hint:Program runing time is more than 24 hours for repetition 50 times.
#----------------------------------------------------------------------------------------
#Step 1: Set data directory and import files
myGD <-read.table("mdp_numeric.txt", head = TRUE)
myGM <-read.table("mdp_SNP_information.txt", head = TRUE)
myKI <- read.table("KSN.txt", head = FALSE)
myG <- read.table("mdp_genotype.hmp.txt", head = FALSE)

#Step 2: Run GAPIT
GAPIT.Power.compare(
  GD=myGD,
  GM=myGM,
  WS=1000,
  nrep=50,
  h2=0.75,
  model=c("GLM","MLM","FarmCPU","Blink"),
  PCA.total=3,
  NQTN=20
)


#Tutorial 8: Marker density and decade of linkage disequilibrium over distance
#-----------------------------------------------------------------------------------------
#Step 1: Set data directory and import files

myGM <-read.table("mdp_SNP_information.txt", head = TRUE)
myGD <- read.table("mdp_numeric.txt", head = TRUE)

#Step 2: Run GAPIT

myGenotype<-GAPIT.Genotype.View(
  GI=myGM,
  X=myGD[,-1],
)

#Tutorial 9: Statistical distributions of phenotype
#-----------------------------------------------------------------------------------------
#Step 1: Set data directory and import files
myY  <- read.table("mdp_traits.txt", head = TRUE)

myPhenotype<-GAPIT.Phenotype.View(
  myY=myY
)

