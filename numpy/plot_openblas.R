library(ggplot2)
library(gridExtra)

for (alg in c('blas','fft','svd')) {

    # load data
    fdata <- paste("plot_", alg, "_openblas.dat", sep="")
    data <- read.table(fdata, quote="\"", comment.char="")

    # load size 100 data, and make plot
    size100 <- subset(data, V3 == 100)
    title <- paste("Numpy (", alg, " size 100)", sep="")
    p100 <- ggplot(size100) + geom_point(mapping=aes(x=V4, y=V5, color=V1)) + geom_errorbar(mapping=aes(x=V4,ymin=V5-V6,ymax=V5+V6,color=V1)) + labs(x="# jobs", y="elapsed time (microsec)", title=title) + theme(legend.title = element_blank())

    # load size 1000 data, and make plot
    size1000 <- subset(data, V3 == 1000)
    title <- paste("Numpy (", alg, " size 1000)", sep="")
    p1000 <- ggplot(size1000) + geom_point(mapping=aes(x=V4, y=V5, color=V1)) + geom_errorbar(mapping=aes(x=V4,ymin=V5-V6,ymax=V5+V6,color=V1)) + labs(x="# jobs", y="elapsed time (microsec)", title=title) + theme(legend.title = element_blank())

    # put two plots in one figure
    setEPS()
    postscript(paste("numpy_", alg, "_openblas.eps", sep=""),height=5,width=5,paper="special")
    grid.arrange(p100, p1000, nrow=2, ncol=1)
    dev.off()

    #multiplot(p100, p1000, cols=1)

    # save figure to PDF 
    #ggsave(paste("numpy_", alg, ".pdf", sep=""))
}
