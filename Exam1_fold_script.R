#setting my directory
setwd("/Users/Laura/Desktop")

#downloading file on my desktop
targetfile <- "GSE1000_series_matrix.txt"

#downloading packages
library(affy)
library(limma)
library(getGEO)

#loading file into R 
gse <- getGEO(filename=targetfile)

#making sure data is loaded correctly
head(exprs(gse))

#taking logbase2 for all expression levels 
gse_log <- log2(exprs(gse))

#took average of first treatment and control log2 expression
treatment <- rowMeans(gse_log[,1:5])

control <- rowMeans(gse_log[,6:10])

#find the fold change
fold <- treatment/control
OR
fold <-rowMeans(gse_log[,1:5])/rowMeans(gse_log[,6:10])

#saving file as CSV
write.csv(fold, file="Exam1_fold.csv", row.names=FALSE)

#Plotting two boxplots on one panel and exporting as jPEG
jpeg('Exam1_plot_Cortes')
par(mfrow=c(1,2))
boxplot(treatment, col="green", main="Treatment")
boxplot(control, col="red", main="Control")
dev.off()


