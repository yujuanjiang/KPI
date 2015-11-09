
# Get target directory
args <- commandArgs(TRUE)
workDir <- args[1]
sourceFile <- args[2]
option <- args[3]
#deliminator <- args[4] #"b"/"t" or "1"/"0"

setwd(workDir)

library(beanplot)

data = as.data.frame(read.csv(file=sourceFile, sep=";",header=T))

if(option == 1)
{
  aa=data[which(data$IFABANDONED==1),]
  bb=data[which(data$IFABANDONED==0),]

  pdf("abandonedCharacteriticsLOC.pdf",width=5,height=5) # set size of window
  par(mar=c(3.6,3.0,3.0,1.3)) # set margins
  beanplot(list(aa$LOC,bb$LOC),col=list("black","grey"),names=c("Abandoned","Non-abandoned"),side="b",ll=0,beanlines="median",overallline="median")

  pdf("abandonedCharacteriticsNumRevisionBean.pdf",width=5,height=5) # num of versions, beanplot
  par(mar=c(3.6,3.0,3.0,1.3)) # set margins
  beanplot(list(aa$NUMVERSIONS,bb$NUMVERSIONS),col=list("black","grey"),names=c("Abandoned","Non-abandoned"),side="b",ll=0,beanlines="median",overallline="median")

  pdf("abandonedCharacteriticsNumRevisionBox.pdf",width=5,height=5) # num of versions, boxplot
  par(mar=c(3.6,3.0,3.0,1.3)) # set margins
  boxplot(list(aa$NUMVERSIONS,bb$NUMVERSIONS),names=c("Abandoned","Non-abandoned"),log="y")
}

if(option == 2)
{
    aa=data[which(data$category=="b"),]
    bb=data[which(data$category=="t"),]

    pdf("contributionTime.pdf",width=5,height=5)
    par(mar=c(3.6,3.0,3.0,1.3)) # set margins
    beanplot(list(aa$contribution,bb$contribution),col=list("black","grey"),names=c("Branching","Toggling"),side="b",ll=0,beanlines="median",overallline="median")
    sink("R.txt",append=TRUE)
    cat("\n-------------- t-test for contribution time. Data source: sumMergeCommitByBranchOrca.txt ----------------")
    t.test(aa$contribution,bb$contribution)
}
